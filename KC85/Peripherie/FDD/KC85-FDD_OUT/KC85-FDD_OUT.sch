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
L Connector_Generic:Conn_02x13_Row_Letter_First J1
U 1 1 663B0B6F
P 2875 2625
F 0 "J1" H 2925 3442 50  0000 C CNN
F 1 "Conn_02x13_Row_Letter_First" H 2925 3351 50  0000 C CNN
F 2 "EFS:EFS2x13_DIN_male_a1" H 2875 2625 50  0001 C CNN
F 3 "~" H 2875 2625 50  0001 C CNN
	1    2875 2625
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x17_Odd_Even J2
U 1 1 663B1A29
P 5350 2700
F 0 "J2" H 5400 3717 50  0000 C CNN
F 1 "Conn_02x17_Odd_Even" H 5400 3626 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x17_P2.54mm_Vertical" H 5350 2700 50  0001 C CNN
F 3 "~" H 5350 2700 50  0001 C CNN
	1    5350 2700
	-1   0    0    -1  
$EndComp
Text GLabel 2675 2325 0    50   Input ~ 0
SE3
Text GLabel 2675 2225 0    50   Input ~ 0
IX
Text GLabel 3175 2425 2    50   Input ~ 0
SE0
Text GLabel 2675 2125 0    50   Input ~ 0
SE2
Text GLabel 2675 3225 0    50   Input ~ 0
RDY
$Comp
L power:GND #PWR0101
U 1 1 663B5AEB
P 2275 3600
F 0 "#PWR0101" H 2275 3350 50  0001 C CNN
F 1 "GND" H 2280 3427 50  0000 C CNN
F 2 "" H 2275 3600 50  0001 C CNN
F 3 "" H 2275 3600 50  0001 C CNN
	1    2275 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 3025 2275 3025
Wire Wire Line
	2275 2925 2275 3025
Connection ~ 2275 3025
Wire Wire Line
	2275 3025 2275 3125
Wire Wire Line
	2675 3125 2275 3125
Connection ~ 2275 3125
Wire Wire Line
	2275 3125 2275 3600
$Comp
L power:GND #PWR0102
U 1 1 663B656A
P 3500 3550
F 0 "#PWR0102" H 3500 3300 50  0001 C CNN
F 1 "GND" H 3505 3377 50  0000 C CNN
F 2 "" H 3500 3550 50  0001 C CNN
F 3 "" H 3500 3550 50  0001 C CNN
	1    3500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3175 2725 3500 2725
Wire Wire Line
	3500 2725 3500 2825
Wire Wire Line
	3175 2825 3500 2825
Connection ~ 3500 2825
Wire Wire Line
	3500 2825 3500 3550
Wire Wire Line
	3175 2125 3500 2125
Wire Wire Line
	3500 2125 3500 2225
Connection ~ 3500 2725
Wire Wire Line
	3175 2225 3500 2225
Connection ~ 3500 2225
Wire Wire Line
	3500 2225 3500 2325
Wire Wire Line
	3175 2325 3500 2325
Connection ~ 3500 2325
Wire Wire Line
	3500 2325 3500 2725
Wire Wire Line
	2275 2925 2275 2525
Connection ~ 2275 2925
Wire Wire Line
	2275 2525 2675 2525
Wire Wire Line
	2275 2925 2675 2925
Text GLabel 2675 2625 0    50   Input ~ 0
ST
Text GLabel 2675 2725 0    50   Input ~ 0
WD
Text GLabel 2675 2825 0    50   Input ~ 0
WE
Text GLabel 2675 2425 0    50   Input ~ 0
SE1
Text GLabel 3175 2625 2    50   Input ~ 0
SD
Text GLabel 3175 2925 2    50   Input ~ 0
T0
Text GLabel 3175 3025 2    50   Input ~ 0
WP
Text GLabel 3175 3125 2    50   Input ~ 0
RD
Text GLabel 3175 3225 2    50   Input ~ 0
SS
$Comp
L power:GND #PWR0103
U 1 1 663BAB06
P 5550 3675
F 0 "#PWR0103" H 5550 3425 50  0001 C CNN
F 1 "GND" H 5555 3502 50  0000 C CNN
F 2 "" H 5550 3675 50  0001 C CNN
F 3 "" H 5550 3675 50  0001 C CNN
	1    5550 3675
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1900 5550 2000
Connection ~ 5550 2000
Wire Wire Line
	5550 2000 5550 2100
Connection ~ 5550 2100
Wire Wire Line
	5550 2100 5550 2200
Connection ~ 5550 2200
Wire Wire Line
	5550 2200 5550 2300
Connection ~ 5550 2300
Wire Wire Line
	5550 2300 5550 2400
Connection ~ 5550 2400
Wire Wire Line
	5550 2400 5550 2500
Connection ~ 5550 2500
Wire Wire Line
	5550 2500 5550 2600
Connection ~ 5550 2600
Wire Wire Line
	5550 2600 5550 2700
Connection ~ 5550 2700
Wire Wire Line
	5550 2700 5550 2800
Connection ~ 5550 2800
Wire Wire Line
	5550 2800 5550 2900
Connection ~ 5550 2900
Wire Wire Line
	5550 2900 5550 3000
Connection ~ 5550 3000
Wire Wire Line
	5550 3000 5550 3100
Connection ~ 5550 3100
Wire Wire Line
	5550 3100 5550 3200
Connection ~ 5550 3200
Wire Wire Line
	5550 3200 5550 3300
Connection ~ 5550 3300
Wire Wire Line
	5550 3300 5550 3400
Connection ~ 5550 3400
Wire Wire Line
	5550 3400 5550 3500
Connection ~ 5550 3500
Wire Wire Line
	5550 3500 5550 3675
Text GLabel 5050 2200 0    50   Input ~ 0
IX
Text GLabel 2675 2025 0    50   Input ~ 0
FLT
Text GLabel 3175 2025 2    50   Input ~ 0
FR
Text GLabel 3175 2525 2    50   Input ~ 0
TS
Text GLabel 5050 2100 0    50   Input ~ 0
SE3
Text GLabel 5050 2300 0    50   Input ~ 0
SE0
Text GLabel 5050 2400 0    50   Input ~ 0
SE1
Text GLabel 5050 2500 0    50   Input ~ 0
SE2
Text GLabel 5050 2700 0    50   Input ~ 0
SD
Text GLabel 5050 2800 0    50   Input ~ 0
ST
Text GLabel 5050 2900 0    50   Input ~ 0
WD
Text GLabel 5050 3000 0    50   Input ~ 0
WE
Text GLabel 5050 3500 0    50   Input ~ 0
RDY
Text GLabel 5050 3400 0    50   Input ~ 0
SS
Text GLabel 5050 3200 0    50   Input ~ 0
WP
Text GLabel 5050 3300 0    50   Input ~ 0
RD
Text GLabel 5050 3100 0    50   Input ~ 0
T0
$EndSCHEMATC
