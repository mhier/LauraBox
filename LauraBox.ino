//
// Configure ESP32 Arduino support: https://github.com/espressif/arduino-esp32
//
// Change Board to "ESP32 Dev Module".
//
// Need to change this in ".arduino15/packages/esp32/hardware/esp32/1.0.4/tools/sdk/include/config/sdkconfig.h":
// #define CONFIG_ULP_COPROC_RESERVE_MEM 2048
//
// Need to install EPS32-audioI2S from here (download as ZIP, add via Sketch/Include Library)
// https://github.com/schreibfaul1/ESP32-audioI2S/
//
// Install ArduinoHttpClient library through Library Manager.
//
// Install the ulptool: https://github.com/duff2013/ulptool
// Note: On newer systems Python 2 might no longer work. Python 3 support is around the corner, see: https://github.com/duff2013/ulptool/pull/67
//



//#define TEST

#include "Arduino.h"
#include "WiFi.h"
#include "Audio.h"
#include "SD.h"
#include "FS.h"
#include <SPI.h>
#include "SPIFFS.h"

#include <WiFi.h>
#include <ESPmDNS.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>
#include <WiFiClient.h>
#include <ArduinoHttpClient.h>

#include <thread>
#include <atomic>
#include <set>
#include <vector>
#include <mutex>

#include "esp_sleep.h"
#include "nvs.h"
#include "nvs_flash.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/rtc_io_reg.h"
#include "soc/sens_reg.h"
#include "soc/soc.h"
#include "driver/gpio.h"
#include "driver/rtc_io.h"
#include "esp32/ulp.h"
#include "ulp_main.h"
#include "ulptool.h"
#include "esp_task_wdt.h"

extern const uint8_t ulp_main_bin_start[] asm("_binary_ulp_main_bin_start");
extern const uint8_t ulp_main_bin_end[] asm("_binary_ulp_main_bin_end");

// Create wifi-key.h, put the following two definitions in and replace the **** with your WIFI credentials.
//String ssid =     "****";
//String password = "****";
//String updateCard = <cardIdToActivateWifiUpload>;
//String baseUrl = "http://url.to.download.new.card.content"
// Note: <cardIdToActivateWifiUpload> must be an interger value. If you specify it as a hex code, prefix it with "0x".
#include "wifi-key.h"

#include "Button.h"

// Pins for RC522 - need to be accessible by RTC / ULP coprocessor
#define GPIO_NFC_SDA GPIO_NUM_4    // GPIO 4, RTC GPIO 10
#define GPIO_NFC_RST GPIO_NUM_14   // GPIO 14, RTC GPIO 16
#define GPIO_NFC_MOSI GPIO_NUM_32  // GPIO 32, RTC GPIO 9
#define GPIO_NFC_MISO GPIO_NUM_13  // GPIO 13, RTC GPIO 14
#define GPIO_NFC_SCK GPIO_NUM_33   // GPIO 33, RTC GPIO 8

// Pins for SD card
#define SD_CS 5
#define SPI_MOSI 23
#define SPI_MISO 19
#define SPI_SCK 18

// Pins for I2S audio interface
#define I2S_DOUT 25
#define I2S_SCK 27
#define I2S_LRCK 26

// Pin for power control (DAC and amplifier)
#define POWER_CTRL 21

// Pin for amplifier /shutdown and /mute signals
#define AMP_ENA 2  // needs to be pulled low for fw download -> put to programmer connector to be safe

// ADC channel to read the battery voltage. Keep in sync with constant in rtcio.s
#define ADC_CH_VBATT ADC1_CHANNEL_0

// Define push buttons (with pin numbers)
Button volumeUp{ 15 };
Button volumeDown{ 22 };  // suppresses boot messages if low => acceptable side effect
Button trackNext{ 17 };
Button trackPrev{ 16 };

// Maximum allowed length of file names in playlist (to prevent buffer overflow in case of corrupted files)
const int maxPathLength = 512;

// Maximum number of minutes the cpu might run after waking up (to prevent battery drain if something is stuck)
const unsigned int runMaxMinutes = 120;

// Maximum allowed playback volume (cannot be bigger than 20)
const unsigned int maxVolume = 12;

//std::recursive_mutex mx_audio;
Audio audio;
SPIClass sdspi(VSPI);

std::thread audioLoop;

std::mutex mx_playlist_and_track;
std::vector<String> playlist;
size_t track{ 0 };

hw_timer_t *timer{ nullptr };

uint32_t active_card_id{ 0 };
std::atomic<bool> isStreaming{ false };
std::atomic<bool> isMessage{ false };

void IRAM_ATTR onTimer();

bool isUpdateMode{ false };

std::atomic<size_t> wifiUseCount;
bool connectWifi(bool required = true);
void disconnectWifi();

String urlencode(String str);

// Buffer for downloading files
const int blockSize = 1024;
uint8_t buffer[blockSize];

unsigned long idleTime = 0;

/**************************************************************************************************************/

void runAudioLoop(void *parameter = nullptr) {
  delay(100);
  while (true) {
    {
      //std::lock_guard<std::recursive_mutex> lk(mx_audio);
      audio.loop();
    }
    delay(1);
  }
}

/**************************************************************************************************************/

void setupOTA() {
  ArduinoOTA
    .onStart([]() {
      String type;
      if (ArduinoOTA.getCommand() == U_FLASH)
        type = "sketch";
      else  // U_SPIFFS
        type = "filesystem";


      SPIFFS.end();
      Serial.println("Start updating " + type);
    })
    .onEnd([]() {
      Serial.println("\nEnd");
    })
    .onProgress([](unsigned int progress, unsigned int total) {
      Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
    })
    .onError([](ota_error_t error) {
      Serial.printf("Error[%u]: ", error);
      if (error == OTA_AUTH_ERROR) Serial.println("Auth Failed");
      else if (error == OTA_BEGIN_ERROR) Serial.println("Begin Failed");
      else if (error == OTA_CONNECT_ERROR) Serial.println("Connect Failed");
      else if (error == OTA_RECEIVE_ERROR) Serial.println("Receive Failed");
      else if (error == OTA_END_ERROR) Serial.println("End Failed");
    })
    .setHostname("LauraBox")
    .setPort(3232);

  connectWifi();
  isUpdateMode = true;
  ArduinoOTA.begin();
  Serial.println("Update mode enabled.");
  voiceMessage("OTA");
}

/**************************************************************************************************************/

void updatePlaylists(void *parameter = nullptr) {
  // flag whether the file downloaded is the first or not, allows to produce different voice messages
  bool firstFile = true;

  // connect wifi
  if (!connectWifi(false)) {
    Serial.printf("Could not connect to wifi!\n");
    voiceMessage("error");
    vTaskDelete(NULL);
  }

  WiFiClient c;
  HttpClient httpManifest(c, serverAddress, 80);

  // download playlist
  Serial.println("Downloading manifest...");

  httpManifest.get("/manifest");
  int httpCode = httpManifest.responseStatusCode();
  if (httpCode < 200 && httpCode > 299) {
    Serial.print("Http error: ");
    Serial.println(httpCode);
    voiceMessage("error");
    vTaskDelete(NULL);
  }
  Serial.println("Found online, starting download...");
  auto body = httpManifest.responseBody();
  if (body == "NOT FOUND\n") {
    Serial.println("Not found!");
    voiceMessage("error");
    vTaskDelete(NULL);
  }
  httpManifest.stop();

  // parse manifest line by line (this assumes a new line at the end of the file)
  std::string bodyToParse(body.c_str());
  size_t pos0 = 0;
  size_t pos1 = 0;
  while( (pos1 = bodyToParse.find_first_of("\n", pos0)) != std::string::npos ) {
    // get the line and update the bodyToParse
    auto line = bodyToParse.substr(pos0, pos1-pos0);
    pos0 = pos1+1;

    // extract track size and name
    auto separator = line.find_first_of(" ");
    size_t tracksize = std::stoi(line.substr(0, separator));
    String track = line.substr(separator+1).c_str();

    Serial.print("Checking track "+track);

    // check if file needs to be downloaded (does not exist or size differs)
    bool download = false;
    if(SD.exists("/" + track)) {
      auto f = SD.open("/" + track, FILE_READ);
      if(f.size() != tracksize) {
        Serial.println(" -> size mismatch, downloading...");
        download = true;
      }
      else {
        Serial.println(" -> ok");
      }
      f.close();
    }
    else {
      Serial.println(" -> does not exist, downloading...");
      download = true;
    }

    if(download) {
      // Play message
      if (firstFile) {
        firstFile = false;
        voiceMessage("download");
      }
      else {
        voiceMessage("download_progress");
      }

      // Start download of the track file
      HttpClient httpTrack(c, serverAddress, 80);
      httpTrack.get(urlencode("/" + track));
      int httpCode = httpTrack.responseStatusCode();
      if (httpCode >= 200 && httpCode <= 299) {
        httpTrack.skipResponseHeaders();
        auto bodyLen = httpTrack.contentLength();

        Serial.println("Downloading '" + track + "'...");

        // Create directories
        for (int i = 0; i < track.length(); ++i) {
          if (track[i] == '/') {
            SD.mkdir("/" + track.substring(0, i));
          }
        }

        // Save file
        auto f = SD.open("/" + track, FILE_WRITE);
        for(auto i = 0; i < bodyLen; i += blockSize) {

          // print progress to serial
          if (i % (blockSize * 100) == 0) {
            delay(1);  // prevent idle task to never run and trigger the watchdog...
            Serial.print(i / 1024);
            Serial.print("/");
            Serial.print(bodyLen / 1024);
            Serial.println(" kiB");
          }

          // wait until enough data is available
          int nBytesToRead = min(bodyLen - i, blockSize);
          int itocount = 0;
          while (httpTrack.available() < nBytesToRead) {
            delay(100);
            if (!httpTrack.connected() || ++itocount > 300) {
              Serial.print("Error downloading '" + track + "': timeout.");
              voiceMessage("error");
              vTaskDelete(NULL);
            }
          }

          // read from http stream
          httpTrack.read(buffer, nBytesToRead);

          // write to SD card
          f.write(buffer, nBytesToRead);
        }
        f.close();
        httpTrack.stop();
      }
      else {
        Serial.print("Error downloading '" + track + "': ");
        Serial.println(httpCode);
        voiceMessage("error");
        vTaskDelete(NULL);
      }
    }

    // abort if battery low
#ifndef TEST
    if (ulp_vbatt_low & 0xFFFF) {
      disconnectWifi();
      vTaskDelete(NULL);
    }
#endif

    delay(1);  // prevent idle task to never run and trigger the watchdog...
  }

  Serial.println("Playlist update complete!");

  voiceMessage("download_finished");
  vTaskDelete(NULL);
}

/**************************************************************************************************************/

void powerOff() {
  Serial.printf("Entering deep sleep\n\n");

  // shutdown SD card
  sdspi.end();
  digitalWrite(SD_CS, HIGH);
  sdspi.begin(SPI_SCK, SPI_MISO, SPI_MOSI);
  SD.begin(SD_CS);

  // inform ULP we are going to sleep
  ulp_main_cpu_sleeps = 1;
  // enable wakeup by ULP
  ESP_ERROR_CHECK(esp_sleep_enable_ulp_wakeup());
  Serial.flush();
  esp_deep_sleep_start();
  // this never returns, the ESP32 is reset after deep sleep, hence setup() is called after wakeup
}

/**************************************************************************************************************/

static void init_ulp_program(bool firstBoot) {
  esp_err_t err;
  if (firstBoot) {
    /* Load ULP binary */
    err = ulptool_load_binary(0, ulp_main_bin_start, (ulp_main_bin_end - ulp_main_bin_start) / sizeof(uint32_t));
    ESP_ERROR_CHECK(err);

    /* Set ULP wake up period to 2 seconds */
    ulp_set_wakeup_period(0, 2 * 1000 * 1000);

    /* Slow alternative ULP wake up period in case of low battery: 10 minutes */
    ulp_set_wakeup_period(1, 60 * 1000 * 1000);  // * 10

    /* Start the ULP program */
    ESP_ERROR_CHECK(ulp_run((&ulp_entry - RTC_SLOW_MEM) / sizeof(uint32_t)));

    /* Set default volume */
    ulp_current_volume = 4;

    /* Clear last card id */
    ulp_last_card_id = 0;
  }

  adc1_config_channel_atten(ADC_CH_VBATT, ADC_ATTEN_DB_11);
  adc1_config_width(ADC_WIDTH_BIT_12);
  adc1_ulp_enable();

  err = rtc_gpio_init(GPIO_NFC_SDA);
  if (err != ESP_OK) Serial.printf("GPIO_NFC_SDA not ok for RTC\n");
  rtc_gpio_set_direction(GPIO_NFC_SDA, RTC_GPIO_MODE_OUTPUT_ONLY);

  err = rtc_gpio_init(GPIO_NFC_RST);
  if (err != ESP_OK) Serial.printf("GPIO_NFC_RST not ok for RTC\n");
  rtc_gpio_set_direction(GPIO_NFC_RST, RTC_GPIO_MODE_OUTPUT_ONLY);

  err = rtc_gpio_init(GPIO_NFC_MOSI);
  if (err != ESP_OK) Serial.printf("GPIO_NFC_MOSI not ok for RTC\n");
  rtc_gpio_set_direction(GPIO_NFC_MOSI, RTC_GPIO_MODE_OUTPUT_ONLY);

  err = rtc_gpio_init(GPIO_NFC_MISO);
  if (err != ESP_OK) Serial.printf("GPIO_NFC_MISO not ok for RTC\n");
  rtc_gpio_set_direction(GPIO_NFC_MISO, RTC_GPIO_MODE_INPUT_ONLY);

  err = rtc_gpio_init(GPIO_NFC_SCK);
  if (err != ESP_OK) Serial.printf("GPIO_NFC_SCK not ok for RTC\n");
  rtc_gpio_set_direction(GPIO_NFC_SCK, RTC_GPIO_MODE_OUTPUT_ONLY);
}

/**************************************************************************************************************/

uint32_t readCardIdFromULP() {
  uint32_t id;

  // spin lock
  while (true) {
    ulp_active_card_mutex_by_main_cpu = 1;
    if (!(ulp_active_card_mutex_by_ulp_cpu & 0xFFFF)) break;
    ulp_active_card_mutex_by_main_cpu = 0;
  }

  id = ((ulp_active_card_id_hi & 0xFFFF) << 16) | (ulp_active_card_id_lo & 0xFFFF);

  // release lock
  ulp_active_card_mutex_by_main_cpu = 0;

  return id;
}

/**************************************************************************************************************/

void clearSD() {
  Serial.println("Resetting SD card...");
  byte sd = 0;
  digitalWrite(SD_CS, LOW);
  size_t nRetry = 0;
  while (sd != 255) {
    sd = sdspi.transfer(255);
    delay(10);
    if (++nRetry > 100) {
      Serial.println("Giving up!");
      break;
    }
  }
  delay(10);
  digitalWrite(SD_CS, HIGH);
}

/**************************************************************************************************************/

void setup() {
  wifiUseCount = 0;

  Serial.begin(115200);

  // configure power control pin
  Serial.printf("Power on SD+Audio\n");
  pinMode(POWER_CTRL, OUTPUT);
  pinMode(AMP_ENA, OUTPUT);
  digitalWrite(AMP_ENA, LOW);
  digitalWrite(POWER_CTRL, HIGH);

  // Configure audo interface
  Serial.printf("Setup audio\n");
  audio.setPinout(I2S_SCK, I2S_LRCK, I2S_DOUT);

  // create task for audio loop (on a dedicated core)
  //std::lock_guard<std::recursive_mutex> lk(mx_audio);  // prevent audio loop until setup is complete
  xTaskCreatePinnedToCore(runAudioLoop, "runAudioLoop", 10000, NULL, 3, NULL, 0);
  xTaskCreatePinnedToCore(limitRuntime, "limitRuntime", 2000, NULL, 4, NULL, 1);

  // Setup SD card (done always to make sure SD card is in sleep mode after reset)
  Serial.printf("Setup SD\n");
  pinMode(SD_CS, OUTPUT);
  size_t nRetrySD = 0;
retry_sd:
  digitalWrite(SD_CS, HIGH);
  sdspi.begin(SPI_SCK, SPI_MISO, SPI_MOSI);
  if (!SD.begin(SD_CS)) {
    clearSD();
    sdspi.end();
    if (++nRetrySD < 10) goto retry_sd;
    voiceError("error");
  }

  // Check wake cause
  esp_sleep_wakeup_cause_t cause = esp_sleep_get_wakeup_cause();
  if (cause != ESP_SLEEP_WAKEUP_ULP) {
    Serial.printf("Cold start.\n");
    init_ulp_program(true);
#ifndef TEST
    powerOff();
#endif
  }
  Serial.printf("ULP wakeup.\n");
  Serial.print("VBATT: ");
  Serial.println(ulp_vbatt & 0xFFFF);

  // inform ULP we are awake
  ulp_main_cpu_sleeps = 0;

  // init ULP pins
  init_ulp_program(false);

  // set audio volume
  audio.setVolume(ulp_current_volume);  // 0...21
  Serial.print("Volume: ");
  Serial.println(ulp_current_volume);

  // Setup timer for scanning the input buttons
  Serial.printf("Setup input timer\n");
  timer = timerBegin(0, 80, true);  // prescaler 1/80 -> count microseconds
  timerAttachInterrupt(timer, &onTimer, true);
  timerAlarmWrite(timer, 10000, true);  // alarm every 10000 microseconds -> 100 Hz
  timerAlarmEnable(timer);

  // Setup input pins for push buttons
  Serial.printf("Setup input buttons\n");
  for (auto b : buttonList) b->setup();

  Serial.printf("Enable amplifier\n");
  delay(500);
  digitalWrite(AMP_ENA, HIGH);

  // create task for main loop - we do not use the arduino loop(), because it makes problems if too much time is spent inside.
  xTaskCreatePinnedToCore(runMainLoop, "runMainLoop", 10000, NULL, 0, NULL, 1);

  Serial.printf("Init complete.\n");
}

/**************************************************************************************************************/

void voiceError(String file) {
  voiceMessage(file);
  powerOff();
}

/**************************************************************************************************************/

void voiceMessage(String file) {
  Serial.println("Message: " + file);
  isMessage = true;

  digitalWrite(AMP_ENA, HIGH);

  if (!SPIFFS.begin()) {
    Serial.println("SPIFFS Mount Failed");
    powerOff();
  }

  {
    //std::lock_guard<std::recursive_mutex> lk(mx_audio);
    audio.stopSong();
  }
  while (audio.isRunning()) delay(1);

  {
    //std::lock_guard<std::recursive_mutex> lk(mx_audio);
    audio.setVolume(2);
    audio.connecttoFS(SPIFFS, (file + ".mp3").c_str());
  }
  while (audio.isRunning()) delay(1);
}

/**************************************************************************************************************/

void IRAM_ATTR onTimer() {
  for (auto b : buttonList) b->onTimer();
}

/**************************************************************************************************************/

bool connectWifi(bool required) {
  if (wifiUseCount++ == 0) {
    Serial.println("Connecting WIFI...");
    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid.c_str(), password.c_str());
  }
  Serial.print("Waiting for WIFI...");
  size_t cTimeOut = 0;
  while (WiFi.status() != WL_CONNECTED) {
    if (++cTimeOut > 60) {
      if (!required) return false;
      voiceError("error");
    }
    delay(500);
  }
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  return true;
}

/**************************************************************************************************************/

void disconnectWifi() {
  if (--wifiUseCount == 0) {
    Serial.println("Disconnecting WIFI...");
    WiFi.disconnect();
    WiFi.mode(WIFI_OFF);
  }
}

/**************************************************************************************************************/

void play() {
  String uri;
  size_t theTrack;
  {
    std::unique_lock<std::mutex> lk(mx_playlist_and_track);
    if (track > playlist.size() - 1) {
      Serial.println("Current track exceeds length of playlist.");
      lk.unlock();
      voiceError("error");
    }
    uri = playlist[track];
    theTrack = track;
  }


  Serial.println("Play: " + uri);

  if (!uri.startsWith("http://") && !uri.startsWith("https://")) {
    if (isStreaming) disconnectWifi();
    if (!SD.exists("/" + uri)) {
      voiceError("error");
    }
    //std::lock_guard<std::recursive_mutex> lk(mx_audio);
    isStreaming = false;
    audio.connecttoSD(uri.c_str());
  } else {
    if (!isStreaming) connectWifi();
    //std::lock_guard<std::recursive_mutex> lk(mx_audio);
    isStreaming = true;
    audio.connecttohost(uri.c_str());
  }
}

/**************************************************************************************************************/

void runMainLoop(void *) {
  Serial.printf("runMainLoop started.\n");

  while (true) {
    delay(10);

#ifndef TEST
    // Check if low battery
    if (ulp_vbatt_low & 0xFFFF) {
      voiceError("charge");
    }
#endif

    // Handle update mode
    if (isUpdateMode) {
      ArduinoOTA.handle();
    }

    // read current card
    auto detected_card_id = readCardIdFromULP();

    // check for special update card
    if (detected_card_id == updateCard) {
      if (!isUpdateMode) {
        setupOTA();
        xTaskCreatePinnedToCore(updatePlaylists, "updatePlaylists", 10000, NULL, 0, NULL, 1);
      }
      continue;
    }

#ifdef TEST
    detected_card_id = 0xdeadbeef;
#endif

    // Check if card lost or changed. Will also be executed right after wakup from ULP.
    if (active_card_id != detected_card_id) {
      if (detected_card_id == 0) {
        Serial.println("Card lost.");
        {
          //std::lock_guard<std::recursive_mutex> lk(mx_audio);
          if (audio.isRunning() && !isMessage) audio.pauseResume();

          // store current position in RTC memory, to allow resuming if same card is read again
          ulp_last_card_id = active_card_id;
          ulp_last_track = track;
          if (!isStreaming) {
            ulp_last_file_position = audio.getAudioCurrentTime();
          } else {
            ulp_last_file_position = 0;
          }
        }
        powerOff();
      }

      active_card_id = detected_card_id;
      String id = String(active_card_id, HEX);
      while (id.length() < 8) {
        id = "0" + id;
      }
      Serial.print("Card detected: ");
      Serial.print(id);
      Serial.println(".");


      // Read playlist from SD card
      auto f = SD.open("/" + id + ".lst", FILE_READ);
      if (!f || f.size() < 3) {
        voiceError("unknown_id");
      }

      // read playlist from file
      Serial.println("TRACKLIST BEGIN");
      while (f.available()) {
        auto track = f.readStringUntil('\n');
        Serial.println(track);
        if (track.length() > maxPathLength) continue;
        if (track[track.length() - 1] == '\r') track = track.substring(0, track.length() - 1);
        std::lock_guard<std::mutex> lk(mx_playlist_and_track);
        playlist.push_back(track);
      }
      Serial.println("TRACKLIST END");
      f.close();

      // Start playing first track
      if (ulp_last_card_id != active_card_id) {
        {
          std::unique_lock<std::mutex> lk(mx_playlist_and_track);
          track = 0;
          if (playlist.size() < 1) {
            Serial.println("No tracks on playlist.");
            lk.unlock();
            voiceError("unknown_id");
          }
        }
        play();
      } else {
        Serial.println("Resuming.");
        {
          std::unique_lock<std::mutex> lk(mx_playlist_and_track);
          track = ulp_last_track;
          Serial.print("Track = ");
          Serial.println(track);
          if (playlist.size() < track + 1) {
            track = 0;
            ulp_last_file_position = 0;
          }
          if (playlist.size() < 1) {
            lk.unlock();
            voiceError("unknown_id");
          }
        }
        {
          Serial.print("ulp_last_file_position = ");
          Serial.println(ulp_last_file_position);
          //std::lock_guard<std::recursive_mutex> lk(mx_audio);
          play();
          //usleep(1);
          //audio.loop();
          //usleep(1);
          //audio.setAudioPlayPosition(ulp_last_file_position);
        }
      }
    }

    // Check for button commands
    if (volumeUp.isCommandPending()) {
      if (ulp_current_volume < maxVolume) ulp_current_volume++;
      //std::lock_guard<std::recursive_mutex> lk(mx_audio);
      audio.setVolume(ulp_current_volume);
      Serial.print("Volume up: ");
      Serial.println(ulp_current_volume);
    }
    if (volumeDown.isCommandPending()) {
      if (ulp_current_volume > 1) ulp_current_volume--;
      //std::lock_guard<std::recursive_mutex> lk(mx_audio);
      audio.setVolume(ulp_current_volume);
      Serial.print("Volume down: ");
      Serial.println(ulp_current_volume);
    }
    if (trackNext.isCommandPending()) {
      std::unique_lock<std::mutex> lk(mx_playlist_and_track);
      if (track < playlist.size() - 1) {
        ++track;
        lk.unlock();
        play();
      }
    }
    if (trackPrev.isCommandPending()) {
      std::unique_lock<std::mutex> lk(mx_playlist_and_track);
      if (track > 0) {
        --track;
        lk.unlock();
        play();
      }
    }

    // Shutdown if nothing is playing or downloading. Happens only in special cases like empty playlists, but would drain the battery.
    if (!audio.isRunning()) {
      if (idleTime == 0) {
        idleTime = millis();
      } else if (millis() - idleTime > 2000) {
        Serial.println("Nothing playing or downloading.");
        powerOff();
      }
    } else {
      idleTime = 0;
    }
  }
}

/**************************************************************************************************************/

void audio_eof_mp3(const char *info) {  //end of file
  Serial.print("eof_mp3     ");
  Serial.println(info);

  // special treatment if message was played back: do not proceed with playlist
  if (isMessage) {
    Serial.println("Message playback ended.");
    isMessage = false;
    return;
  }

  // switch to next track of playlist
  std::unique_lock<std::mutex> lk(mx_playlist_and_track);
  ++track;
  if (track >= playlist.size()) {
    // if no track left: terminate
    Serial.println("Playlist has ended.");
    active_card_id = 0;
    lk.unlock();
    powerOff();
  }
  lk.unlock();
  play();
}

/**************************************************************************************************************/

void audio_info(const char *info) {
  Serial.print("info        ");
  Serial.println(info);
}
void audio_id3data(const char *info) {  //id3 metadata
  Serial.print("id3data     ");
  Serial.println(info);
}
void audio_showstation(const char *info) {
  Serial.print("station     ");
  Serial.println(info);
}
void audio_showstreaminfo(const char *info) {
  Serial.print("streaminfo  ");
  Serial.println(info);
}
void audio_showstreamtitle(const char *info) {
  Serial.print("streamtitle ");
  Serial.println(info);
}
void audio_bitrate(const char *info) {
  Serial.print("bitrate     ");
  Serial.println(info);
}
void audio_commercial(const char *info) {  //duration in sec
  Serial.print("commercial  ");
  Serial.println(info);
}
void audio_icyurl(const char *info) {  //homepage
  Serial.print("icyurl      ");
  Serial.println(info);
}
void audio_lasthost(const char *info) {  //stream URL played
  Serial.print("lasthost    ");
  Serial.println(info);
}
void audio_eof_speech(const char *info) {
  Serial.print("eof_speech  ");
  Serial.println(info);
}

/**************************************************************************************************************/


String urlencode(String str) {
  String encodedString = "";
  char c;
  char code0;
  char code1;
  char code2;
  for (int i = 0; i < str.length(); i++) {
    c = str.charAt(i);
    if (isalnum(c) || c == '/') {
      encodedString += c;
    } else {
      code1 = (c & 0xf) + '0';
      if ((c & 0xf) > 9) {
        code1 = (c & 0xf) - 10 + 'A';
      }
      c = (c >> 4) & 0xf;
      code0 = c + '0';
      if (c > 9) {
        code0 = c - 10 + 'A';
      }
      code2 = '\0';
      encodedString += '%';
      encodedString += code0;
      encodedString += code1;
      //encodedString+=code2;
    }
    yield();
  }
  return encodedString;
}

/**************************************************************************************************************/

void limitRuntime(void *p) {
  // Extra safety: limit maximum running time
  delay(1000 * 60 * runMaxMinutes);
  Serial.println("Maximum running time exceeded");
  powerOff();
}


/**************************************************************************************************************/

void loop() {
  delay(100);
}
