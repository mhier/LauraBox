EESchema Schematic File Version 4
LIBS:hardware-cache
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
L RF_Module:ESP32-WROOM-32 U?
U 1 1 5E6E43BB
P 5250 5800
F 0 "U?" V 4550 4800 50  0000 C CNN
F 1 "ESP32-WROOM-32" V 4650 4800 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 5250 4300 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 4950 5850 50  0001 C CNN
	1    5250 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5E6F2CCA
P 6300 3450
F 0 "J?" V 6264 3730 50  0000 L CNN
F 1 "PROG" V 6173 3730 50  0000 L CNN
F 2 "" H 6300 3450 50  0001 C CNN
F 3 "~" H 6300 3450 50  0001 C CNN
	1    6300 3450
	0    1    -1   0   
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E714318
P 6500 3850
F 0 "#PWR?" H 6500 3600 50  0001 C CNN
F 1 "GNDD" H 6504 3695 50  0000 C CNN
F 2 "" H 6500 3850 50  0001 C CNN
F 3 "" H 6500 3850 50  0001 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3650 6500 3850
Wire Wire Line
	6100 3650 6100 4700
Wire Wire Line
	6100 4700 5850 4700
Wire Wire Line
	5850 4900 6200 4900
Wire Wire Line
	6200 4900 6200 3650
Text Label 6100 3750 1    50   ~ 0
RX
Text Label 6200 3750 1    50   ~ 0
TX
Wire Wire Line
	5250 3950 5250 4300
$Comp
L power:GNDD #PWR?
U 1 1 5E739BDF
P 5250 7300
F 0 "#PWR?" H 5250 7050 50  0001 C CNN
F 1 "GNDD" H 5254 7145 50  0000 C CNN
F 2 "" H 5250 7300 50  0001 C CNN
F 3 "" H 5250 7300 50  0001 C CNN
	1    5250 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 7200 5250 7300
$Comp
L Device:R R?
U 1 1 5E73CB6C
P 4350 4600
F 0 "R?" V 4143 4600 50  0000 C CNN
F 1 "10k" V 4234 4600 50  0000 C CNN
F 2 "" V 4280 4600 50  0001 C CNN
F 3 "~" H 4350 4600 50  0001 C CNN
	1    4350 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E73D14D
P 5900 4300
F 0 "R?" H 5750 4350 50  0000 L CNN
F 1 "10k" H 5700 4250 50  0000 L CNN
F 2 "" V 5830 4300 50  0001 C CNN
F 3 "~" H 5900 4300 50  0001 C CNN
	1    5900 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4600 5900 4600
Wire Wire Line
	5900 4600 5900 4450
Wire Wire Line
	4650 4600 4550 4600
Wire Wire Line
	5900 4050 5900 4150
Wire Wire Line
	4100 4500 4100 4600
Wire Wire Line
	4100 4600 4200 4600
Wire Wire Line
	6000 3650 6000 4600
Wire Wire Line
	6000 4600 5900 4600
Connection ~ 5900 4600
Wire Wire Line
	6400 3650 6400 4100
Wire Wire Line
	6400 4100 4550 4100
Wire Wire Line
	4550 4100 4550 4600
Connection ~ 4550 4600
Wire Wire Line
	4550 4600 4500 4600
Text Label 6000 3750 1    50   ~ 0
DTR
Text Label 6400 3750 1    50   ~ 0
RTS
$Comp
L Switch:SW_Push SW?
U 1 1 5E7202B3
P 2550 6850
F 0 "SW?" V 2504 6998 50  0000 L CNN
F 1 "Trk next" V 2595 6998 50  0000 L CNN
F 2 "" H 2550 7050 50  0001 C CNN
F 3 "~" H 2550 7050 50  0001 C CNN
	1    2550 6850
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5E720B1F
P 3150 6850
F 0 "SW?" V 3104 6998 50  0000 L CNN
F 1 "Trk prev" V 3195 6998 50  0000 L CNN
F 2 "" H 3150 7050 50  0001 C CNN
F 3 "~" H 3150 7050 50  0001 C CNN
	1    3150 6850
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5E721055
P 1950 6850
F 0 "SW?" V 1904 6998 50  0000 L CNN
F 1 "Vol up" V 1995 6998 50  0000 L CNN
F 2 "" H 1950 7050 50  0001 C CNN
F 3 "~" H 1950 7050 50  0001 C CNN
	1    1950 6850
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5E7213D4
P 1350 6850
F 0 "SW?" V 1304 6998 50  0000 L CNN
F 1 "Vol down" V 1395 6998 50  0000 L CNN
F 2 "" H 1350 7050 50  0001 C CNN
F 3 "~" H 1350 7050 50  0001 C CNN
	1    1350 6850
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E724B03
P 1350 7050
F 0 "#PWR?" H 1350 6800 50  0001 C CNN
F 1 "GNDD" H 1354 6895 50  0000 C CNN
F 2 "" H 1350 7050 50  0001 C CNN
F 3 "" H 1350 7050 50  0001 C CNN
	1    1350 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E724CBA
P 1950 7050
F 0 "#PWR?" H 1950 6800 50  0001 C CNN
F 1 "GNDD" H 1954 6895 50  0000 C CNN
F 2 "" H 1950 7050 50  0001 C CNN
F 3 "" H 1950 7050 50  0001 C CNN
	1    1950 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E724E0D
P 2550 7050
F 0 "#PWR?" H 2550 6800 50  0001 C CNN
F 1 "GNDD" H 2554 6895 50  0000 C CNN
F 2 "" H 2550 7050 50  0001 C CNN
F 3 "" H 2550 7050 50  0001 C CNN
	1    2550 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E724F18
P 3150 7050
F 0 "#PWR?" H 3150 6800 50  0001 C CNN
F 1 "GNDD" H 3154 6895 50  0000 C CNN
F 2 "" H 3150 7050 50  0001 C CNN
F 3 "" H 3150 7050 50  0001 C CNN
	1    3150 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR?
U 1 1 5E748F62
P 8200 900
F 0 "#PWR?" H 8200 750 50  0001 C CNN
F 1 "+5VA" H 8215 1073 50  0000 C CNN
F 2 "" H 8200 900 50  0001 C CNN
F 3 "" H 8200 900 50  0001 C CNN
	1    8200 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR?
U 1 1 5E7493B8
P 7350 900
F 0 "#PWR?" H 7350 750 50  0001 C CNN
F 1 "+5VD" H 7365 1073 50  0000 C CNN
F 2 "" H 7350 900 50  0001 C CNN
F 3 "" H 7350 900 50  0001 C CNN
	1    7350 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VDAC #PWR?
U 1 1 5E749CCF
P 9800 900
F 0 "#PWR?" H 9950 850 50  0001 C CNN
F 1 "+3.3VDAC" H 9820 1043 50  0000 C CNN
F 2 "" H 9800 900 50  0001 C CNN
F 3 "" H 9800 900 50  0001 C CNN
	1    9800 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E74A254
P 4100 4500
F 0 "#PWR?" H 4100 4350 50  0001 C CNN
F 1 "+3.3V" H 4115 4673 50  0000 C CNN
F 2 "" H 4100 4500 50  0001 C CNN
F 3 "" H 4100 4500 50  0001 C CNN
	1    4100 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E74AA96
P 8200 1350
F 0 "#PWR?" H 8200 1100 50  0001 C CNN
F 1 "GNDA" H 8205 1177 50  0000 C CNN
F 2 "" H 8200 1350 50  0001 C CNN
F 3 "" H 8200 1350 50  0001 C CNN
	1    8200 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E74ABBC
P 7350 1350
F 0 "#PWR?" H 7350 1100 50  0001 C CNN
F 1 "GNDD" H 7354 1195 50  0000 C CNN
F 2 "" H 7350 1350 50  0001 C CNN
F 3 "" H 7350 1350 50  0001 C CNN
	1    7350 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E74BF76
P 8850 1150
F 0 "C?" H 8965 1196 50  0000 L CNN
F 1 "C" H 8965 1105 50  0000 L CNN
F 2 "" H 8888 1000 50  0001 C CNN
F 3 "~" H 8850 1150 50  0001 C CNN
	1    8850 1150
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:TLV1117-33 U?
U 1 1 5E74C540
P 9350 1000
F 0 "U?" H 9350 1242 50  0000 C CNN
F 1 "TLV1117-33" H 9350 1151 50  0000 C CNN
F 2 "" H 9350 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv1117.pdf" H 9350 1000 50  0001 C CNN
	1    9350 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5E74CE01
P 8200 1150
F 0 "C?" H 8318 1196 50  0000 L CNN
F 1 "CP" H 8318 1105 50  0000 L CNN
F 2 "" H 8238 1000 50  0001 C CNN
F 3 "~" H 8200 1150 50  0001 C CNN
	1    8200 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 900  7350 1000
Wire Wire Line
	8200 900  8200 1000
Wire Wire Line
	7350 1300 7350 1350
Wire Wire Line
	8200 1300 8200 1350
$Comp
L Device:C C?
U 1 1 5E77FC4F
P 9800 1150
F 0 "C?" H 9915 1196 50  0000 L CNN
F 1 "C" H 9915 1105 50  0000 L CNN
F 2 "" H 9838 1000 50  0001 C CNN
F 3 "~" H 9800 1150 50  0001 C CNN
	1    9800 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 900  8850 1000
Wire Wire Line
	8850 1000 9050 1000
Connection ~ 8850 1000
Wire Wire Line
	9650 1000 9800 1000
$Comp
L power:GNDA #PWR?
U 1 1 5E7A35F7
P 9800 1350
F 0 "#PWR?" H 9800 1100 50  0001 C CNN
F 1 "GNDA" H 9805 1177 50  0000 C CNN
F 2 "" H 9800 1350 50  0001 C CNN
F 3 "" H 9800 1350 50  0001 C CNN
	1    9800 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1300 8850 1350
Wire Wire Line
	9350 1300 9350 1350
Wire Wire Line
	9800 1300 9800 1350
$Comp
L Device:C C?
U 1 1 5E7B8DAB
P 5000 4300
F 0 "C?" V 4748 4300 50  0000 C CNN
F 1 "C" V 4839 4300 50  0000 C CNN
F 2 "" H 5038 4150 50  0001 C CNN
F 3 "~" H 5000 4300 50  0001 C CNN
	1    5000 4300
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E7BE847
P 4850 4300
F 0 "#PWR?" H 4850 4050 50  0001 C CNN
F 1 "GNDD" H 4854 4145 50  0000 C CNN
F 2 "" H 4850 4300 50  0001 C CNN
F 3 "" H 4850 4300 50  0001 C CNN
	1    4850 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 4300 5250 4300
Connection ~ 5250 4300
Wire Wire Line
	5250 4300 5250 4400
$Comp
L HE721C0500:HE721C0500 K?
U 1 1 5E7CCC60
P 3050 900
F 0 "K?" H 4000 1165 50  0000 C CNN
F 1 "HE721C0500" H 4000 1074 50  0000 C CNN
F 2 "DIP952W51P254L1905H550Q14N" H 4800 1000 50  0001 L CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/reed_relays/littelfuse_reed_relays_he700_datasheet.pdf.pdf" H 4800 900 50  0001 L CNN
F 4 "Reed Relays REED RELAY" H 4800 800 50  0001 L CNN "Description"
F 5 "5.5" H 4800 700 50  0001 L CNN "Height"
F 6 "LITTELFUSE" H 4800 600 50  0001 L CNN "Manufacturer_Name"
F 7 "HE721C0500" H 4800 500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "934-HE721C0500" H 4800 400 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=934-HE721C0500" H 4800 300 50  0001 L CNN "Mouser Price/Stock"
F 10 "1813284" H 4800 200 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/1813284" H 4800 100 50  0001 L CNN "RS Price/Stock"
	1    3050 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E739643
P 1100 2150
F 0 "#PWR?" H 1100 1900 50  0001 C CNN
F 1 "GNDD" H 1104 1995 50  0000 C CNN
F 2 "" H 1100 2150 50  0001 C CNN
F 3 "" H 1100 2150 50  0001 C CNN
	1    1100 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1500 2750 1500
Wire Wire Line
	2750 1500 2750 1000
Wire Wire Line
	2750 1000 2850 1000
Wire Wire Line
	3050 1400 2850 1400
Wire Wire Line
	800  1800 900  1800
$Comp
L power:+5VD #PWR?
U 1 1 5E78000A
P 5200 800
F 0 "#PWR?" H 5200 650 50  0001 C CNN
F 1 "+5VD" H 5215 973 50  0000 C CNN
F 2 "" H 5200 800 50  0001 C CNN
F 3 "" H 5200 800 50  0001 C CNN
	1    5200 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 5E7A0F93
P 2850 1200
F 0 "D?" V 2804 1279 50  0000 L CNN
F 1 "D" V 2895 1279 50  0000 L CNN
F 2 "" H 2850 1200 50  0001 C CNN
F 3 "~" H 2850 1200 50  0001 C CNN
	1    2850 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 1000 2850 1050
Connection ~ 2850 1000
Wire Wire Line
	2850 1000 3050 1000
Wire Wire Line
	2850 1400 2850 1350
Connection ~ 2850 1400
Text Label 5850 5000 0    50   ~ 0
RFID-SDA
Text Label 5850 5200 0    50   ~ 0
RFID-SCK
Text Label 5850 5500 0    50   ~ 0
RFID-MOSI
Text Label 5850 5300 0    50   ~ 0
RFID-MISO
Text Label 5850 4800 0    50   ~ 0
RFID-RST
Text Label 5850 5900 0    50   ~ 0
SD-MISO
Text Label 5850 6200 0    50   ~ 0
SD-MOSI
Text Label 5850 5800 0    50   ~ 0
SD-SCK
Text Label 1350 6650 1    50   ~ 0
VOL_DOWN
Text Label 5850 6700 0    50   ~ 0
VOL_DOWN
Text Label 1950 6650 1    50   ~ 0
VOL_UP
Text Label 5850 6600 0    50   ~ 0
VOL_UP
Text Label 2550 6650 1    50   ~ 0
TRK_NEXT
Text Label 5850 5600 0    50   ~ 0
TRK_NEXT
Text Label 3150 6650 1    50   ~ 0
TRK_PREV
Text Label 5850 5700 0    50   ~ 0
TRK_PREV
Text Label 5850 6400 0    50   ~ 0
LCK
Text Label 5850 6300 0    50   ~ 0
DIN
Text Label 5850 6500 0    50   ~ 0
BCK
Text Label 2150 1900 2    50   ~ 0
POWER_CTRL
Text Label 5850 6000 0    50   ~ 0
POWER_CTRL
Wire Wire Line
	8150 5100 8300 5100
Wire Wire Line
	8150 5200 8300 5200
Wire Wire Line
	8150 5300 8300 5300
$Comp
L power:GNDA #PWR?
U 1 1 5E7C4BAD
P 10600 4300
F 0 "#PWR?" H 10600 4050 50  0001 C CNN
F 1 "GNDA" H 10605 4127 50  0000 C CNN
F 2 "" H 10600 4300 50  0001 C CNN
F 3 "" H 10600 4300 50  0001 C CNN
	1    10600 4300
	1    0    0    -1  
$EndComp
Connection ~ 10300 4150
$Comp
L Device:C C?
U 1 1 5E7C49CA
P 10450 4150
F 0 "C?" V 10198 4150 50  0000 C CNN
F 1 "C" V 10289 4150 50  0000 C CNN
F 2 "" H 10488 4000 50  0001 C CNN
F 3 "~" H 10450 4150 50  0001 C CNN
	1    10450 4150
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E7B8A61
P 8000 5800
F 0 "#PWR?" H 8000 5550 50  0001 C CNN
F 1 "GNDA" H 8005 5627 50  0000 C CNN
F 2 "" H 8000 5800 50  0001 C CNN
F 3 "" H 8000 5800 50  0001 C CNN
	1    8000 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E7222C0
P 7600 5700
F 0 "#PWR?" H 7600 5450 50  0001 C CNN
F 1 "GNDA" H 7605 5527 50  0000 C CNN
F 2 "" H 7600 5700 50  0001 C CNN
F 3 "" H 7600 5700 50  0001 C CNN
	1    7600 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 5500 8300 5500
Connection ~ 8000 5500
$Comp
L Device:C C?
U 1 1 5E7B816D
P 8000 5650
F 0 "C?" H 8115 5696 50  0000 L CNN
F 1 "C" H 8115 5605 50  0000 L CNN
F 2 "" H 8038 5500 50  0001 C CNN
F 3 "~" H 8000 5650 50  0001 C CNN
	1    8000 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4850 7500 5000
Connection ~ 8050 5000
Wire Wire Line
	8000 5000 8050 5000
Wire Wire Line
	7500 5000 7500 5500
Connection ~ 7500 5000
Wire Wire Line
	7500 5000 7700 5000
$Comp
L Device:R R?
U 1 1 5E73006F
P 7850 5000
F 0 "R?" V 7643 5000 50  0000 C CNN
F 1 "10k" V 7734 5000 50  0000 C CNN
F 2 "" V 7780 5000 50  0001 C CNN
F 3 "~" H 7850 5000 50  0001 C CNN
	1    7850 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 5500 8000 5500
Text Label 8150 5100 0    50   ~ 0
BCK
Text Label 8150 5200 0    50   ~ 0
DIN
Text Label 8150 5300 0    50   ~ 0
LCK
Wire Wire Line
	7600 5400 8300 5400
Wire Wire Line
	7600 5700 7600 5400
$Comp
L power:+3.3VDAC #PWR?
U 1 1 5E7200C0
P 7500 4850
F 0 "#PWR?" H 7650 4800 50  0001 C CNN
F 1 "+3.3VDAC" H 7520 4993 50  0000 C CNN
F 2 "" H 7500 4850 50  0001 C CNN
F 3 "" H 7500 4850 50  0001 C CNN
	1    7500 4850
	1    0    0    -1  
$EndComp
Text Label 9050 4700 0    50   ~ 0
FMT
Text Label 8150 5000 0    50   ~ 0
SCK
Wire Wire Line
	8050 5000 8300 5000
Wire Wire Line
	8050 4700 9150 4700
Wire Wire Line
	8050 4700 8050 5000
Wire Wire Line
	9150 4800 9150 4700
Wire Wire Line
	9250 3250 9250 3100
Wire Wire Line
	9050 3250 9250 3250
Wire Wire Line
	9050 3350 9050 3250
Wire Wire Line
	8950 3150 8950 3350
Wire Wire Line
	9150 3150 9150 3100
Wire Wire Line
	8950 3150 9150 3150
Wire Wire Line
	9450 3350 9450 3100
Wire Wire Line
	9550 3350 9550 3100
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5E6FF5AC
P 9350 2900
F 0 "J?" V 9412 3144 50  0000 L CNN
F 1 "Speakers" V 9503 3144 50  0000 L CNN
F 2 "" H 9350 2900 50  0001 C CNN
F 3 "~" H 9350 2900 50  0001 C CNN
	1    9350 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	10300 4150 10300 4100
Wire Wire Line
	9450 4150 10300 4150
Wire Wire Line
	9450 4050 9450 4150
Wire Wire Line
	10300 4250 10300 4300
Wire Wire Line
	9550 4250 10300 4250
Wire Wire Line
	9550 4050 9550 4250
$Comp
L power:+5VA #PWR?
U 1 1 5E6FE8C9
P 10300 4100
F 0 "#PWR?" H 10300 3950 50  0001 C CNN
F 1 "+5VA" H 10315 4273 50  0000 C CNN
F 2 "" H 10300 4100 50  0001 C CNN
F 3 "" H 10300 4100 50  0001 C CNN
	1    10300 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5E6FE29B
P 10300 4300
F 0 "#PWR?" H 10300 4050 50  0001 C CNN
F 1 "GNDA" H 10305 4127 50  0000 C CNN
F 2 "" H 10300 4300 50  0001 C CNN
F 3 "" H 10300 4300 50  0001 C CNN
	1    10300 4300
	1    0    0    -1  
$EndComp
Text Label 9150 4200 0    50   ~ 0
R
Text Label 9050 4200 0    50   ~ 0
G
Text Label 8950 4200 0    50   ~ 0
L
Wire Wire Line
	9150 4300 9150 4050
Wire Wire Line
	9450 4300 9150 4300
Wire Wire Line
	9450 4800 9450 4300
Wire Wire Line
	9050 4400 9050 4050
Wire Wire Line
	9550 4400 9050 4400
Wire Wire Line
	9550 4800 9550 4400
Wire Wire Line
	8950 4500 8950 4050
Wire Wire Line
	9650 4500 8950 4500
Wire Wire Line
	9650 4800 9650 4500
$Comp
L Connector_Generic:Conn_01x07 J?
U 1 1 5E6EC86A
P 9250 3550
F 0 "J?" V 9122 3930 50  0000 L CNN
F 1 "PAM8403_OUT" V 9213 3930 50  0000 L CNN
F 2 "" H 9250 3550 50  0001 C CNN
F 3 "~" H 9250 3550 50  0001 C CNN
	1    9250 3550
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x07 J?
U 1 1 5E6EC242
P 9250 3850
F 0 "J?" V 9214 3462 50  0000 R CNN
F 1 "PAM8403_IN" V 9123 3462 50  0000 R CNN
F 2 "" H 9250 3850 50  0001 C CNN
F 3 "~" H 9250 3850 50  0001 C CNN
	1    9250 3850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x09 J?
U 1 1 5E6EB5E7
P 9250 5000
F 0 "J?" V 9375 4996 50  0000 C CNN
F 1 "PCM5102A_2" V 9466 4996 50  0000 C CNN
F 2 "" H 9250 5000 50  0001 C CNN
F 3 "~" H 9250 5000 50  0001 C CNN
	1    9250 5000
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5E6EB042
P 8500 5200
F 0 "J?" H 8580 5192 50  0000 L CNN
F 1 "PCM5102A_1" H 8580 5101 50  0000 L CNN
F 2 "" H 8500 5200 50  0001 C CNN
F 3 "~" H 8500 5200 50  0001 C CNN
	1    8500 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 900  5200 900 
Wire Wire Line
	5200 900  5200 800 
Wire Wire Line
	2750 1000 900  1000
Wire Wire Line
	900  1000 900  1800
Connection ~ 2750 1000
Wire Wire Line
	2850 1400 2850 1700
$Comp
L Device:R R?
U 1 1 5E7E133D
P 2400 1900
F 0 "R?" V 2193 1900 50  0000 C CNN
F 1 "220" V 2284 1900 50  0000 C CNN
F 2 "" V 2330 1900 50  0001 C CNN
F 3 "~" H 2400 1900 50  0001 C CNN
	1    2400 1900
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E750E05
P 2850 2100
F 0 "#PWR?" H 2850 1850 50  0001 C CNN
F 1 "GNDD" H 2854 1945 50  0000 C CNN
F 2 "" H 2850 2100 50  0001 C CNN
F 3 "" H 2850 2100 50  0001 C CNN
	1    2850 2100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC107 Q?
U 1 1 5E7CD992
P 2750 1900
F 0 "Q?" H 2941 1946 50  0000 L CNN
F 1 "BC107" H 2941 1855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-18-3" H 2950 1825 50  0001 L CIN
F 3 "http://www.b-kainka.de/Daten/Transistor/BC108.pdf" H 2750 1900 50  0001 L CNN
	1    2750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1900 2250 1900
$Comp
L XRP6272:XRP6272 U?
U 1 1 5E92EF18
P 2150 2400
F 0 "U?" H 2175 2365 50  0000 C CNN
F 1 "XRP6272" H 2175 2274 50  0000 C CNN
F 2 "" H 2150 2400 50  0001 C CNN
F 3 "" H 2150 2400 50  0001 C CNN
	1    2150 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5E930FFF
P 600 1900
F 0 "J?" H 708 2181 50  0000 C CNN
F 1 "Power" H 708 2090 50  0000 C CNN
F 2 "" H 600 1900 50  0001 C CNN
F 3 "~" H 600 1900 50  0001 C CNN
	1    600  1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1900 1100 2150
Wire Wire Line
	800  1900 1100 1900
Wire Wire Line
	800  2000 900  2000
Wire Wire Line
	900  2000 900  2650
Wire Wire Line
	900  2650 1300 2650
$Comp
L power:GNDD #PWR?
U 1 1 5E943686
P 1700 2950
F 0 "#PWR?" H 1700 2700 50  0001 C CNN
F 1 "GNDD" H 1704 2795 50  0000 C CNN
F 2 "" H 1700 2950 50  0001 C CNN
F 3 "" H 1700 2950 50  0001 C CNN
	1    1700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2850 1700 2850
Wire Wire Line
	1700 2850 1700 2950
Wire Wire Line
	1800 2750 1700 2750
Wire Wire Line
	1700 2750 1700 2650
Connection ~ 1700 2650
Wire Wire Line
	1700 2650 1800 2650
$Comp
L Device:R R?
U 1 1 5E94C408
P 2600 2950
F 0 "R?" H 2670 2996 50  0000 L CNN
F 1 "100k" H 2670 2905 50  0000 L CNN
F 2 "" V 2530 2950 50  0001 C CNN
F 3 "~" H 2600 2950 50  0001 C CNN
	1    2600 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E94C75C
P 2900 2750
F 0 "R?" V 2693 2750 50  0000 C CNN
F 1 "330k" V 2784 2750 50  0000 C CNN
F 2 "" V 2830 2750 50  0001 C CNN
F 3 "~" H 2900 2750 50  0001 C CNN
	1    2900 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 2750 2600 2750
Wire Wire Line
	2600 2750 2600 2800
Wire Wire Line
	2600 2750 2750 2750
Connection ~ 2600 2750
$Comp
L power:GNDD #PWR?
U 1 1 5E955619
P 2600 3100
F 0 "#PWR?" H 2600 2850 50  0001 C CNN
F 1 "GNDD" H 2604 2945 50  0000 C CNN
F 2 "" H 2600 3100 50  0001 C CNN
F 3 "" H 2600 3100 50  0001 C CNN
	1    2600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2650 3150 2750
Wire Wire Line
	3150 2750 3050 2750
$Comp
L Device:C C?
U 1 1 5E95BAFE
P 1300 2800
F 0 "C?" H 1415 2846 50  0000 L CNN
F 1 "4.7uF" H 1415 2755 50  0000 L CNN
F 2 "" H 1338 2650 50  0001 C CNN
F 3 "~" H 1300 2800 50  0001 C CNN
	1    1300 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E95BF90
P 1300 2950
F 0 "#PWR?" H 1300 2700 50  0001 C CNN
F 1 "GNDD" H 1304 2795 50  0000 C CNN
F 2 "" H 1300 2950 50  0001 C CNN
F 3 "" H 1300 2950 50  0001 C CNN
	1    1300 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E95C39E
P 3300 2800
F 0 "C?" H 3415 2846 50  0000 L CNN
F 1 "4.7uF" H 3415 2755 50  0000 L CNN
F 2 "" H 3338 2650 50  0001 C CNN
F 3 "~" H 3300 2800 50  0001 C CNN
	1    3300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2650 3150 2650
Wire Wire Line
	3150 2650 3300 2650
Connection ~ 3150 2650
$Comp
L power:GNDD #PWR?
U 1 1 5E963A75
P 3300 2950
F 0 "#PWR?" H 3300 2700 50  0001 C CNN
F 1 "GNDD" H 3304 2795 50  0000 C CNN
F 2 "" H 3300 2950 50  0001 C CNN
F 3 "" H 3300 2950 50  0001 C CNN
	1    3300 2950
	1    0    0    -1  
$EndComp
Connection ~ 1300 2650
Wire Wire Line
	1300 2650 1700 2650
Wire Wire Line
	9800 900  9800 1000
Connection ~ 9800 1000
$Comp
L Device:C C?
U 1 1 5E98019E
P 7350 1150
F 0 "C?" H 7465 1196 50  0000 L CNN
F 1 "C" H 7465 1105 50  0000 L CNN
F 2 "" H 7388 1000 50  0001 C CNN
F 3 "~" H 7350 1150 50  0001 C CNN
	1    7350 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Coupled L?
U 1 1 5E9A568F
P 7800 1150
F 0 "L?" H 7800 1431 50  0000 C CNN
F 1 "L_Coupled" H 7800 1340 50  0000 C CNN
F 2 "" H 7800 1150 50  0001 C CNN
F 3 "~" H 7800 1150 50  0001 C CNN
	1    7800 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1050 7600 1000
Wire Wire Line
	7600 1000 7350 1000
Connection ~ 7350 1000
Wire Wire Line
	7600 1250 7600 1300
Wire Wire Line
	7600 1300 7350 1300
Connection ~ 7350 1300
Wire Wire Line
	8000 1050 8000 1000
Wire Wire Line
	8000 1000 8200 1000
Connection ~ 8200 1000
Wire Wire Line
	8000 1250 8000 1300
Wire Wire Line
	8000 1300 8200 1300
Connection ~ 8200 1300
Wire Wire Line
	1900 5100 2200 5100
Wire Wire Line
	1900 5200 2200 5200
Wire Wire Line
	1900 5300 2200 5300
Wire Wire Line
	1900 5400 2200 5400
Wire Wire Line
	2300 4000 1900 4000
Wire Wire Line
	2300 4300 1900 4300
Wire Wire Line
	2300 4400 1900 4400
Wire Wire Line
	2300 4500 1900 4500
Wire Wire Line
	2300 4600 1900 4600
$Comp
L power:+3.3V #PWR?
U 1 1 5E74A136
P 2450 3900
F 0 "#PWR?" H 2450 3750 50  0001 C CNN
F 1 "+3.3V" H 2465 4073 50  0000 C CNN
F 2 "" H 2450 3900 50  0001 C CNN
F 3 "" H 2450 3900 50  0001 C CNN
	1    2450 3900
	1    0    0    -1  
$EndComp
Text Label 2200 5100 2    50   ~ 0
SD-CS
Text Label 2200 5200 2    50   ~ 0
SD-SCK
Text Label 2200 5300 2    50   ~ 0
SD-MOSI
Text Label 2200 5400 2    50   ~ 0
SD-MISO
Text Label 2300 4000 2    50   ~ 0
RFID-RST
$Comp
L power:GNDD #PWR?
U 1 1 5E704E6B
P 2450 4100
F 0 "#PWR?" H 2450 3850 50  0001 C CNN
F 1 "GNDD" H 2454 3945 50  0000 C CNN
F 2 "" H 2450 4100 50  0001 C CNN
F 3 "" H 2450 4100 50  0001 C CNN
	1    2450 4100
	1    0    0    -1  
$EndComp
Text Label 2300 4300 2    50   ~ 0
RFID-MISO
Text Label 2300 4400 2    50   ~ 0
RFID-MOSI
Text Label 2300 4500 2    50   ~ 0
RFID-SCK
Text Label 2300 4600 2    50   ~ 0
RFID-SDA
$Comp
L power:+5VD #PWR?
U 1 1 5E70186F
P 2350 5500
F 0 "#PWR?" H 2350 5350 50  0001 C CNN
F 1 "+5VD" H 2365 5673 50  0000 C CNN
F 2 "" H 2350 5500 50  0001 C CNN
F 3 "" H 2350 5500 50  0001 C CNN
	1    2350 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5600 1900 5600
$Comp
L power:GNDD #PWR?
U 1 1 5E700E8C
P 2350 5600
F 0 "#PWR?" H 2350 5350 50  0001 C CNN
F 1 "GNDD" H 2354 5445 50  0000 C CNN
F 2 "" H 2350 5600 50  0001 C CNN
F 3 "" H 2350 5600 50  0001 C CNN
	1    2350 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5E6E5B67
P 1700 5400
F 0 "J?" H 1780 5392 50  0000 L CNN
F 1 "SDCARD" H 1780 5301 50  0000 L CNN
F 2 "" H 1700 5400 50  0001 C CNN
F 3 "~" H 1700 5400 50  0001 C CNN
	1    1700 5400
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J?
U 1 1 5E6E555E
P 1700 4300
F 0 "J?" H 1780 4292 50  0000 L CNN
F 1 "RFID-RC522" H 1780 4201 50  0000 L CNN
F 2 "" H 1700 4300 50  0001 C CNN
F 3 "~" H 1700 4300 50  0001 C CNN
	1    1700 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	10600 4300 10600 4150
Wire Wire Line
	1900 4100 2450 4100
Wire Wire Line
	1900 3900 2450 3900
Wire Wire Line
	1900 5500 2350 5500
$Comp
L power:+3.3V #PWR?
U 1 1 5EA0DAD7
P 5250 3950
F 0 "#PWR?" H 5250 3800 50  0001 C CNN
F 1 "+3.3V" H 5265 4123 50  0000 C CNN
F 2 "" H 5250 3950 50  0001 C CNN
F 3 "" H 5250 3950 50  0001 C CNN
	1    5250 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EA0E2C5
P 5900 4050
F 0 "#PWR?" H 5900 3900 50  0001 C CNN
F 1 "+3.3V" H 5915 4223 50  0000 C CNN
F 2 "" H 5900 4050 50  0001 C CNN
F 3 "" H 5900 4050 50  0001 C CNN
	1    5900 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EA0EA78
P 3300 2650
F 0 "#PWR?" H 3300 2500 50  0001 C CNN
F 1 "+3.3V" H 3315 2823 50  0000 C CNN
F 2 "" H 3300 2650 50  0001 C CNN
F 3 "" H 3300 2650 50  0001 C CNN
	1    3300 2650
	1    0    0    -1  
$EndComp
Connection ~ 3300 2650
$Comp
L power:+5VA #PWR?
U 1 1 5EA218E5
P 8850 900
F 0 "#PWR?" H 8850 750 50  0001 C CNN
F 1 "+5VA" H 8865 1073 50  0000 C CNN
F 2 "" H 8850 900 50  0001 C CNN
F 3 "" H 8850 900 50  0001 C CNN
	1    8850 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5EA24CA8
P 9350 1350
F 0 "#PWR?" H 9350 1100 50  0001 C CNN
F 1 "GNDA" H 9355 1177 50  0000 C CNN
F 2 "" H 9350 1350 50  0001 C CNN
F 3 "" H 9350 1350 50  0001 C CNN
	1    9350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5EA24EEF
P 8850 1350
F 0 "#PWR?" H 8850 1100 50  0001 C CNN
F 1 "GNDA" H 8855 1177 50  0000 C CNN
F 2 "" H 8850 1350 50  0001 C CNN
F 3 "" H 8850 1350 50  0001 C CNN
	1    8850 1350
	1    0    0    -1  
$EndComp
Text Label 5850 5100 0    50   ~ 0
SD-CS
$EndSCHEMATC
