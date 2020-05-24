EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L hardware-rescue:ESP32-WROOM-32-RF_Module-hardware-rescue U1
U 1 1 5E6E43BB
P 4900 4750
F 0 "U1" V 4200 3750 50  0000 C CNN
F 1 "ESP32-WROOM-32" V 4300 3750 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 4900 3250 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 4600 4800 50  0001 C CNN
	1    4900 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J4
U 1 1 5E6F2CCA
P 5950 2400
F 0 "J4" V 5914 2680 50  0000 L CNN
F 1 "PROG" V 5823 2680 50  0000 L CNN
F 2 "" H 5950 2400 50  0001 C CNN
F 3 "~" H 5950 2400 50  0001 C CNN
	1    5950 2400
	0    1    -1   0   
$EndComp
$Comp
L power:GNDD #PWR028
U 1 1 5E714318
P 6150 2800
F 0 "#PWR028" H 6150 2550 50  0001 C CNN
F 1 "GNDD" H 6154 2645 50  0000 C CNN
F 2 "" H 6150 2800 50  0001 C CNN
F 3 "" H 6150 2800 50  0001 C CNN
	1    6150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2600 6150 2800
Wire Wire Line
	5750 2600 5750 3650
Wire Wire Line
	5750 3650 5500 3650
Wire Wire Line
	5500 3850 5850 3850
Wire Wire Line
	5850 3850 5850 2600
Text Label 5750 2700 1    50   ~ 0
RX
Text Label 5850 2700 1    50   ~ 0
TX
Wire Wire Line
	4900 2900 4900 3250
$Comp
L power:GNDD #PWR021
U 1 1 5E739BDF
P 4900 6250
F 0 "#PWR021" H 4900 6000 50  0001 C CNN
F 1 "GNDD" H 4904 6095 50  0000 C CNN
F 2 "" H 4900 6250 50  0001 C CNN
F 3 "" H 4900 6250 50  0001 C CNN
	1    4900 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6150 4900 6250
$Comp
L Device:R R9
U 1 1 5E73CB6C
P 4000 3550
F 0 "R9" V 3793 3550 50  0000 C CNN
F 1 "10k" V 3884 3550 50  0000 C CNN
F 2 "" V 3930 3550 50  0001 C CNN
F 3 "~" H 4000 3550 50  0001 C CNN
	1    4000 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5E73D14D
P 5550 3250
F 0 "R11" H 5400 3300 50  0000 L CNN
F 1 "10k" H 5350 3200 50  0000 L CNN
F 2 "" V 5480 3250 50  0001 C CNN
F 3 "~" H 5550 3250 50  0001 C CNN
	1    5550 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3550 5550 3550
Wire Wire Line
	5550 3550 5550 3400
Wire Wire Line
	4300 3550 4200 3550
Wire Wire Line
	5550 3000 5550 3100
Wire Wire Line
	3750 3450 3750 3550
Wire Wire Line
	3750 3550 3850 3550
Wire Wire Line
	5650 2600 5650 3550
Wire Wire Line
	5650 3550 5550 3550
Connection ~ 5550 3550
Wire Wire Line
	6050 2600 6050 3050
Wire Wire Line
	6050 3050 4200 3050
Wire Wire Line
	4200 3050 4200 3550
Connection ~ 4200 3550
Wire Wire Line
	4200 3550 4150 3550
Text Label 5650 2700 1    50   ~ 0
DTR
Text Label 6050 2700 1    50   ~ 0
RTS
$Comp
L Switch:SW_Push SW3
U 1 1 5E7202B3
P 2550 6850
F 0 "SW3" V 2504 6998 50  0000 L CNN
F 1 "Trk next" V 2595 6998 50  0000 L CNN
F 2 "" H 2550 7050 50  0001 C CNN
F 3 "~" H 2550 7050 50  0001 C CNN
	1    2550 6850
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5E720B1F
P 3150 6850
F 0 "SW4" V 3104 6998 50  0000 L CNN
F 1 "Trk prev" V 3195 6998 50  0000 L CNN
F 2 "" H 3150 7050 50  0001 C CNN
F 3 "~" H 3150 7050 50  0001 C CNN
	1    3150 6850
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5E721055
P 1950 6850
F 0 "SW2" V 1904 6998 50  0000 L CNN
F 1 "Vol up" V 1995 6998 50  0000 L CNN
F 2 "" H 1950 7050 50  0001 C CNN
F 3 "~" H 1950 7050 50  0001 C CNN
	1    1950 6850
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5E7213D4
P 1350 6850
F 0 "SW1" V 1304 6998 50  0000 L CNN
F 1 "Vol down" V 1395 6998 50  0000 L CNN
F 2 "" H 1350 7050 50  0001 C CNN
F 3 "~" H 1350 7050 50  0001 C CNN
	1    1350 6850
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR02
U 1 1 5E724B03
P 1350 7050
F 0 "#PWR02" H 1350 6800 50  0001 C CNN
F 1 "GNDD" H 1354 6895 50  0000 C CNN
F 2 "" H 1350 7050 50  0001 C CNN
F 3 "" H 1350 7050 50  0001 C CNN
	1    1350 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR06
U 1 1 5E724CBA
P 1950 7050
F 0 "#PWR06" H 1950 6800 50  0001 C CNN
F 1 "GNDD" H 1954 6895 50  0000 C CNN
F 2 "" H 1950 7050 50  0001 C CNN
F 3 "" H 1950 7050 50  0001 C CNN
	1    1950 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR011
U 1 1 5E724E0D
P 2550 7050
F 0 "#PWR011" H 2550 6800 50  0001 C CNN
F 1 "GNDD" H 2554 6895 50  0000 C CNN
F 2 "" H 2550 7050 50  0001 C CNN
F 3 "" H 2550 7050 50  0001 C CNN
	1    2550 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR014
U 1 1 5E724F18
P 3150 7050
F 0 "#PWR014" H 3150 6800 50  0001 C CNN
F 1 "GNDD" H 3154 6895 50  0000 C CNN
F 2 "" H 3150 7050 50  0001 C CNN
F 3 "" H 3150 7050 50  0001 C CNN
	1    3150 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR035
U 1 1 5E748F62
P 7750 900
F 0 "#PWR035" H 7750 750 50  0001 C CNN
F 1 "+5VA" H 7765 1073 50  0000 C CNN
F 2 "" H 7750 900 50  0001 C CNN
F 3 "" H 7750 900 50  0001 C CNN
	1    7750 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VDAC #PWR048
U 1 1 5E749CCF
P 10600 900
F 0 "#PWR048" H 10750 850 50  0001 C CNN
F 1 "+3.3VDAC" H 10620 1043 50  0000 C CNN
F 2 "" H 10600 900 50  0001 C CNN
F 3 "" H 10600 900 50  0001 C CNN
	1    10600 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR015
U 1 1 5E74A254
P 3750 3450
F 0 "#PWR015" H 3750 3300 50  0001 C CNN
F 1 "+3.3V" H 3765 3623 50  0000 C CNN
F 2 "" H 3750 3450 50  0001 C CNN
F 3 "" H 3750 3450 50  0001 C CNN
	1    3750 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR036
U 1 1 5E74AA96
P 7750 1350
F 0 "#PWR036" H 7750 1100 50  0001 C CNN
F 1 "GNDA" H 7755 1177 50  0000 C CNN
F 2 "" H 7750 1350 50  0001 C CNN
F 3 "" H 7750 1350 50  0001 C CNN
	1    7750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR030
U 1 1 5E74ABBC
P 6900 1350
F 0 "#PWR030" H 6900 1100 50  0001 C CNN
F 1 "GNDD" H 6904 1195 50  0000 C CNN
F 2 "" H 6900 1350 50  0001 C CNN
F 3 "" H 6900 1350 50  0001 C CNN
	1    6900 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5E74BF76
P 8550 1150
F 0 "C12" H 8665 1196 50  0000 L CNN
F 1 "4.7uF" H 8665 1105 50  0000 L CNN
F 2 "" H 8588 1000 50  0001 C CNN
F 3 "~" H 8550 1150 50  0001 C CNN
	1    8550 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C9
U 1 1 5E74CE01
P 7750 1150
F 0 "C9" H 7868 1196 50  0000 L CNN
F 1 "1.5F" H 7868 1105 50  0000 L CNN
F 2 "" H 7788 1000 50  0001 C CNN
F 3 "~" H 7750 1150 50  0001 C CNN
	1    7750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 900  6900 1000
Wire Wire Line
	6900 1300 6900 1350
Wire Wire Line
	7750 1300 7750 1350
$Comp
L Device:C C17
U 1 1 5E77FC4F
P 10600 1150
F 0 "C17" H 10715 1196 50  0000 L CNN
F 1 "4.7uF" H 10715 1105 50  0000 L CNN
F 2 "" H 10638 1000 50  0001 C CNN
F 3 "~" H 10600 1150 50  0001 C CNN
	1    10600 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR049
U 1 1 5E7A35F7
P 10600 1350
F 0 "#PWR049" H 10600 1100 50  0001 C CNN
F 1 "GNDA" H 10605 1177 50  0000 C CNN
F 2 "" H 10600 1350 50  0001 C CNN
F 3 "" H 10600 1350 50  0001 C CNN
	1    10600 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 1300 8550 1350
Wire Wire Line
	10600 1300 10600 1350
$Comp
L Device:C C5
U 1 1 5E7B8DAB
P 4650 3250
F 0 "C5" V 4398 3250 50  0000 C CNN
F 1 "10uF" V 4489 3250 50  0000 C CNN
F 2 "" H 4688 3100 50  0001 C CNN
F 3 "~" H 4650 3250 50  0001 C CNN
	1    4650 3250
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR019
U 1 1 5E7BE847
P 4500 3250
F 0 "#PWR019" H 4500 3000 50  0001 C CNN
F 1 "GNDD" H 4504 3095 50  0000 C CNN
F 2 "" H 4500 3250 50  0001 C CNN
F 3 "" H 4500 3250 50  0001 C CNN
	1    4500 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 3250 4900 3250
Connection ~ 4900 3250
Wire Wire Line
	4900 3250 4900 3350
$Comp
L power:GNDD #PWR01
U 1 1 5E739643
P 1150 1550
F 0 "#PWR01" H 1150 1300 50  0001 C CNN
F 1 "GNDD" H 1154 1395 50  0000 C CNN
F 2 "" H 1150 1550 50  0001 C CNN
F 3 "" H 1150 1550 50  0001 C CNN
	1    1150 1550
	1    0    0    -1  
$EndComp
Text Label 5500 3950 0    50   ~ 0
RFID-SDA
Text Label 5500 5650 0    50   ~ 0
RFID-SCK
Text Label 5500 5550 0    50   ~ 0
RFID-MOSI
Text Label 5500 4250 0    50   ~ 0
RFID-MISO
Text Label 5500 4350 0    50   ~ 0
RFID-RST
Text Label 5500 4850 0    50   ~ 0
SD-MISO
Text Label 5500 5150 0    50   ~ 0
SD-MOSI
Text Label 5500 4750 0    50   ~ 0
SD-SCK
Text Label 1350 6650 1    50   ~ 0
VOL_DOWN
Text Label 5500 4450 0    50   ~ 0
VOL_DOWN
Text Label 1950 6650 1    50   ~ 0
VOL_UP
Text Label 5500 5050 0    50   ~ 0
VOL_UP
Text Label 2550 6650 1    50   ~ 0
TRK_NEXT
Text Label 5500 4550 0    50   ~ 0
TRK_NEXT
Text Label 3150 6650 1    50   ~ 0
TRK_PREV
Text Label 5500 4650 0    50   ~ 0
TRK_PREV
Text Label 5500 5350 0    50   ~ 0
I2S_LRCK
Text Label 5500 5250 0    50   ~ 0
I2S_DATA
Text Label 5500 5450 0    50   ~ 0
I2S_BCK
Text Label 5500 4950 0    50   ~ 0
POWER_CTRL
$Comp
L XRP6272:XRP6272 U2
U 1 1 5E92EF18
P 4950 800
F 0 "U2" H 4975 765 50  0000 C CNN
F 1 "XRP6272" H 4975 674 50  0000 C CNN
F 2 "" H 4950 800 50  0001 C CNN
F 3 "" H 4950 800 50  0001 C CNN
	1    4950 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR018
U 1 1 5E943686
P 4500 1350
F 0 "#PWR018" H 4500 1100 50  0001 C CNN
F 1 "GNDD" H 4504 1195 50  0000 C CNN
F 2 "" H 4500 1350 50  0001 C CNN
F 3 "" H 4500 1350 50  0001 C CNN
	1    4500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1250 4500 1250
Wire Wire Line
	4500 1250 4500 1350
Wire Wire Line
	4600 1150 4500 1150
Wire Wire Line
	4500 1150 4500 1050
Connection ~ 4500 1050
Wire Wire Line
	4500 1050 4600 1050
$Comp
L Device:R R10
U 1 1 5E94C408
P 5400 1350
F 0 "R10" H 5470 1396 50  0000 L CNN
F 1 "100k" H 5470 1305 50  0000 L CNN
F 2 "" V 5330 1350 50  0001 C CNN
F 3 "~" H 5400 1350 50  0001 C CNN
	1    5400 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5E94C75C
P 5700 1150
F 0 "R12" V 5493 1150 50  0000 C CNN
F 1 "330k" V 5584 1150 50  0000 C CNN
F 2 "" V 5630 1150 50  0001 C CNN
F 3 "~" H 5700 1150 50  0001 C CNN
	1    5700 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1150 5400 1150
Wire Wire Line
	5400 1150 5400 1200
Wire Wire Line
	5400 1150 5550 1150
Connection ~ 5400 1150
$Comp
L power:GNDD #PWR022
U 1 1 5E955619
P 5400 1500
F 0 "#PWR022" H 5400 1250 50  0001 C CNN
F 1 "GNDD" H 5404 1345 50  0000 C CNN
F 2 "" H 5400 1500 50  0001 C CNN
F 3 "" H 5400 1500 50  0001 C CNN
	1    5400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1050 5950 1150
Wire Wire Line
	5950 1150 5850 1150
$Comp
L Device:C C4
U 1 1 5E95BAFE
P 4100 1200
F 0 "C4" H 4215 1246 50  0000 L CNN
F 1 "4.7uF" H 4215 1155 50  0000 L CNN
F 2 "" H 4138 1050 50  0001 C CNN
F 3 "~" H 4100 1200 50  0001 C CNN
	1    4100 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR017
U 1 1 5E95BF90
P 4100 1350
F 0 "#PWR017" H 4100 1100 50  0001 C CNN
F 1 "GNDD" H 4104 1195 50  0000 C CNN
F 2 "" H 4100 1350 50  0001 C CNN
F 3 "" H 4100 1350 50  0001 C CNN
	1    4100 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5E95C39E
P 6100 1200
F 0 "C6" H 6215 1246 50  0000 L CNN
F 1 "4.7uF" H 6215 1155 50  0000 L CNN
F 2 "" H 6138 1050 50  0001 C CNN
F 3 "~" H 6100 1200 50  0001 C CNN
	1    6100 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1050 5950 1050
Wire Wire Line
	5950 1050 6100 1050
Connection ~ 5950 1050
$Comp
L power:GNDD #PWR027
U 1 1 5E963A75
P 6100 1350
F 0 "#PWR027" H 6100 1100 50  0001 C CNN
F 1 "GNDD" H 6104 1195 50  0000 C CNN
F 2 "" H 6100 1350 50  0001 C CNN
F 3 "" H 6100 1350 50  0001 C CNN
	1    6100 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1050 4500 1050
Wire Wire Line
	10600 900  10600 1000
$Comp
L Device:L_Coupled L1
U 1 1 5E9A568F
P 7350 1150
F 0 "L1" H 7350 1431 50  0000 C CNN
F 1 "L_Coupled" H 7350 1340 50  0000 C CNN
F 2 "" H 7350 1150 50  0001 C CNN
F 3 "~" H 7350 1150 50  0001 C CNN
	1    7350 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1050 7150 1000
Wire Wire Line
	7150 1000 6900 1000
Wire Wire Line
	7150 1250 7150 1300
Wire Wire Line
	7150 1300 6900 1300
Wire Wire Line
	7550 1050 7550 1000
Wire Wire Line
	7550 1000 7750 1000
Wire Wire Line
	7550 1250 7550 1300
Wire Wire Line
	7550 1300 7750 1300
Connection ~ 7750 1300
Wire Wire Line
	2050 2500 1650 2500
Wire Wire Line
	2050 2800 1650 2800
Wire Wire Line
	2050 2900 1650 2900
Wire Wire Line
	2050 3000 1650 3000
Wire Wire Line
	2050 3100 1650 3100
$Comp
L power:+3.3V #PWR07
U 1 1 5E74A136
P 2200 2400
F 0 "#PWR07" H 2200 2250 50  0001 C CNN
F 1 "+3.3V" H 2215 2573 50  0000 C CNN
F 2 "" H 2200 2400 50  0001 C CNN
F 3 "" H 2200 2400 50  0001 C CNN
	1    2200 2400
	1    0    0    -1  
$EndComp
Text Label 1850 4400 2    50   ~ 0
SD-CS
Text Label 1850 4600 2    50   ~ 0
SD-SCK
Text Label 1850 4500 2    50   ~ 0
SD-MOSI
Text Label 1850 4100 2    50   ~ 0
SD-MISO
Text Label 2050 2500 2    50   ~ 0
RFID-RST
$Comp
L power:GNDD #PWR08
U 1 1 5E704E6B
P 2200 2600
F 0 "#PWR08" H 2200 2350 50  0001 C CNN
F 1 "GNDD" H 2204 2445 50  0000 C CNN
F 2 "" H 2200 2600 50  0001 C CNN
F 3 "" H 2200 2600 50  0001 C CNN
	1    2200 2600
	1    0    0    -1  
$EndComp
Text Label 2050 2800 2    50   ~ 0
RFID-MISO
Text Label 2050 2900 2    50   ~ 0
RFID-MOSI
Text Label 2050 3000 2    50   ~ 0
RFID-SCK
Text Label 2050 3100 2    50   ~ 0
RFID-SDA
$Comp
L power:GNDD #PWR05
U 1 1 5E700E8C
P 1650 5450
F 0 "#PWR05" H 1650 5200 50  0001 C CNN
F 1 "GNDD" H 1654 5295 50  0000 C CNN
F 2 "" H 1650 5450 50  0001 C CNN
F 3 "" H 1650 5450 50  0001 C CNN
	1    1650 5450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5E6E555E
P 1450 2800
F 0 "J2" H 1530 2792 50  0000 L CNN
F 1 "RFID-RC522" H 1530 2701 50  0000 L CNN
F 2 "" H 1450 2800 50  0001 C CNN
F 3 "~" H 1450 2800 50  0001 C CNN
	1    1450 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 2600 2200 2600
Wire Wire Line
	1650 2400 2200 2400
$Comp
L power:+3.3V #PWR020
U 1 1 5EA0DAD7
P 4900 2900
F 0 "#PWR020" H 4900 2750 50  0001 C CNN
F 1 "+3.3V" H 4915 3073 50  0000 C CNN
F 2 "" H 4900 2900 50  0001 C CNN
F 3 "" H 4900 2900 50  0001 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR025
U 1 1 5EA0E2C5
P 5550 3000
F 0 "#PWR025" H 5550 2850 50  0001 C CNN
F 1 "+3.3V" H 5565 3173 50  0000 C CNN
F 2 "" H 5550 3000 50  0001 C CNN
F 3 "" H 5550 3000 50  0001 C CNN
	1    5550 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR026
U 1 1 5EA0EA78
P 6100 1050
F 0 "#PWR026" H 6100 900 50  0001 C CNN
F 1 "+3.3V" H 6115 1223 50  0000 C CNN
F 2 "" H 6100 1050 50  0001 C CNN
F 3 "" H 6100 1050 50  0001 C CNN
	1    6100 1050
	1    0    0    -1  
$EndComp
Connection ~ 6100 1050
$Comp
L power:+5VA #PWR039
U 1 1 5EA218E5
P 8550 900
F 0 "#PWR039" H 8550 750 50  0001 C CNN
F 1 "+5VA" H 8565 1073 50  0000 C CNN
F 2 "" H 8550 900 50  0001 C CNN
F 3 "" H 8550 900 50  0001 C CNN
	1    8550 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR045
U 1 1 5EA24CA8
P 9850 1450
F 0 "#PWR045" H 9850 1200 50  0001 C CNN
F 1 "GNDA" H 9855 1277 50  0000 C CNN
F 2 "" H 9850 1450 50  0001 C CNN
F 3 "" H 9850 1450 50  0001 C CNN
	1    9850 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR040
U 1 1 5EA24EEF
P 8550 1350
F 0 "#PWR040" H 8550 1100 50  0001 C CNN
F 1 "GNDA" H 8555 1177 50  0000 C CNN
F 2 "" H 8550 1350 50  0001 C CNN
F 3 "" H 8550 1350 50  0001 C CNN
	1    8550 1350
	1    0    0    -1  
$EndComp
Text Label 5500 4050 0    50   ~ 0
SD-CS
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5EC12514
P 900 1350
F 0 "J1" H 818 1025 50  0000 C CNN
F 1 "BATT" H 818 1116 50  0000 C CNN
F 2 "" H 900 1350 50  0001 C CNN
F 3 "~" H 900 1350 50  0001 C CNN
	1    900  1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 1350 1150 1350
Wire Wire Line
	1150 1350 1150 1550
$Comp
L power:+BATT #PWR03
U 1 1 5EC2E9DA
P 1550 1150
F 0 "#PWR03" H 1550 1000 50  0001 C CNN
F 1 "+BATT" H 1565 1323 50  0000 C CNN
F 2 "" H 1550 1150 50  0001 C CNN
F 3 "" H 1550 1150 50  0001 C CNN
	1    1550 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1150 1550 1250
Wire Wire Line
	1100 1250 1250 1250
$Comp
L power:+BATT #PWR016
U 1 1 5EC330C9
P 4100 1050
F 0 "#PWR016" H 4100 900 50  0001 C CNN
F 1 "+BATT" H 4115 1223 50  0000 C CNN
F 2 "" H 4100 1050 50  0001 C CNN
F 3 "" H 4100 1050 50  0001 C CNN
	1    4100 1050
	1    0    0    -1  
$EndComp
Connection ~ 4100 1050
$Comp
L power:+BATT #PWR029
U 1 1 5EC33994
P 6900 900
F 0 "#PWR029" H 6900 750 50  0001 C CNN
F 1 "+BATT" H 6915 1073 50  0000 C CNN
F 2 "" H 6900 900 50  0001 C CNN
F 3 "" H 6900 900 50  0001 C CNN
	1    6900 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5EC45674
P 2400 1050
F 0 "R7" H 2470 1096 50  0000 L CNN
F 1 "100k" H 2470 1005 50  0000 L CNN
F 2 "" V 2330 1050 50  0001 C CNN
F 3 "~" H 2400 1050 50  0001 C CNN
	1    2400 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5EC4637C
P 2400 1350
F 0 "R8" H 2470 1396 50  0000 L CNN
F 1 "100k" H 2470 1305 50  0000 L CNN
F 2 "" V 2330 1350 50  0001 C CNN
F 3 "~" H 2400 1350 50  0001 C CNN
	1    2400 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR09
U 1 1 5EC4670E
P 2400 900
F 0 "#PWR09" H 2400 750 50  0001 C CNN
F 1 "+BATT" H 2415 1073 50  0000 C CNN
F 2 "" H 2400 900 50  0001 C CNN
F 3 "" H 2400 900 50  0001 C CNN
	1    2400 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR010
U 1 1 5EC4692A
P 2400 1500
F 0 "#PWR010" H 2400 1250 50  0001 C CNN
F 1 "GNDD" H 2404 1345 50  0000 C CNN
F 2 "" H 2400 1500 50  0001 C CNN
F 3 "" H 2400 1500 50  0001 C CNN
	1    2400 1500
	1    0    0    -1  
$EndComp
Text Label 3300 1200 2    50   ~ 0
VBATT_MEAS
$Comp
L Device:C C3
U 1 1 5EC4BD9B
P 2800 1400
F 0 "C3" H 2915 1446 50  0000 L CNN
F 1 "220nF" H 2915 1355 50  0000 L CNN
F 2 "" H 2838 1250 50  0001 C CNN
F 3 "~" H 2800 1400 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
Connection ~ 2400 1200
$Comp
L power:GNDD #PWR012
U 1 1 5EC4FCB7
P 2800 1550
F 0 "#PWR012" H 2800 1300 50  0001 C CNN
F 1 "GNDD" H 2804 1395 50  0000 C CNN
F 2 "" H 2800 1550 50  0001 C CNN
F 3 "" H 2800 1550 50  0001 C CNN
	1    2800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1200 2800 1200
Connection ~ 2800 1200
Wire Wire Line
	2800 1200 2800 1250
Wire Wire Line
	2400 1200 2800 1200
Text Label 3800 3750 0    50   ~ 0
VBATT_MEAS
Wire Wire Line
	3800 3750 4300 3750
$Comp
L MicroSD_Slot:104031-0811 J3
U 1 1 5EC7CD69
P 2350 4650
F 0 "J3" H 2350 5417 50  0000 C CNN
F 1 "104031-0811" H 2350 5326 50  0000 C CNN
F 2 "MOLEX_104031-0811" H 2350 4650 50  0001 L BNN
F 3 "1.17 USD" H 2350 4650 50  0001 L BNN
F 4 "104031-0811" H 2350 4650 50  0001 L BNN "MP"
F 5 "None" H 2350 4650 50  0001 L BNN "Package"
F 6 "Good" H 2350 4650 50  0001 L BNN "Availability"
F 7 "1.10mm Pitch microSD Memory Card Connector%2C SMT%2C Push-Pull Type%2C 1.42mm Height%2C with Detect Switch" H 2350 4650 50  0001 L BNN "Description"
F 8 "Molex" H 2350 4650 50  0001 L BNN "MF"
	1    2350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR04
U 1 1 5ECC2179
P 1650 5100
F 0 "#PWR04" H 1650 4950 50  0001 C CNN
F 1 "+3.3V" H 1665 5273 50  0000 C CNN
F 2 "" H 1650 5100 50  0001 C CNN
F 3 "" H 1650 5100 50  0001 C CNN
	1    1650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5100 1850 5100
Wire Wire Line
	1650 5200 1850 5200
$Comp
L Device:C C2
U 1 1 5ECF7E4C
P 1250 5250
F 0 "C2" H 1365 5296 50  0000 L CNN
F 1 "100nF" H 1365 5205 50  0000 L CNN
F 2 "" H 1288 5100 50  0001 C CNN
F 3 "~" H 1250 5250 50  0001 C CNN
	1    1250 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5ECFC447
P 800 5250
F 0 "C1" H 915 5296 50  0000 L CNN
F 1 "10uF" H 915 5205 50  0000 L CNN
F 2 "" H 838 5100 50  0001 C CNN
F 3 "~" H 800 5250 50  0001 C CNN
	1    800  5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5200 1650 5400
Wire Wire Line
	800  5100 1250 5100
Connection ~ 1250 5100
Wire Wire Line
	1250 5100 1650 5100
Connection ~ 1650 5100
Wire Wire Line
	800  5400 1250 5400
Connection ~ 1250 5400
Wire Wire Line
	1250 5400 1650 5400
Connection ~ 1650 5400
Wire Wire Line
	1650 5400 1650 5450
$Comp
L XRP6272:XRP6272 U3
U 1 1 5ED6522D
P 9400 750
F 0 "U3" H 9425 715 50  0000 C CNN
F 1 "XRP6272" H 9425 624 50  0000 C CNN
F 2 "" H 9400 750 50  0001 C CNN
F 3 "" H 9400 750 50  0001 C CNN
	1    9400 750 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5ED7CD74
P 9850 1250
F 0 "R17" H 9920 1296 50  0000 L CNN
F 1 "100k" H 9920 1205 50  0000 L CNN
F 2 "" V 9780 1250 50  0001 C CNN
F 3 "~" H 9850 1250 50  0001 C CNN
	1    9850 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5ED864D9
P 10150 1100
F 0 "R18" V 9943 1100 50  0000 C CNN
F 1 "330k" V 10034 1100 50  0000 C CNN
F 2 "" V 10080 1100 50  0001 C CNN
F 3 "~" H 10150 1100 50  0001 C CNN
	1    10150 1100
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR044
U 1 1 5ED87976
P 9050 1350
F 0 "#PWR044" H 9050 1100 50  0001 C CNN
F 1 "GNDA" H 9055 1177 50  0000 C CNN
F 2 "" H 9050 1350 50  0001 C CNN
F 3 "" H 9050 1350 50  0001 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1200 9050 1350
Wire Wire Line
	8550 1000 9050 1000
Wire Wire Line
	9750 1100 9850 1100
Connection ~ 9850 1100
Wire Wire Line
	9850 1100 10000 1100
Wire Wire Line
	9750 1000 10400 1000
Wire Wire Line
	10300 1100 10400 1100
Wire Wire Line
	10400 1100 10400 1000
Wire Wire Line
	10400 1000 10600 1000
Connection ~ 10400 1000
Connection ~ 10600 1000
Text Label 8950 700  0    50   ~ 0
POWER_CTRL
Wire Wire Line
	8950 700  8950 1100
Wire Wire Line
	8950 1100 9050 1100
$Comp
L Device:R R6
U 1 1 5EDECF1B
P 1350 4600
F 0 "R6" V 1143 4600 50  0000 C CNN
F 1 "47k" V 1234 4600 50  0000 C CNN
F 2 "" V 1280 4600 50  0001 C CNN
F 3 "~" H 1350 4600 50  0001 C CNN
	1    1350 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5EDEEF9D
P 1100 4500
F 0 "R4" V 893 4500 50  0000 C CNN
F 1 "47k" V 984 4500 50  0000 C CNN
F 2 "" V 1030 4500 50  0001 C CNN
F 3 "~" H 1100 4500 50  0001 C CNN
	1    1100 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5EDEF1AA
P 850 4400
F 0 "R2" V 643 4400 50  0000 C CNN
F 1 "47k" V 734 4400 50  0000 C CNN
F 2 "" V 780 4400 50  0001 C CNN
F 3 "~" H 850 4400 50  0001 C CNN
	1    850  4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5EDEF4BE
P 850 4100
F 0 "R1" V 643 4100 50  0000 C CNN
F 1 "47k" V 734 4100 50  0000 C CNN
F 2 "" V 780 4100 50  0001 C CNN
F 3 "~" H 850 4100 50  0001 C CNN
	1    850  4100
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 4600 1850 4600
Wire Wire Line
	1250 4500 1850 4500
Wire Wire Line
	1000 4400 1850 4400
Wire Wire Line
	600  4100 600  4200
Wire Wire Line
	600  5100 800  5100
Connection ~ 800  5100
Wire Wire Line
	700  4400 600  4400
Connection ~ 600  4400
Wire Wire Line
	600  4400 600  4500
Wire Wire Line
	950  4500 600  4500
Connection ~ 600  4500
Wire Wire Line
	600  4500 600  4600
Wire Wire Line
	1200 4600 600  4600
Connection ~ 600  4600
Wire Wire Line
	600  4600 600  5100
$Comp
L Device:R R3
U 1 1 5EE15CBB
P 1100 4200
F 0 "R3" V 893 4200 50  0000 C CNN
F 1 "47k" V 984 4200 50  0000 C CNN
F 2 "" V 1030 4200 50  0001 C CNN
F 3 "~" H 1100 4200 50  0001 C CNN
	1    1100 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5EE15F74
P 1350 4300
F 0 "R5" V 1143 4300 50  0000 C CNN
F 1 "47k" V 1234 4300 50  0000 C CNN
F 2 "" V 1280 4300 50  0001 C CNN
F 3 "~" H 1350 4300 50  0001 C CNN
	1    1350 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 4300 1850 4300
Wire Wire Line
	1200 4300 600  4300
Connection ~ 600  4300
Wire Wire Line
	600  4300 600  4400
Wire Wire Line
	950  4200 600  4200
Connection ~ 600  4200
Wire Wire Line
	600  4200 600  4300
Wire Wire Line
	600  4100 700  4100
Wire Wire Line
	1000 4100 1850 4100
Wire Wire Line
	1250 4200 1850 4200
Text Label 5500 3750 0    50   ~ 0
AMP_ENA
Wire Wire Line
	5500 3750 5950 3750
Wire Wire Line
	5950 3750 5950 2600
Text Label 9850 5450 0    50   ~ 0
R
Wire Wire Line
	10100 5300 10100 5450
Wire Wire Line
	9750 5300 10100 5300
Wire Wire Line
	9750 5450 9750 5300
$Comp
L power:GNDA #PWR046
U 1 1 5EED7591
P 10100 5450
F 0 "#PWR046" H 10100 5200 50  0001 C CNN
F 1 "GNDA" H 10105 5277 50  0000 C CNN
F 2 "" H 10100 5450 50  0001 C CNN
F 3 "" H 10100 5450 50  0001 C CNN
	1    10100 5450
	1    0    0    -1  
$EndComp
Text Label 9650 5450 0    50   ~ 0
L
Connection ~ 7250 6150
Wire Wire Line
	7250 6050 8500 6050
Wire Wire Line
	7250 6050 7250 6150
Connection ~ 7700 6150
Wire Wire Line
	7700 6150 7550 6150
Wire Wire Line
	7700 6150 8500 6150
Wire Wire Line
	8050 5650 8500 5650
Wire Wire Line
	7700 5650 7700 6150
Connection ~ 7700 5650
Wire Wire Line
	7750 5650 7700 5650
$Comp
L Device:R R14
U 1 1 5EAA3BBD
P 7900 5650
F 0 "R14" V 7693 5650 50  0000 C CNN
F 1 "10k" V 7784 5650 50  0000 C CNN
F 2 "" V 7830 5650 50  0001 C CNN
F 3 "~" H 7900 5650 50  0001 C CNN
	1    7900 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 5350 9350 5350
Wire Wire Line
	7750 5350 7700 5350
Wire Wire Line
	7700 5350 7700 5650
Connection ~ 7700 5350
Wire Wire Line
	7700 5150 7700 5350
Wire Wire Line
	8150 5750 8500 5750
Wire Wire Line
	8150 5950 8500 5950
Wire Wire Line
	8150 5850 8500 5850
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 5E6EB042
P 8700 5850
F 0 "J6" H 8780 5842 50  0000 L CNN
F 1 "PCM5102A_1" H 8780 5751 50  0000 L CNN
F 2 "" H 8700 5850 50  0001 C CNN
F 3 "~" H 8700 5850 50  0001 C CNN
	1    8700 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x09 J7
U 1 1 5E6EB5E7
P 9450 5650
F 0 "J7" V 9575 5646 50  0000 C CNN
F 1 "PCM5102A_2" V 9666 5646 50  0000 C CNN
F 2 "" H 9450 5650 50  0001 C CNN
F 3 "~" H 9450 5650 50  0001 C CNN
	1    9450 5650
	0    -1   1    0   
$EndComp
Wire Wire Line
	9350 5450 9350 5350
Text Label 8150 5650 0    50   ~ 0
I2S_SCK
Text Label 9250 5350 0    50   ~ 0
FMT
$Comp
L power:+3.3VDAC #PWR034
U 1 1 5E7200C0
P 7700 5150
F 0 "#PWR034" H 7850 5100 50  0001 C CNN
F 1 "+3.3VDAC" H 7720 5293 50  0000 C CNN
F 2 "" H 7700 5150 50  0001 C CNN
F 3 "" H 7700 5150 50  0001 C CNN
	1    7700 5150
	1    0    0    -1  
$EndComp
Text Label 8150 5950 0    50   ~ 0
I2S_LRCK
Text Label 8150 5850 0    50   ~ 0
I2S_DATA
Text Label 8150 5750 0    50   ~ 0
I2S_BCK
$Comp
L Device:R R13
U 1 1 5E73006F
P 7900 5350
F 0 "R13" V 7693 5350 50  0000 C CNN
F 1 "10k" V 7784 5350 50  0000 C CNN
F 2 "" V 7830 5350 50  0001 C CNN
F 3 "~" H 7900 5350 50  0001 C CNN
	1    7900 5350
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 5E7B816D
P 7400 6150
F 0 "C7" H 7515 6196 50  0000 L CNN
F 1 "10uF" H 7515 6105 50  0000 L CNN
F 2 "" H 7438 6000 50  0001 C CNN
F 3 "~" H 7400 6150 50  0001 C CNN
	1    7400 6150
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR031
U 1 1 5E7222C0
P 7250 6150
F 0 "#PWR031" H 7250 5900 50  0001 C CNN
F 1 "GNDA" H 7255 5977 50  0000 C CNN
F 2 "" H 7250 6150 50  0001 C CNN
F 3 "" H 7250 6150 50  0001 C CNN
	1    7250 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4500 9600 4500
Wire Wire Line
	9600 4500 9600 4150
Wire Wire Line
	9300 4500 9300 4300
Wire Wire Line
	9100 4500 9300 4500
$Comp
L Device:C C16
U 1 1 5EFB2FFE
P 9850 4650
F 0 "C16" H 10050 4600 50  0000 R CNN
F 1 "33nF" H 10200 4700 50  0000 R CNN
F 2 "" H 9888 4500 50  0001 C CNN
F 3 "~" H 9850 4650 50  0001 C CNN
	1    9850 4650
	-1   0    0    1   
$EndComp
Connection ~ 7450 2800
$Comp
L Device:CP C8
U 1 1 5EF76073
P 7450 2950
F 0 "C8" H 7568 2996 50  0000 L CNN
F 1 "470uF" H 7568 2905 50  0000 L CNN
F 2 "" H 7488 2800 50  0001 C CNN
F 3 "~" H 7450 2950 50  0001 C CNN
	1    7450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2800 7950 2800
Connection ~ 7700 2800
Connection ~ 8350 3050
Wire Wire Line
	7700 2700 7700 2800
Wire Wire Line
	8350 2700 7700 2700
Wire Wire Line
	8350 3050 8350 2700
Wire Wire Line
	7950 2800 8700 2800
Connection ~ 7950 2800
Wire Wire Line
	7450 2800 7700 2800
$Comp
L power:GNDA #PWR037
U 1 1 5EF597C5
P 7950 3100
F 0 "#PWR037" H 7950 2850 50  0001 C CNN
F 1 "GNDA" H 7955 2927 50  0000 C CNN
F 2 "" H 7950 3100 50  0001 C CNN
F 3 "" H 7950 3100 50  0001 C CNN
	1    7950 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR038
U 1 1 5EF4CB80
P 8350 3400
F 0 "#PWR038" H 8350 3150 50  0001 C CNN
F 1 "GNDA" H 8355 3227 50  0000 C CNN
F 2 "" H 8350 3400 50  0001 C CNN
F 3 "" H 8350 3400 50  0001 C CNN
	1    8350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3050 8350 3100
Wire Wire Line
	8700 3050 8350 3050
$Comp
L power:GNDA #PWR042
U 1 1 5EF44A07
P 8700 3600
F 0 "#PWR042" H 8700 3350 50  0001 C CNN
F 1 "GNDA" H 8705 3427 50  0000 C CNN
F 2 "" H 8700 3600 50  0001 C CNN
F 3 "" H 8700 3600 50  0001 C CNN
	1    8700 3600
	1    0    0    -1  
$EndComp
Connection ~ 8700 3300
$Comp
L power:+5VA #PWR041
U 1 1 5EF42BC9
P 8700 3300
F 0 "#PWR041" H 8700 3150 50  0001 C CNN
F 1 "+5VA" H 8715 3473 50  0000 C CNN
F 2 "" H 8700 3300 50  0001 C CNN
F 3 "" H 8700 3300 50  0001 C CNN
	1    8700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 2750 10600 2750
$Comp
L power:GNDA #PWR050
U 1 1 5EF36A03
P 10600 2950
F 0 "#PWR050" H 10600 2700 50  0001 C CNN
F 1 "GNDA" H 10605 2777 50  0000 C CNN
F 2 "" H 10600 2950 50  0001 C CNN
F 3 "" H 10600 2950 50  0001 C CNN
	1    10600 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 3300 10500 3350
Connection ~ 10500 3300
Wire Wire Line
	10500 3150 10500 3300
Wire Wire Line
	8850 3900 9450 3900
$Comp
L power:GNDA #PWR043
U 1 1 5EEFCC4A
P 8850 4250
F 0 "#PWR043" H 8850 4000 50  0001 C CNN
F 1 "GNDA" H 8855 4077 50  0000 C CNN
F 2 "" H 8850 4250 50  0001 C CNN
F 3 "" H 8850 4250 50  0001 C CNN
	1    8850 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3900 9450 3850
Wire Wire Line
	9300 3850 9300 4000
Text Label 9850 4900 0    50   ~ 0
R
Text Label 9100 4900 0    50   ~ 0
L
$Comp
L Device:R R16
U 1 1 5EEDDB42
P 9600 4000
F 0 "R16" H 9530 3954 50  0000 R CNN
F 1 "220k" H 9530 4045 50  0000 R CNN
F 2 "" V 9530 4000 50  0001 C CNN
F 3 "~" H 9600 4000 50  0001 C CNN
	1    9600 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R15
U 1 1 5EEDD71B
P 9300 4150
F 0 "R15" H 9230 4104 50  0000 R CNN
F 1 "220k" H 9230 4195 50  0000 R CNN
F 2 "" V 9230 4150 50  0001 C CNN
F 3 "~" H 9300 4150 50  0001 C CNN
	1    9300 4150
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x05_Male J8
U 1 1 5E6FF5AC
P 9550 1900
F 0 "J8" V 9612 2144 50  0000 L CNN
F 1 "Speakers" V 9703 2144 50  0000 L CNN
F 2 "" H 9550 1900 50  0001 C CNN
F 3 "~" H 9550 1900 50  0001 C CNN
	1    9550 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 2100 9350 2100
Wire Wire Line
	9800 2100 9750 2100
$Comp
L Device:C C15
U 1 1 5EE3AD75
P 9100 4650
F 0 "C15" H 9215 4696 50  0000 L CNN
F 1 "33nF" H 9215 4605 50  0000 L CNN
F 2 "" H 9138 4500 50  0001 C CNN
F 3 "~" H 9100 4650 50  0001 C CNN
	1    9100 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5EE3AA63
P 8850 4050
F 0 "C14" H 8735 4004 50  0000 R CNN
F 1 "0.1uF" H 8735 4095 50  0000 R CNN
F 2 "" H 8888 3900 50  0001 C CNN
F 3 "~" H 8850 4050 50  0001 C CNN
	1    8850 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:C C10
U 1 1 5EE3A4E9
P 7950 2950
F 0 "C10" H 8065 2996 50  0000 L CNN
F 1 "1uF" H 8065 2905 50  0000 L CNN
F 2 "" H 7988 2800 50  0001 C CNN
F 3 "~" H 7950 2950 50  0001 C CNN
	1    7950 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5EE3A241
P 8350 3250
F 0 "C11" H 8465 3296 50  0000 L CNN
F 1 "1uF" H 8465 3205 50  0000 L CNN
F 2 "" H 8388 3100 50  0001 C CNN
F 3 "~" H 8350 3250 50  0001 C CNN
	1    8350 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5EE39F93
P 8700 3450
F 0 "C13" H 8815 3496 50  0000 L CNN
F 1 "1uF" H 8815 3405 50  0000 L CNN
F 2 "" H 8738 3300 50  0001 C CNN
F 3 "~" H 8700 3450 50  0001 C CNN
	1    8700 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR052
U 1 1 5EDD797D
P 10850 4200
F 0 "#PWR052" H 10850 3950 50  0001 C CNN
F 1 "GNDA" H 10855 4027 50  0000 C CNN
F 2 "" H 10850 4200 50  0001 C CNN
F 3 "" H 10850 4200 50  0001 C CNN
	1    10850 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 5EDD2BE2
P 10650 4200
F 0 "R20" V 10857 4200 50  0000 C CNN
F 1 "1k" V 10766 4200 50  0000 C CNN
F 2 "" V 10580 4200 50  0001 C CNN
F 3 "~" H 10650 4200 50  0001 C CNN
	1    10650 4200
	0    -1   -1   0   
$EndComp
Text Label 10000 3850 0    50   ~ 0
AMP_ENA
$Comp
L pam8403:PAM8403 U4
U 1 1 5ED28A94
P 9550 3050
F 0 "U4" V 10300 3800 60  0000 L CNN
F 1 "PAM8403" V 10200 3650 60  0000 L CNN
F 2 "" H 9550 3050 60  0000 C CNN
F 3 "" H 9550 3050 60  0000 C CNN
	1    9550 3050
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR033
U 1 1 5E6FE29B
P 7450 3100
F 0 "#PWR033" H 7450 2850 50  0001 C CNN
F 1 "GNDA" H 7455 2927 50  0000 C CNN
F 2 "" H 7450 3100 50  0001 C CNN
F 3 "" H 7450 3100 50  0001 C CNN
	1    7450 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR032
U 1 1 5E6FE8C9
P 7450 2800
F 0 "#PWR032" H 7450 2650 50  0001 C CNN
F 1 "+5VA" H 7465 2973 50  0000 C CNN
F 2 "" H 7450 2800 50  0001 C CNN
F 3 "" H 7450 2800 50  0001 C CNN
	1    7450 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR047
U 1 1 5E7C4BAD
P 10500 3350
F 0 "#PWR047" H 10500 3100 50  0001 C CNN
F 1 "GNDA" H 10505 3177 50  0000 C CNN
F 2 "" H 10500 3350 50  0001 C CNN
F 3 "" H 10500 3350 50  0001 C CNN
	1    10500 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4900 9850 4800
Wire Wire Line
	9100 4900 9100 4800
NoConn ~ 1850 4800
NoConn ~ 1850 4900
NoConn ~ 4300 4750
NoConn ~ 4300 4850
NoConn ~ 4300 4950
NoConn ~ 4300 5050
NoConn ~ 4300 5150
NoConn ~ 4300 5250
Text Label 5500 4150 0    50   ~ 0
AMP_UNMUTE
Text Label 5500 5750 0    50   ~ 0
EXT1
Text Label 5500 5850 0    50   ~ 0
EXT2
Text Label 4300 3850 2    50   ~ 0
EXT3
Text Label 5850 7350 2    50   ~ 0
EXT1
Text Label 5850 7250 2    50   ~ 0
EXT2
Text Label 5850 7150 2    50   ~ 0
EXT3
$Comp
L power:GNDD #PWR024
U 1 1 5ECFF259
P 5500 7100
F 0 "#PWR024" H 5500 6850 50  0001 C CNN
F 1 "GNDD" H 5504 6945 50  0000 C CNN
F 2 "" H 5500 7100 50  0001 C CNN
F 3 "" H 5500 7100 50  0001 C CNN
	1    5500 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 7100 5500 7050
Wire Wire Line
	5500 7050 5850 7050
$Comp
L power:+3.3V #PWR023
U 1 1 5ED05D29
P 5500 6950
F 0 "#PWR023" H 5500 6800 50  0001 C CNN
F 1 "+3.3V" H 5515 7123 50  0000 C CNN
F 2 "" H 5500 6950 50  0001 C CNN
F 3 "" H 5500 6950 50  0001 C CNN
	1    5500 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6950 5850 6950
NoConn ~ 9050 5450
NoConn ~ 9150 5450
NoConn ~ 9250 5450
NoConn ~ 9450 5450
NoConn ~ 9550 5450
NoConn ~ 9550 2100
NoConn ~ 1650 2700
Wire Wire Line
	9850 1400 9850 1450
Wire Wire Line
	8550 1000 8550 900 
Connection ~ 8550 1000
Connection ~ 7750 1000
Wire Wire Line
	10500 2950 10600 2950
Wire Wire Line
	10600 2750 10600 2950
Connection ~ 10600 2950
Wire Wire Line
	8850 4200 8850 4250
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5ED6A703
P 1250 1250
F 0 "#FLG02" H 1250 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 1250 1423 50  0000 C CNN
F 2 "" H 1250 1250 50  0001 C CNN
F 3 "~" H 1250 1250 50  0001 C CNN
	1    1250 1250
	1    0    0    -1  
$EndComp
Connection ~ 1250 1250
Wire Wire Line
	1250 1250 1550 1250
$Comp
L power:GNDD #PWR013
U 1 1 5ED6B633
P 2850 5150
F 0 "#PWR013" H 2850 4900 50  0001 C CNN
F 1 "GNDD" H 2854 4995 50  0000 C CNN
F 2 "" H 2850 5150 50  0001 C CNN
F 3 "" H 2850 5150 50  0001 C CNN
	1    2850 5150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5ED6BC4B
P 1150 1350
F 0 "#FLG01" H 1150 1425 50  0001 C CNN
F 1 "PWR_FLAG" V 1150 1478 50  0000 L CNN
F 2 "" H 1150 1350 50  0001 C CNN
F 3 "~" H 1150 1350 50  0001 C CNN
	1    1150 1350
	0    1    1    0   
$EndComp
Connection ~ 1150 1350
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5ED6C29C
P 7750 1000
F 0 "#FLG03" H 7750 1075 50  0001 C CNN
F 1 "PWR_FLAG" V 7750 1128 50  0000 L CNN
F 2 "" H 7750 1000 50  0001 C CNN
F 3 "~" H 7750 1000 50  0001 C CNN
	1    7750 1000
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG04
U 1 1 5ED6C70F
P 7750 1300
F 0 "#FLG04" H 7750 1375 50  0001 C CNN
F 1 "PWR_FLAG" V 7750 1428 50  0000 L CNN
F 2 "" H 7750 1300 50  0001 C CNN
F 3 "~" H 7750 1300 50  0001 C CNN
	1    7750 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 900  7750 1000
$Comp
L Device:R R19
U 1 1 5ED6D8F7
P 10650 3850
F 0 "R19" V 10857 3850 50  0000 C CNN
F 1 "1k" V 10766 3850 50  0000 C CNN
F 2 "" V 10580 3850 50  0001 C CNN
F 3 "~" H 10650 3850 50  0001 C CNN
	1    10650 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR051
U 1 1 5ED6DBF0
P 10850 3850
F 0 "#PWR051" H 10850 3600 50  0001 C CNN
F 1 "GNDA" H 10855 3677 50  0000 C CNN
F 2 "" H 10850 3850 50  0001 C CNN
F 3 "" H 10850 3850 50  0001 C CNN
	1    10850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4200 10850 4200
Wire Wire Line
	10800 3850 10850 3850
Wire Wire Line
	10500 4200 9900 4200
Wire Wire Line
	9900 3850 9900 4200
Text Label 10000 4200 0    50   ~ 0
AMP_UNMUTE
Wire Wire Line
	9750 3850 10500 3850
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5ED9429D
P 6050 7150
F 0 "J?" H 6022 7082 50  0000 R CNN
F 1 "Conn_01x05_Male" H 6022 7173 50  0000 R CNN
F 2 "" H 6050 7150 50  0001 C CNN
F 3 "~" H 6050 7150 50  0001 C CNN
	1    6050 7150
	-1   0    0    1   
$EndComp
$EndSCHEMATC
