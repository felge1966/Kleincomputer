EESchema Schematic File Version 2
LIBS:M030-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:M030-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "2708 Adapter für M030"
Date "09.02.2016"
Rev ""
Comp "Mario Leubner"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 27256 U1
U 1 1 5699254B
P 2700 2300
F 0 "U1" H 2700 2950 50  0000 C CNN
F 1 "M030-Fassung" H 2800 2300 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm_LongPads" H 2700 2300 50  0001 C CNN
F 3 "" H 2700 2300 50  0000 C CNN
	1    2700 2300
	1    0    0    -1  
$EndComp
$Comp
L U555C U2
U 1 1 56992572
P 2700 4750
F 0 "U2" H 2700 4900 60  0000 C CNN
F 1 "U555C" H 2700 4750 60  0000 C CNN
F 2 "M030_Footprints:DIP-24_Testsockel" H 2700 4750 60  0001 C CNN
F 3 "" H 2700 4750 60  0000 C CNN
	1    2700 4750
	1    0    0    -1  
$EndComp
$Comp
L BC237 T1
U 1 1 56992913
P 4350 5550
F 0 "T1" H 4550 5600 50  0000 L CNN
F 1 "SC237" H 4550 5500 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 4550 5475 50  0001 L CIN
F 3 "" H 4350 5550 50  0000 L CNN
	1    4350 5550
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 569929C2
P 4250 5850
F 0 "#PWR01" H 4250 5600 50  0001 C CNN
F 1 "GND" H 4250 5700 50  0000 C CNN
F 2 "" H 4250 5850 50  0000 C CNN
F 3 "" H 4250 5850 50  0000 C CNN
	1    4250 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 569929E2
P 2700 5600
F 0 "#PWR02" H 2700 5350 50  0001 C CNN
F 1 "GND" H 2700 5450 50  0000 C CNN
F 2 "" H 2700 5600 50  0000 C CNN
F 3 "" H 2700 5600 50  0000 C CNN
	1    2700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5850 4250 5750
Wire Bus Line
	3700 900  3700 4650
Wire Bus Line
	3700 900  1600 900 
Wire Bus Line
	1600 900  1600 4850
Entry Bus Bus
	3600 4750 3700 4650
Entry Bus Bus
	3600 4650 3700 4550
Entry Bus Bus
	3600 4550 3700 4450
Entry Bus Bus
	3600 4450 3700 4350
Entry Bus Bus
	3600 4350 3700 4250
Entry Bus Bus
	3600 4250 3700 4150
Entry Bus Bus
	3600 4150 3700 4050
Entry Bus Bus
	3600 4050 3700 3950
Wire Wire Line
	3400 4050 3600 4050
Wire Wire Line
	3600 4150 3400 4150
Wire Wire Line
	3400 4250 3600 4250
Wire Wire Line
	3600 4350 3400 4350
Wire Wire Line
	3400 4450 3600 4450
Wire Wire Line
	3600 4550 3400 4550
Wire Wire Line
	3400 4650 3600 4650
Wire Wire Line
	3600 4750 3400 4750
Text Label 3450 4050 0    60   ~ 0
D0
Text Label 3450 4150 0    60   ~ 0
D1
Text Label 3450 4250 0    60   ~ 0
D2
Text Label 3450 4350 0    60   ~ 0
D3
Text Label 3450 4450 0    60   ~ 0
D4
Text Label 3450 4550 0    60   ~ 0
D5
Text Label 3450 4650 0    60   ~ 0
D6
Text Label 3450 4750 0    60   ~ 0
D7
Entry Bus Bus
	3600 1400 3700 1300
Entry Bus Bus
	3600 1500 3700 1400
Entry Bus Bus
	3600 1600 3700 1500
Entry Bus Bus
	3600 1700 3700 1600
Entry Bus Bus
	3600 1800 3700 1700
Entry Bus Bus
	3600 1900 3700 1800
Entry Bus Bus
	3600 2000 3700 1900
Wire Wire Line
	3400 1400 3600 1400
Wire Wire Line
	3400 1500 3600 1500
Wire Wire Line
	3600 1600 3400 1600
Wire Wire Line
	3400 1700 3600 1700
Wire Wire Line
	3400 1800 3600 1800
Entry Bus Bus
	3600 2100 3700 2000
Wire Wire Line
	3600 1900 3400 1900
Wire Wire Line
	3400 2000 3600 2000
Wire Wire Line
	3600 2100 3400 2100
Text Label 3450 1400 0    60   ~ 0
D0
Text Label 3450 1500 0    60   ~ 0
D1
Text Label 3450 1600 0    60   ~ 0
D2
Text Label 3450 1700 0    60   ~ 0
D3
Text Label 3450 1800 0    60   ~ 0
D4
Text Label 3450 1900 0    60   ~ 0
D5
Text Label 3450 2000 0    60   ~ 0
D6
Text Label 3450 2100 0    60   ~ 0
D7
Entry Bus Bus
	1600 1300 1700 1400
Entry Bus Bus
	1600 1500 1700 1600
Entry Bus Bus
	1600 1400 1700 1500
Entry Bus Bus
	1600 1600 1700 1700
Entry Bus Bus
	1600 1700 1700 1800
Entry Bus Bus
	1600 1800 1700 1900
Entry Bus Bus
	1600 1900 1700 2000
Entry Bus Bus
	1600 2200 1700 2300
Wire Wire Line
	2000 1400 1700 1400
Wire Wire Line
	1700 1500 2000 1500
Wire Wire Line
	2000 1600 1700 1600
Wire Wire Line
	1700 1700 2000 1700
Wire Wire Line
	2000 1800 1700 1800
Wire Wire Line
	1700 1900 2000 1900
Wire Wire Line
	2000 2000 1700 2000
Wire Wire Line
	1700 2100 2000 2100
Wire Wire Line
	1700 2200 2000 2200
Wire Wire Line
	2000 2300 1700 2300
NoConn ~ 2000 2400
NoConn ~ 2000 2500
NoConn ~ 2000 2600
NoConn ~ 2000 2800
NoConn ~ 2000 2900
Entry Bus Bus
	1600 4850 1700 4950
Wire Wire Line
	2000 4950 1700 4950
Entry Bus Bus
	1600 2000 1700 2100
Entry Bus Bus
	1600 2100 1700 2200
Entry Bus Bus
	1600 3950 1700 4050
Entry Bus Bus
	1600 4050 1700 4150
Entry Bus Bus
	1600 4150 1700 4250
Entry Bus Bus
	1600 4250 1700 4350
Entry Bus Bus
	1600 4350 1700 4450
Entry Bus Bus
	1600 4450 1700 4550
Entry Bus Bus
	1600 4550 1700 4650
Entry Bus Bus
	1600 4650 1700 4750
Entry Bus Bus
	1600 4750 1700 4850
Wire Wire Line
	2000 4050 1700 4050
Wire Wire Line
	1700 4150 2000 4150
Wire Wire Line
	2000 4250 1700 4250
Wire Wire Line
	1700 4350 2000 4350
Wire Wire Line
	2000 4450 1700 4450
Wire Wire Line
	1700 4550 2000 4550
Wire Wire Line
	2000 4650 1700 4650
Wire Wire Line
	1700 4750 2000 4750
Wire Wire Line
	2000 4850 1700 4850
Text Label 1800 4050 0    60   ~ 0
A0
Text Label 1800 4150 0    60   ~ 0
A1
Text Label 1800 4250 0    60   ~ 0
A2
Text Label 1800 4350 0    60   ~ 0
A3
Text Label 1800 4450 0    60   ~ 0
A4
Text Label 1800 4550 0    60   ~ 0
A5
Text Label 1800 4650 0    60   ~ 0
A6
Text Label 1800 4750 0    60   ~ 0
A7
Text Label 1800 4850 0    60   ~ 0
A8
Text Label 1800 4950 0    60   ~ 0
A9
Text Label 1800 1400 0    60   ~ 0
A0
Text Label 1800 1500 0    60   ~ 0
A1
Text Label 1800 1600 0    60   ~ 0
A2
Text Label 1800 1700 0    60   ~ 0
A3
Text Label 1800 1800 0    60   ~ 0
A4
Text Label 1800 1900 0    60   ~ 0
A5
Text Label 1800 2000 0    60   ~ 0
A6
Text Label 1800 2100 0    60   ~ 0
A7
Text Label 1800 2200 0    60   ~ 0
A8
Text Label 1800 2300 0    60   ~ 0
A9
$Comp
L GND #PWR03
U 1 1 5699668C
P 2700 3350
F 0 "#PWR03" H 2700 3100 50  0001 C CNN
F 1 "GND" H 2700 3200 50  0000 C CNN
F 2 "" H 2700 3350 50  0000 C CNN
F 3 "" H 2700 3350 50  0000 C CNN
	1    2700 3350
	1    0    0    -1  
$EndComp
Text Notes 7350 6900 0    100  ~ 0
M030 Programmieradapter für 2708 / U555C
Wire Wire Line
	4800 4300 4800 5550
Wire Wire Line
	2700 1250 2700 1150
Wire Wire Line
	2700 1150 6350 1150
Wire Wire Line
	6350 2350 5900 2350
Wire Wire Line
	5900 2350 5900 1150
Connection ~ 5900 1150
$Comp
L GND #PWR04
U 1 1 56997847
P 6350 1750
F 0 "#PWR04" H 6350 1500 50  0001 C CNN
F 1 "GND" H 6350 1600 50  0000 C CNN
F 2 "" H 6350 1750 50  0000 C CNN
F 3 "" H 6350 1750 50  0000 C CNN
	1    6350 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 569979F1
P 6350 3050
F 0 "#PWR05" H 6350 2800 50  0001 C CNN
F 1 "GND" H 6350 2900 50  0000 C CNN
F 2 "" H 6350 3050 50  0000 C CNN
F 3 "" H 6350 3050 50  0000 C CNN
	1    6350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1450 6350 1750
Wire Wire Line
	6350 2650 6350 3050
$Comp
L GND #PWR06
U 1 1 56997A99
P 7850 3050
F 0 "#PWR06" H 7850 2800 50  0001 C CNN
F 1 "GND" H 7850 2900 50  0000 C CNN
F 2 "" H 7850 3050 50  0000 C CNN
F 3 "" H 7850 3050 50  0000 C CNN
	1    7850 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2750 7850 3050
$Comp
L GND #PWR07
U 1 1 56997B4F
P 9250 1750
F 0 "#PWR07" H 9250 1500 50  0001 C CNN
F 1 "GND" H 9250 1600 50  0000 C CNN
F 2 "" H 9250 1750 50  0000 C CNN
F 3 "" H 9250 1750 50  0000 C CNN
	1    9250 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1150 9250 1750
Wire Wire Line
	7450 1150 9250 1150
$Comp
L R R1
U 1 1 56997D0B
P 4250 4150
F 0 "R1" V 4330 4150 50  0000 C CNN
F 1 "1,2k" V 4250 4150 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4180 4150 50  0001 C CNN
F 3 "" H 4250 4150 50  0000 C CNN
	1    4250 4150
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 56997D98
P 4800 4150
F 0 "R2" V 4880 4150 50  0000 C CNN
F 1 "4,7k" V 4800 4150 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4730 4150 50  0001 C CNN
F 3 "" H 4800 4150 50  0000 C CNN
	1    4800 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5250 1450 5250
Wire Wire Line
	1450 5250 1450 6250
Wire Wire Line
	1450 6250 8900 6250
Wire Wire Line
	8900 6250 8900 1550
Wire Wire Line
	8900 1550 7550 1550
Wire Wire Line
	7550 1550 7550 1450
Wire Wire Line
	2000 5450 1300 5450
Wire Wire Line
	1300 5450 1300 3200
Wire Wire Line
	1300 3200 2000 3200
Wire Wire Line
	2000 3100 1850 3100
Wire Wire Line
	1850 3100 1850 3550
Wire Wire Line
	1850 3550 4800 3550
Wire Wire Line
	4800 3550 4800 4000
Wire Wire Line
	2000 5150 1450 5150
Wire Wire Line
	1450 5150 1450 3850
Wire Wire Line
	1450 3850 6750 3850
Wire Wire Line
	4250 4000 4250 3850
Connection ~ 4250 3850
$Comp
L RELAY_1S-RESCUE-M030 K1
U 1 1 5699B649
P 6400 4450
F 0 "K1" H 6650 4650 50  0000 C CNN
F 1 "RGS 13/1" H 6650 4200 50  0000 C CNN
F 2 "M030_Footprints:RGS13" H 6400 4450 50  0001 C CNN
F 3 "" H 6400 4450 50  0000 C CNN
	1    6400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3850 8200 3850
Wire Wire Line
	8200 3850 8200 2350
Wire Wire Line
	8200 2350 7450 2350
$Comp
L GND #PWR08
U 1 1 5699C96E
P 6400 4850
F 0 "#PWR08" H 6400 4600 50  0001 C CNN
F 1 "GND" H 6400 4700 50  0000 C CNN
F 2 "" H 6400 4850 50  0000 C CNN
F 3 "" H 6400 4850 50  0000 C CNN
	1    6400 4850
	1    0    0    -1  
$EndComp
$Comp
L D D6
U 1 1 5699CAFF
P 5850 4400
F 0 "D6" H 5850 4500 50  0000 C CNN
F 1 "SAY12" H 5850 4300 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Vertical_AnodeUp" H 5850 4400 50  0001 C CNN
F 3 "" H 5850 4400 50  0000 C CNN
	1    5850 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 4550 5850 4850
Wire Wire Line
	5850 4850 6400 4850
Connection ~ 6400 4850
Wire Wire Line
	5850 4050 5850 4250
Wire Wire Line
	2000 2700 1750 2700
Wire Wire Line
	1750 2700 1750 3650
Wire Wire Line
	1750 3650 8500 3650
Wire Wire Line
	6400 3650 6400 4050
Connection ~ 6400 4050
Wire Wire Line
	6400 4050 5850 4050
Text Label 7650 3850 0    60   ~ 0
+12V
Text Label 8950 4500 0    60   ~ 0
-5V
$Comp
L LED D2
U 1 1 5699E295
P 8500 4950
F 0 "D2" V 8500 5050 50  0000 C CNN
F 1 "+5V" V 8500 4800 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 8500 4950 50  0001 C CNN
F 3 "" H 8500 4950 50  0000 C CNN
	1    8500 4950
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 5699E372
P 9250 4950
F 0 "D3" V 9250 5050 50  0000 C CNN
F 1 "-5V" V 9250 4800 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 9250 4950 50  0001 C CNN
F 3 "" H 9250 4950 50  0000 C CNN
	1    9250 4950
	0    -1   1    0   
$EndComp
$Comp
L LED D1
U 1 1 5699E3C9
P 8000 4950
F 0 "D1" V 8000 5050 50  0000 C CNN
F 1 "+12V" V 8000 4800 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 8000 4950 50  0001 C CNN
F 3 "" H 8000 4950 50  0000 C CNN
	1    8000 4950
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 5699E645
P 8000 5500
F 0 "R3" V 8080 5500 50  0000 C CNN
F 1 "4,7k" V 8000 5500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 7930 5500 50  0001 C CNN
F 3 "" H 8000 5500 50  0000 C CNN
	1    8000 5500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5699E6AC
P 8500 5500
F 0 "R4" V 8580 5500 50  0000 C CNN
F 1 "1,2k" V 8500 5500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8430 5500 50  0001 C CNN
F 3 "" H 8500 5500 50  0000 C CNN
	1    8500 5500
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5699E6F7
P 9250 5500
F 0 "R5" V 9330 5500 50  0000 C CNN
F 1 "1,2k" V 9250 5500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 9180 5500 50  0001 C CNN
F 3 "" H 9250 5500 50  0000 C CNN
	1    9250 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5699E76C
P 8000 5850
F 0 "#PWR09" H 8000 5600 50  0001 C CNN
F 1 "GND" H 8000 5700 50  0000 C CNN
F 2 "" H 8000 5850 50  0000 C CNN
F 3 "" H 8000 5850 50  0000 C CNN
	1    8000 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5699E87D
P 8500 5850
F 0 "#PWR010" H 8500 5600 50  0001 C CNN
F 1 "GND" H 8500 5700 50  0000 C CNN
F 2 "" H 8500 5850 50  0000 C CNN
F 3 "" H 8500 5850 50  0000 C CNN
	1    8500 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5699E8BB
P 9250 5850
F 0 "#PWR011" H 9250 5600 50  0001 C CNN
F 1 "GND" H 9250 5700 50  0000 C CNN
F 2 "" H 9250 5850 50  0000 C CNN
F 3 "" H 9250 5850 50  0000 C CNN
	1    9250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5650 9250 5850
Wire Wire Line
	8500 5850 8500 5650
Wire Wire Line
	8000 5650 8000 5850
Wire Wire Line
	9250 5150 9250 5350
Wire Wire Line
	8500 5350 8500 5150
Wire Wire Line
	8000 5150 8000 5350
Text Label 7650 3650 0    60   ~ 0
+5V
Wire Wire Line
	8500 3650 8500 4750
Connection ~ 6400 3650
Connection ~ 8900 4500
Wire Wire Line
	2700 3900 2700 3650
Connection ~ 2700 3650
Wire Wire Line
	9250 4750 9250 4500
Wire Wire Line
	9250 4500 8900 4500
$Comp
L NME0505DC U4
U 1 1 56B90187
P 6900 1300
F 0 "U4" H 6900 1600 50  0000 C CNN
F 1 "ROM-0505S" H 6900 1000 50  0000 C CNN
F 2 "M030_Footprints:DCDC" H 6900 1300 50  0001 C CNN
F 3 "" H 6900 1300 50  0000 C CNN
	1    6900 1300
	1    0    0    -1  
$EndComp
$Comp
L NME0512DC U3
U 1 1 56B90225
P 6900 2500
F 0 "U3" H 6900 2800 50  0000 C CNN
F 1 "ROM-0512S" H 6900 2200 50  0000 C CNN
F 2 "M030_Footprints:DCDC" H 6900 2500 50  0001 C CNN
F 3 "" H 6900 2500 50  0000 C CNN
	1    6900 2500
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 56BE2B96
P 5350 1300
F 0 "C1" H 5375 1400 50  0000 L CNN
F 1 "10µ" H 5375 1200 50  0000 L CNN
F 2 "Discret:C1V8" H 5388 1150 50  0001 C CNN
F 3 "" H 5350 1300 50  0000 C CNN
	1    5350 1300
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 56BE2E77
P 7550 2500
F 0 "C2" H 7575 2600 50  0000 L CNN
F 1 "10µ" H 7575 2400 50  0000 L CNN
F 2 "Discret:C1V8" H 7588 2350 50  0001 C CNN
F 3 "" H 7550 2500 50  0000 C CNN
	1    7550 2500
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 56BE2EB2
P 7550 1300
F 0 "C3" H 7575 1400 50  0000 L CNN
F 1 "10µ" H 7575 1200 50  0000 L CNN
F 2 "Discret:C1V8" H 7588 1150 50  0001 C CNN
F 3 "" H 7550 1300 50  0000 C CNN
	1    7550 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 56BE3E61
P 5350 1450
F 0 "#PWR012" H 5350 1200 50  0001 C CNN
F 1 "GND" H 5350 1300 50  0000 C CNN
F 2 "" H 5350 1450 50  0000 C CNN
F 3 "" H 5350 1450 50  0000 C CNN
	1    5350 1450
	1    0    0    -1  
$EndComp
Connection ~ 7550 2650
Connection ~ 7550 2350
Connection ~ 7550 1150
Connection ~ 7850 1550
Connection ~ 5350 1150
$Comp
L ZENER D4
U 1 1 56BF21C7
P 7850 1350
F 0 "D4" V 7850 1500 50  0000 C CNN
F 1 "5,1V" V 7750 1500 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Vertical_KathodeUp" H 7850 1350 50  0001 C CNN
F 3 "" H 7850 1350 50  0000 C CNN
	1    7850 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 1450 7450 1450
Connection ~ 7550 1450
$Comp
L ZENER D5
U 1 1 56BF34D1
P 7850 2550
F 0 "D5" V 7850 2700 50  0000 C CNN
F 1 "12V" V 7750 2700 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Vertical_KathodeUp" H 7850 2550 50  0001 C CNN
F 3 "" H 7850 2550 50  0000 C CNN
	1    7850 2550
	0    1    1    0   
$EndComp
Connection ~ 7850 1150
Connection ~ 7850 2350
Wire Wire Line
	7850 2750 7550 2750
Wire Wire Line
	7550 2750 7550 2650
Wire Wire Line
	7550 2650 7450 2650
Connection ~ 7850 2750
Connection ~ 6750 3850
Wire Wire Line
	6750 3850 6750 4200
Wire Wire Line
	6750 4200 8000 4200
Wire Wire Line
	8000 4200 8000 4750
Wire Wire Line
	4250 4300 4250 5350
Wire Wire Line
	4250 5350 3450 5350
Wire Wire Line
	3450 5350 3450 5900
Wire Wire Line
	3450 5900 1550 5900
Wire Wire Line
	1550 5900 1550 5350
Wire Wire Line
	1550 5350 2000 5350
Wire Wire Line
	4800 5550 4550 5550
Connection ~ 4250 5350
Text Label 1750 5150 0    60   ~ 0
Udd
Text Label 1750 5250 0    60   ~ 0
Ubb
Text Label 1750 5450 0    60   ~ 0
PR
Text Label 1750 5350 0    60   ~ 0
CS/WE
Text Label 1850 3100 0    60   ~ 0
/CE
Text Label 3050 1150 0    60   ~ 0
Vcc
$EndSCHEMATC
