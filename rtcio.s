#include "soc/rtc_cntl_reg.h"
#include "soc/rtc_io_reg.h"
#include "soc/soc_ulp.h"
#include "stack.s"
#include "mfrc522_constants.h"

#define PIN_SDA   10     // GPIO 4, RTC GPIO 10
#define PIN_RST   16     // GPIO 14, RTC GPIO 16
#define PIN_MOSI  9      // GPIO 32, RTC GPIO 9
#define PIN_MISO  14     // GPIO 13, RTC GPIO 14
#define PIN_SCK   8      // GPIO 33, RTC GPIO 8

#define ADC_CH_VBATT         0       // GPIO 36, ADC1 CH0
#define ADC_OVRSMP           10      // oversamping factor, as a result we have roughly 6000 counts per Volt (need to keep numbers below 32767)
#define VBATT_MIN            16915   // Minimum VBATT to wake up main CPU. 23400 = 4.15V ;  3.0 V = 16915
#define VBATT_LOW_MAXCOUNT   3       // number of consequtive measurements to be below VBATT_MIN to switch off

#define SET_PIN(PIN) WRITE_RTC_REG(RTC_GPIO_OUT_W1TS_REG,RTC_GPIO_OUT_DATA_W1TS_S+PIN,1,1)
#define CLEAR_PIN(PIN) WRITE_RTC_REG(RTC_GPIO_OUT_W1TC_REG,RTC_GPIO_OUT_DATA_W1TC_S+PIN,1,1)
#define GET_PIN(PIN) READ_RTC_REG(RTC_GPIO_IN_REG, RTC_GPIO_IN_NEXT_S + PIN, 1) 


  /* Define variables, which go into .bss section (zero-initialized data) */
  .bss

  .global stack
stack:
  .skip 8
  .global stackEnd
stackEnd:
  .long 0

  .global counter
counter:
  .long 0

  .global new_card_id_lo
new_card_id_lo:
  .long 0
  .global new_card_id_hi
new_card_id_hi:
  .long 0

  .global active_card_mutex_by_main_cpu
active_card_mutex_by_main_cpu:
  .long 0
  .global active_card_mutex_by_ulp_cpu
active_card_mutex_by_ulp_cpu:
  .long 0

  .global active_card_id_lo
active_card_id_lo:
  .long 0
  .global active_card_id_hi
active_card_id_hi:
  .long 0

  .global main_cpu_sleeps
main_cpu_sleeps:
  .long 0

  .global vbatt
vbatt:
  .long 0

  .global vbatt_low
vbatt_low:
  .long 0

  .global vbatt_low_counter
vbatt_low_counter:
  .long 0


  .global current_volume
current_volume:
  .long 0

  .global last_card_id
last_card_id:
  .long 0

  .global last_track
last_track:
  .long 0

  .global last_file_position
last_file_position:
  .long 0

  /* Define variables, which go into .data section (value-initialized data) */
  .data

  /* init_sequence is a sequence of address-value pairs, which is sent to the RC522 to enable
     detection of tags. */
  .global init_sequence
init_sequence:
  .byte TModeReg
  .byte 0x8D
  .skip 2
  .byte TPrescalerReg
  .byte 0x3E
  .skip 2
  .byte TReloadRegL
  .byte 0x30
  .skip 2
  .byte TReloadRegH
  .byte 0x00
  .skip 2
  .byte TxAutoReg
  .byte 0x40
  .skip 2
  .byte ModeReg
  .byte 0x3D
  .skip 2
  .byte TxControlReg
  .byte 0x83
  .skip 2
  .byte CommIEnReg
  .byte 0xF7
  .skip 2
  .byte FIFOLevelReg
  .byte 0x80  // flush fifo, really needed?
  .skip 2
  .byte FIFODataReg
  .byte MF1_REQIDL
  .skip 2
  .byte CommandReg
  .byte MFRC522_TRANSCEIVE
  .skip 2
  .byte BitFramingReg
  .byte 0x87
  .skip 2
  .global init_sequence_length
init_sequence_length:
  .long (init_sequence_length - init_sequence)/4

  /* getid_sequence is a sequence of address-value pairs, which is sent to the RC522 to read the tag
     UID after a tag has been detected. */
  .global getid_sequence
getid_sequence:
  .byte FIFOLevelReg
  .byte 0x80  // flush fifo
  .skip 2
  .byte FIFODataReg
  .byte MF1_ANTICOLL
  .skip 2
  .byte FIFODataReg
  .byte 0x20
  .skip 2
  .byte CommandReg
  .byte MFRC522_TRANSCEIVE
  .skip 2
  .byte BitFramingReg
  .byte 0x80
  .skip 2
  .global getid_sequence_length
getid_sequence_length:
  .long (getid_sequence_length - getid_sequence)/4

  /* Code goes into .text section */
  .text

  /******************************************************************************************************
   * 
   * Main program
   * 
   ******************************************************************************************************/
  .global entry
entry:
  // initialise stack pointer
  move r3, stackEnd

  /* Measure VBATT */
  move r2, 0
  stage_rst
measure:
  adc r1, 0, ADC_CH_VBATT + 1
  add r2, r2, r1
  stage_inc 1
  jumps measure, ADC_OVRSMP, lt
  assign vbatt, r2

  /* Check if below shutdown voltage */
  move r0, r2
  jumpr ok_vbatt, VBATT_MIN, GE

  // increment low battery counter
  fetch r2, vbatt_low_counter
  move r1, 1
  add r2, r2, r1
  assign vbatt_low_counter, r2

  // battery still assumed ok if counter below threshold
  move r0, r2
  jumpr ok_vbatt_keep_counter, VBATT_LOW_MAXCOUNT, LT

  // reduce wakeup frequency
  sleep 1

  // set flag to inform main CPU
  assign vbatt_low, 1

  // go to sleep
  jump sleep_ulp

  /* Battery level ok: program normal wakeup frequency and clear low battery flag */
ok_vbatt:
  assign vbatt_low_counter, 0

ok_vbatt_keep_counter:
  sleep 0
  assign vbatt_low, 0
   
  /* Disable hold of pins */
  WRITE_RTC_REG(RTC_IO_TOUCH_PAD0_REG,RTC_IO_TOUCH_PAD0_HOLD_S,1,0)   // GPIO 4, RTC GPIO 10
  WRITE_RTC_REG(RTC_IO_TOUCH_PAD6_REG,RTC_IO_TOUCH_PAD6_HOLD_S,1,0)   // GPIO 14, RTC GPIO 16
  WRITE_RTC_REG(RTC_IO_XTAL_32K_PAD_REG,RTC_IO_X32P_HOLD_S,1,0)       // GPIO 32, RTC GPIO 9
  WRITE_RTC_REG(RTC_IO_TOUCH_PAD4_REG,RTC_IO_TOUCH_PAD4_HOLD_S,1,0)   // GPIO 13, RTC GPIO 14
  WRITE_RTC_REG(RTC_IO_XTAL_32K_PAD_REG,RTC_IO_X32N_HOLD_S,1,0)       // GPIO 33, RTC GPIO 8

  .global loop
loop:

  // reset RC522 and initialise SPI
  CLEAR_PIN(PIN_RST)
  SET_PIN(PIN_SDA)
  SET_PIN(PIN_SCK)
  SET_PIN(PIN_MOSI)
  wait 100
  SET_PIN(PIN_RST)

  // Send the init_sequence to enable tag detection
  assign counter, 0
init_sequence_loop:

  fetch r1, counter
  fetch_array r1, init_sequence, r1
  move r2, r1
  rsh r2, r2, 8
  call SPI_SET

  increment counter, 1
  fetch r1, counter
  fetch r2, init_sequence_length
  sub r0, r2, r1
  jumpr init_sequence_loop, 0, GT

  // Init sequence has been sent, now wait for card detection: Poll RxIRq every 0.5ms, maximum 10 times
  assign counter, 0
detection_loop:

  wait 4000  // 0.5ms

  move r1, CommIrqReg
  call SPI_GET

  move r1, 0x20  // RxIRq bit set
  and r0, r1, r2
  jumpr card_detected, 0, GT

  increment counter, 1
  fetch r0, counter
  jumpr detection_loop, 10, LT

  // timout: clear card ID and go back to sleep
  jump no_card

  // Card has been detected: read the UID (send getid_sequence)
card_detected:

  assign counter, 0
getid_sequence_loop:

  fetch r1, counter
  fetch_array r1, getid_sequence, r1
  move r2, r1
  rsh r2, r2, 8
  call SPI_SET

  increment counter, 1
  fetch r1, counter
  fetch r2, getid_sequence_length
  sub r0, r2, r1
  jumpr getid_sequence_loop, 0, GT

  // UID has been requested, wait for response: Poll RxIRq every 1ms.
  assign counter, 0
getid_receive_loop:

  wait 8000  // 1ms

  move r1, CommIrqReg
  call SPI_GET

  move r1, 0x20  // RxIRq bit set
  and r0, r1, r2
  jumpr id_received, 0, GT

  increment counter, 1
  fetch r0, counter
  jumpr getid_receive_loop, 25, LT

  // Timeout: clear card ID and go back to sleep
  jump no_card

  // UID has been received: Read it from FIFO buffer
  // TODO: Error handling and make sure FIFO buffer contains the right amount of data!
id_received:

  move r1, FIFODataReg
  call SPI_GET
  lsh r2, r2, 8
  assign new_card_id_hi, r2

  move r1, FIFODataReg
  call SPI_GET
  fetch r1, new_card_id_hi
  or r2, r1, r2
  assign new_card_id_hi, r2

  move r1, FIFODataReg
  call SPI_GET
  lsh r2, r2, 8
  assign new_card_id_lo, r2

  move r1, FIFODataReg
  call SPI_GET
  fetch r1, new_card_id_lo
  or r2, r1, r2
  assign new_card_id_lo, r2

  // UID has been read, check if it has changed. If not, go back to sleep
  fetch r1, new_card_id_lo
  fetch r2, active_card_id_lo
  sub r0, r1, r2
  jumpr card_changed, 0, GT

  fetch r1, new_card_id_hi
  fetch r2, active_card_id_hi
  sub r0, r1, r2
  jumpr card_changed, 0, GT

  jump sleep_ulp

retry_spin_lock_card_changed:
  move r1, 0
  assign active_card_mutex_by_ulp_cpu, r1
  wait(100)
  
card_changed:
  // New UID detected: store UID as active card id and wake main CPU

  // acquire spin lock
  move r1, 1
  assign active_card_mutex_by_ulp_cpu, r1
  fetch r0, active_card_mutex_by_main_cpu
  jumpr retry_spin_lock_card_changed, 0, GT
  
  fetch r1, new_card_id_lo
  assign active_card_id_lo, r1
  fetch r1, new_card_id_hi
  assign active_card_id_hi, r1

  // release lock
  move r1, 0
  assign active_card_mutex_by_ulp_cpu, r1
  
wake_cpu:
  // only wake cpu if sleeping (or will sleep soon). otherwise the RTC_CNTL_RDY_FOR_WAKEUP will be never set
  fetch r0, main_cpu_sleeps
  jumpr sleep_ulp, 0, EQ  // main cpu not sleeping: ULP goes to sleep directly
  
  // main cpu is either already sleeping or about to sleep: wait until ready for wakeup
  READ_RTC_FIELD(RTC_CNTL_LOW_POWER_ST_REG, RTC_CNTL_RDY_FOR_WAKEUP)
  and r0, r0, 1
  jump wake_cpu, eq    // Retry until the bit is set

  // wake main cpu up and ULP goes to sleep
  wake
  jump sleep_ulp


retry_spin_lock_no_card:
  move r1, 0
  assign active_card_mutex_by_ulp_cpu, r1
  wait(100)
  
  // If no card is detected, clear last UID
no_card:
  // acquire spin lock
  move r1, 1
  assign active_card_mutex_by_ulp_cpu, r1
  fetch r0, active_card_mutex_by_main_cpu
  jumpr retry_spin_lock_no_card, 0, GT

  assign active_card_id_lo, 0
  assign active_card_id_hi, 0

  // release lock
  move r1, 0
  assign active_card_mutex_by_ulp_cpu, r1

  // Put ULP and RC522 to sleep
sleep_ulp:
  // disable MFRC522 power supply
  CLEAR_PIN(PIN_RST)

  /* Enable hold of pins */
  WRITE_RTC_REG(RTC_IO_TOUCH_PAD0_REG,RTC_IO_TOUCH_PAD0_HOLD_S,1,1)   // GPIO 4, RTC GPIO 10
  WRITE_RTC_REG(RTC_IO_TOUCH_PAD6_REG,RTC_IO_TOUCH_PAD6_HOLD_S,1,1)   // GPIO 14, RTC GPIO 16
  WRITE_RTC_REG(RTC_IO_XTAL_32K_PAD_REG,RTC_IO_X32P_HOLD_S,1,1)       // GPIO 32, RTC GPIO 9
  WRITE_RTC_REG(RTC_IO_TOUCH_PAD4_REG,RTC_IO_TOUCH_PAD4_HOLD_S,1,1)   // GPIO 13, RTC GPIO 14
  WRITE_RTC_REG(RTC_IO_XTAL_32K_PAD_REG,RTC_IO_X32N_HOLD_S,1,1)       // GPIO 33, RTC GPIO 8

  // sleep ULP program until next timer event
  halt


/******************************************************************************************************
 * Function: SPI_SET - set RC522 register through SPI
 *
 * r0 = internally used
 * r1 = register address
 * r2 = value to set
 ******************************************************************************************************/
  .global SPI_SET
SPI_SET:

  // start operation
  CLEAR_PIN(PIN_SDA)

  // -> send first byte: the address
  // left-shift address by 1, see MFRC522 data sheet section 8.1.2.3 "SPI address byte"
  lsh r1, r1, 1

  // reset loop counter
  stage_rst
spiSet_SendLoop1:
  SET_PIN(PIN_SCK)
  and r0, r1, 0x80
  jumpr spiSet_setPin1, 0x80, eq
  CLEAR_PIN(PIN_MOSI)
  jump spiSet_cont1
spiSet_setPin1:
  SET_PIN(PIN_MOSI)
spiSet_cont1:
  CLEAR_PIN(PIN_SCK)
  lsh r1, r1, 1
  stage_inc 1
  jumps spiSet_SendLoop1, 8, lt

  // terminate send
  SET_PIN(PIN_SCK)
  wait(5)

  // -> send second byte: the value

  // reset loop counter
  stage_rst
spiSet_sendLoop2:
  SET_PIN(PIN_SCK)
  and r0, r2, 0x80
  jumpr spiSet_setPin2, 0x80, eq
  CLEAR_PIN(PIN_MOSI)
  jump spiSet_cont2
spiSet_setPin2:
  SET_PIN(PIN_MOSI)
spiSet_cont2:
  CLEAR_PIN(PIN_SCK)
  lsh r2, r2, 1
  stage_inc 1
  jumps spiSet_sendLoop2, 8, lt

  // end operation
  SET_PIN(PIN_SCK)
  SET_PIN(PIN_SDA)
  SET_PIN(PIN_MOSI)
  wait(5)

  // return
  ret


/******************************************************************************************************
 * Function: SPI_GET - get RC522 register through SPI
 *
 * r0 = internally used
 * r1 = register address
 * r2 = value is returned here
 ******************************************************************************************************/
  .global SPI_GET
SPI_GET:

  // start operation
  CLEAR_PIN(PIN_SDA)

  // -> send first byte: the address
  // left-shift address by 1, see MFRC522 data sheet section 8.1.2.3 "SPI address byte"
  lsh r1, r1, 1
  // set uppermost bit to make read request
  or r1, r1, 0x80

  // reset loop counter
  stage_rst
spiGet_sendLoop:
  SET_PIN(PIN_SCK)
  and r0, r1, 0x80
  jumpr spiGet_setPin, 0x80, eq
  CLEAR_PIN(PIN_MOSI)
  jump spiGet_cont
spiGet_setPin:
  SET_PIN(PIN_MOSI)
spiGet_cont:
  CLEAR_PIN(PIN_SCK)
  lsh r1, r1, 1
  stage_inc 1
  jumps spiGet_sendLoop, 8, lt

  // terminate send
  SET_PIN(PIN_SCK)
  wait(5)

  // -> receive second byte: the value
  CLEAR_PIN(PIN_MOSI)

  // reset loop counter
  move r2, 0
  stage_rst
spiGet_receiveLoop:
  CLEAR_PIN(PIN_SCK)
  lsh r2, r2, 1
  SET_PIN(PIN_SCK)
  GET_PIN(PIN_MISO)
  or r2, r2, r0
  stage_inc 1
  jumps spiGet_receiveLoop, 8, lt

  // end operation
  SET_PIN(PIN_SDA)
  SET_PIN(PIN_MOSI)
  wait(5)

  // return
  ret
