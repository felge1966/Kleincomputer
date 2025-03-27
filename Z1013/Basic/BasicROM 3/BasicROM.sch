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
L Memory_EPROM:27C512 U2
U 1 1 61B9A1D1
P 5300 3150
F 0 "U2" H 5300 4431 50  0000 C CNN
F 1 "27C512" H 5300 4340 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 5300 3150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 5300 3150 50  0001 C CNN
	1    5300 3150
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:628128_DIP32_SSOP32 U3
U 1 1 61B9C2C4
P 7675 3050
F 0 "U3" H 7675 4231 50  0000 C CNN
F 1 "628128_DIP32_SSOP32" H 7675 4140 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 7675 3050 50  0001 C CNN
F 3 "http://www.futurlec.com/Datasheet/Memory/628128.pdf" H 7675 3050 50  0001 C CNN
	1    7675 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR05
U 1 1 61BA7F4A
P 5300 1700
F 0 "#PWR05" H 5300 1550 50  0001 C CNN
F 1 "+5P" H 5315 1873 50  0000 C CNN
F 2 "" H 5300 1700 50  0001 C CNN
F 3 "" H 5300 1700 50  0001 C CNN
	1    5300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR07
U 1 1 61BA8919
P 7675 1725
F 0 "#PWR07" H 7675 1575 50  0001 C CNN
F 1 "+5P" H 7690 1898 50  0000 C CNN
F 2 "" H 7675 1725 50  0001 C CNN
F 3 "" H 7675 1725 50  0001 C CNN
	1    7675 1725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR01
U 1 1 61BA919E
P 2675 4500
F 0 "#PWR01" H 2675 4350 50  0001 C CNN
F 1 "+5P" H 2690 4673 50  0000 C CNN
F 2 "" H 2675 4500 50  0001 C CNN
F 3 "" H 2675 4500 50  0001 C CNN
	1    2675 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61BAAC00
P 2675 5375
F 0 "#PWR02" H 2675 5125 50  0001 C CNN
F 1 "GND" H 2680 5202 50  0000 C CNN
F 2 "" H 2675 5375 50  0001 C CNN
F 3 "" H 2675 5375 50  0001 C CNN
	1    2675 5375
	1    0    0    -1  
$EndComp
Connection ~ 2675 5000
Wire Wire Line
	2675 5000 2675 5375
Wire Wire Line
	2675 4600 2675 4500
$Comp
L power:GND #PWR06
U 1 1 61BB6952
P 5300 4375
F 0 "#PWR06" H 5300 4125 50  0001 C CNN
F 1 "GND" H 5305 4202 50  0000 C CNN
F 2 "" H 5300 4375 50  0001 C CNN
F 3 "" H 5300 4375 50  0001 C CNN
	1    5300 4375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 61BB6FC8
P 7675 4325
F 0 "#PWR08" H 7675 4075 50  0001 C CNN
F 1 "GND" H 7680 4152 50  0000 C CNN
F 2 "" H 7675 4325 50  0001 C CNN
F 3 "" H 7675 4325 50  0001 C CNN
	1    7675 4325
	1    0    0    -1  
$EndComp
$Comp
L Logic_Programmable:GAL16V8 U1
U 1 1 61BB9677
P 4050 5525
F 0 "U1" H 4050 6406 50  0000 C CNN
F 1 "GAL16V8" H 4050 6315 50  0000 C CNN
F 2 "Package_LCC:PLCC-20_THT-Socket" H 4050 5525 50  0001 C CNN
F 3 "" H 4050 5525 50  0001 C CNN
	1    4050 5525
	1    0    0    -1  
$EndComp
Wire Wire Line
	7175 3850 7175 4175
Wire Wire Line
	4550 5025 4650 5025
Wire Wire Line
	4650 5025 4650 3950
Wire Wire Line
	4650 3950 4900 3950
Wire Wire Line
	8175 3150 8500 3150
Wire Wire Line
	8500 3150 8500 4775
Wire Wire Line
	8500 4775 4750 4775
Wire Wire Line
	4750 4775 4750 5225
Wire Wire Line
	4750 5225 4550 5225
$Comp
L power:GND #PWR04
U 1 1 61BD2DA3
P 4050 6400
F 0 "#PWR04" H 4050 6150 50  0001 C CNN
F 1 "GND" H 4055 6227 50  0000 C CNN
F 2 "" H 4050 6400 50  0001 C CNN
F 3 "" H 4050 6400 50  0001 C CNN
	1    4050 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR03
U 1 1 61BD37FC
P 4050 4525
F 0 "#PWR03" H 4050 4375 50  0001 C CNN
F 1 "+5P" H 4065 4698 50  0000 C CNN
F 2 "" H 4050 4525 50  0001 C CNN
F 3 "" H 4050 4525 50  0001 C CNN
	1    4050 4525
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4825 4050 4725
$Comp
L Device:C C1
U 1 1 61BD7EA5
P 2975 4775
F 0 "C1" H 3090 4821 50  0000 L CNN
F 1 "100nF" H 3090 4730 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 3013 4625 50  0001 C CNN
F 3 "~" H 2975 4775 50  0001 C CNN
	1    2975 4775
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 4600 2850 4600
Wire Wire Line
	2975 4600 2975 4625
Wire Wire Line
	2975 4925 2975 5000
Wire Wire Line
	2975 5000 2675 5000
$Comp
L Device:C C2
U 1 1 61BDEAB2
P 5000 5425
F 0 "C2" H 5115 5471 50  0000 L CNN
F 1 "100nF" H 5115 5380 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5038 5275 50  0001 C CNN
F 3 "~" H 5000 5425 50  0001 C CNN
	1    5000 5425
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 61BDFD61
P 4425 1125
F 0 "C3" H 4540 1171 50  0000 L CNN
F 1 "100nF" H 4540 1080 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4463 975 50  0001 C CNN
F 3 "~" H 4425 1125 50  0001 C CNN
	1    4425 1125
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 61BE0810
P 4900 1125
F 0 "C4" H 5015 1171 50  0000 L CNN
F 1 "100nF" H 5015 1080 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4938 975 50  0001 C CNN
F 3 "~" H 4900 1125 50  0001 C CNN
	1    4900 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4425 850  4425 975 
Wire Wire Line
	4050 4725 5000 4725
Wire Wire Line
	5000 4725 5000 5275
Connection ~ 4050 4725
Wire Wire Line
	4050 4725 4050 4525
Wire Wire Line
	4550 5525 4675 5525
Wire Wire Line
	4550 5625 4775 5625
Wire Wire Line
	4775 5625 4775 5675
Wire Wire Line
	4775 5675 6125 5675
Wire Wire Line
	6125 5675 6125 5875
Wire Wire Line
	4550 5725 6025 5725
Wire Wire Line
	6025 5725 6025 5875
Wire Wire Line
	6225 6475 6125 6475
Wire Wire Line
	6025 6475 6025 6375
Wire Wire Line
	6125 6375 6125 6475
Connection ~ 6125 6475
Wire Wire Line
	6125 6475 6025 6475
Wire Wire Line
	6225 6375 6225 6475
Connection ~ 6225 6475
$Comp
L Device:R_Network04 RN1
U 1 1 61DF0786
P 6225 5250
F 0 "RN1" H 6413 5296 50  0000 L CNN
F 1 "4K7" H 6413 5205 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 6500 5250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6225 5250 50  0001 C CNN
	1    6225 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 5050 6025 4725
Wire Wire Line
	6025 4725 5000 4725
Connection ~ 5000 4725
Wire Wire Line
	6025 5450 6025 5725
Connection ~ 6025 5725
Wire Wire Line
	6125 5450 6125 5675
Connection ~ 6125 5675
Wire Wire Line
	2675 4800 2675 5000
Wire Wire Line
	2100 2950 2225 2950
Wire Wire Line
	2225 2950 2225 3050
Wire Wire Line
	2225 3050 2100 3050
Wire Wire Line
	2100 3450 2225 3450
Wire Wire Line
	2225 3450 2225 3550
Wire Wire Line
	2225 3550 2100 3550
Wire Wire Line
	2100 4250 2275 4250
Wire Wire Line
	2275 4250 2275 4350
Wire Wire Line
	2275 4750 2100 4750
Wire Wire Line
	2100 4650 2275 4650
Connection ~ 2275 4650
Wire Wire Line
	2275 4650 2275 4750
Wire Wire Line
	2100 4550 2275 4550
Connection ~ 2275 4550
Wire Wire Line
	2275 4550 2275 4650
Wire Wire Line
	2100 4450 2275 4450
Connection ~ 2275 4450
Wire Wire Line
	2275 4450 2275 4550
Wire Wire Line
	2100 4350 2275 4350
Connection ~ 2275 4350
Wire Wire Line
	2275 4350 2275 4450
Wire Wire Line
	2100 4050 2300 4050
Wire Wire Line
	2300 4050 2300 4150
Wire Wire Line
	2300 4175 2850 4175
Wire Wire Line
	2850 4175 2850 4600
Connection ~ 2850 4600
Wire Wire Line
	2850 4600 2975 4600
Wire Wire Line
	2100 4150 2300 4150
Connection ~ 2300 4150
Wire Wire Line
	2300 4150 2300 4175
Wire Wire Line
	2275 4800 2275 4750
Connection ~ 2275 4750
Wire Wire Line
	2275 4800 2675 4800
Wire Wire Line
	2100 1550 2375 1550
Wire Wire Line
	2375 1550 2375 875 
Wire Wire Line
	2375 875  1100 875 
Wire Wire Line
	1100 875  1100 5525
Wire Wire Line
	1100 5525 3550 5525
Wire Wire Line
	2100 1350 2325 1350
Wire Wire Line
	2325 1350 2325 925 
Wire Wire Line
	2325 925  1125 925 
Wire Wire Line
	1125 925  1125 5625
Wire Wire Line
	1125 5625 3075 5625
$Comp
L power:+5P #PWR010
U 1 1 61BC7298
P 9025 4625
F 0 "#PWR010" H 9025 4475 50  0001 C CNN
F 1 "+5P" H 9040 4798 50  0000 C CNN
F 2 "" H 9025 4625 50  0001 C CNN
F 3 "" H 9025 4625 50  0001 C CNN
	1    9025 4625
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C6
U 1 1 61DFCB5F
P 3950 1125
F 0 "C6" H 4068 1171 50  0000 L CNN
F 1 "100µF" H 4068 1080 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P2.50mm" H 3988 975 50  0001 C CNN
F 3 "~" H 3950 1125 50  0001 C CNN
	1    3950 1125
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0101
U 1 1 61E20002
P 3950 875
F 0 "#PWR0101" H 3950 725 50  0001 C CNN
F 1 "+5P" H 3965 1048 50  0000 C CNN
F 2 "" H 3950 875 50  0001 C CNN
F 3 "" H 3950 875 50  0001 C CNN
	1    3950 875 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61E207FA
P 3950 1350
F 0 "#PWR0102" H 3950 1100 50  0001 C CNN
F 1 "GND" H 3955 1177 50  0000 C CNN
F 2 "" H 3950 1350 50  0001 C CNN
F 3 "" H 3950 1350 50  0001 C CNN
	1    3950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 975  3950 875 
Wire Wire Line
	3950 1350 3950 1275
$Comp
L Diode:1N4148 D2
U 1 1 61D3F816
P 5250 6175
F 0 "D2" V 5204 6255 50  0000 L CNN
F 1 "1N4148" V 5295 6255 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P2.54mm_Vertical_AnodeUp" H 5250 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 6175 50  0001 C CNN
	1    5250 6175
	0    1    1    0   
$EndComp
Wire Wire Line
	6625 6675 3375 6675
Wire Wire Line
	3375 6675 3375 5725
Wire Wire Line
	3375 5725 3550 5725
Wire Wire Line
	5250 6025 5250 5625
Wire Wire Line
	5250 6325 5250 6625
Wire Wire Line
	5250 6625 3075 6625
Wire Wire Line
	3075 6625 3075 5625
Connection ~ 3075 5625
Wire Wire Line
	3075 5625 3550 5625
Wire Wire Line
	4050 6225 4050 6400
$Comp
L power:GND #PWR0103
U 1 1 66787ECA
P 5000 6050
F 0 "#PWR0103" H 5000 5800 50  0001 C CNN
F 1 "GND" H 5005 5877 50  0000 C CNN
F 2 "" H 5000 6050 50  0001 C CNN
F 3 "" H 5000 6050 50  0001 C CNN
	1    5000 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6050 5000 5575
$Comp
L power:GND #PWR0104
U 1 1 667AB503
P 6225 6475
F 0 "#PWR0104" H 6225 6225 50  0001 C CNN
F 1 "GND" H 6230 6302 50  0000 C CNN
F 2 "" H 6225 6475 50  0001 C CNN
F 3 "" H 6225 6475 50  0001 C CNN
	1    6225 6475
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 667F15BA
P 4450 7325
F 0 "C7" H 4565 7371 50  0000 L CNN
F 1 "100nF" H 4565 7280 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4488 7175 50  0001 C CNN
F 3 "~" H 4450 7325 50  0001 C CNN
	1    4450 7325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6681481A
P 4450 7475
F 0 "#PWR0105" H 4450 7225 50  0001 C CNN
F 1 "GND" H 4455 7302 50  0000 C CNN
F 2 "" H 4450 7475 50  0001 C CNN
F 3 "" H 4450 7475 50  0001 C CNN
	1    4450 7475
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0106
U 1 1 66814BF3
P 4450 7175
F 0 "#PWR0106" H 4450 7025 50  0001 C CNN
F 1 "+5P" H 4465 7348 50  0000 C CNN
F 2 "" H 4450 7175 50  0001 C CNN
F 3 "" H 4450 7175 50  0001 C CNN
	1    4450 7175
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 66815148
P 5050 7325
F 0 "C8" H 5165 7371 50  0000 L CNN
F 1 "100nF" H 5165 7280 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5088 7175 50  0001 C CNN
F 3 "~" H 5050 7325 50  0001 C CNN
	1    5050 7325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 66815588
P 5050 7475
F 0 "#PWR0107" H 5050 7225 50  0001 C CNN
F 1 "GND" H 5055 7302 50  0000 C CNN
F 2 "" H 5050 7475 50  0001 C CNN
F 3 "" H 5050 7475 50  0001 C CNN
	1    5050 7475
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0108
U 1 1 66815592
P 5050 7175
F 0 "#PWR0108" H 5050 7025 50  0001 C CNN
F 1 "+5P" H 5065 7348 50  0000 C CNN
F 2 "" H 5050 7175 50  0001 C CNN
F 3 "" H 5050 7175 50  0001 C CNN
	1    5050 7175
	1    0    0    -1  
$EndComp
Text GLabel 2950 2250 2    50   Input ~ 0
A0
Text GLabel 2950 2350 2    50   Input ~ 0
A1
Text GLabel 2950 2450 2    50   Input ~ 0
A2
Text GLabel 2950 2550 2    50   Input ~ 0
A3
Text GLabel 2950 2650 2    50   Input ~ 0
A4
Text GLabel 2950 2750 2    50   Input ~ 0
A5
Text GLabel 2950 2850 2    50   Input ~ 0
A6
Text GLabel 2950 2950 2    50   Input ~ 0
A7
Text GLabel 2950 3050 2    50   Input ~ 0
A8
Text GLabel 2950 3150 2    50   Input ~ 0
A9
Text GLabel 2950 3250 2    50   Input ~ 0
A10
Text GLabel 2950 3350 2    50   Input ~ 0
A11
Text GLabel 2950 3450 2    50   Input ~ 0
A12
Text GLabel 2950 3550 2    50   Input ~ 0
A13
Text GLabel 2950 3650 2    50   Input ~ 0
A14
Text GLabel 2950 3750 2    50   Input ~ 0
A15
Text GLabel 4900 2250 0    50   Input ~ 0
A0
Text GLabel 4900 2350 0    50   Input ~ 0
A1
Text GLabel 4900 2450 0    50   Input ~ 0
A2
Text GLabel 4900 2550 0    50   Input ~ 0
A3
Text GLabel 4900 2650 0    50   Input ~ 0
A4
Text GLabel 4900 2750 0    50   Input ~ 0
A5
Text GLabel 4900 2850 0    50   Input ~ 0
A6
Text GLabel 4900 2950 0    50   Input ~ 0
A7
Text GLabel 4900 3050 0    50   Input ~ 0
A8
Text GLabel 4900 3150 0    50   Input ~ 0
A9
Text GLabel 4900 3250 0    50   Input ~ 0
A10
Text GLabel 4900 3350 0    50   Input ~ 0
A11
Text GLabel 4900 3450 0    50   Input ~ 0
A12
Text GLabel 4900 3550 0    50   Input ~ 0
A13
Text GLabel 7175 2250 0    50   Input ~ 0
A0
Text GLabel 7175 2350 0    50   Input ~ 0
A1
Text GLabel 7175 2450 0    50   Input ~ 0
A2
Text GLabel 7175 2550 0    50   Input ~ 0
A3
Text GLabel 7175 2650 0    50   Input ~ 0
A4
Text GLabel 7175 2750 0    50   Input ~ 0
A5
Text GLabel 7175 2850 0    50   Input ~ 0
A6
Text GLabel 7175 2950 0    50   Input ~ 0
A7
Text GLabel 7175 3050 0    50   Input ~ 0
A8
Text GLabel 7175 3150 0    50   Input ~ 0
A9
Text GLabel 7175 3250 0    50   Input ~ 0
A10
Text GLabel 7175 3350 0    50   Input ~ 0
A11
Text GLabel 7175 3450 0    50   Input ~ 0
A12
Text GLabel 7175 3550 0    50   Input ~ 0
A13
Text GLabel 7175 3650 0    50   Input ~ 0
A14
Text GLabel 7175 3750 0    50   Input ~ 0
A15
Text GLabel 3550 5125 0    50   Input ~ 0
A12
Text GLabel 3550 5225 0    50   Input ~ 0
A13
Text GLabel 3550 5325 0    50   Input ~ 0
A14
Text GLabel 3550 5425 0    50   Input ~ 0
A15
Text GLabel 3550 5025 0    50   Input ~ 0
A11
Text GLabel 2950 1350 2    50   Input ~ 0
D0
Text GLabel 2950 1450 2    50   Input ~ 0
D1
Text GLabel 2950 1550 2    50   Input ~ 0
D2
Text GLabel 2950 1650 2    50   Input ~ 0
D3
Text GLabel 2950 1750 2    50   Input ~ 0
D4
Text GLabel 2950 1850 2    50   Input ~ 0
D5
Text GLabel 2950 1950 2    50   Input ~ 0
D6
Text GLabel 2950 2050 2    50   Input ~ 0
D7
Text GLabel 5700 2250 2    50   Input ~ 0
D0
Text GLabel 5700 2350 2    50   Input ~ 0
D1
Text GLabel 5700 2450 2    50   Input ~ 0
D2
Text GLabel 5700 2550 2    50   Input ~ 0
D3
Text GLabel 5700 2650 2    50   Input ~ 0
D4
Text GLabel 5700 2750 2    50   Input ~ 0
D5
Text GLabel 5700 2850 2    50   Input ~ 0
D6
Text GLabel 5700 2950 2    50   Input ~ 0
D7
Text GLabel 8175 2250 2    50   Input ~ 0
D0
Text GLabel 8175 2350 2    50   Input ~ 0
D1
Text GLabel 8175 2450 2    50   Input ~ 0
D2
Text GLabel 8175 2550 2    50   Input ~ 0
D3
Text GLabel 8175 2650 2    50   Input ~ 0
D4
Text GLabel 8175 2750 2    50   Input ~ 0
D5
Text GLabel 8175 2850 2    50   Input ~ 0
D6
Text GLabel 8175 2950 2    50   Input ~ 0
D7
Text GLabel 2100 1850 2    50   Input ~ 0
~RD
Text GLabel 4900 4050 0    50   Input ~ 0
~RD
Text GLabel 8175 3350 2    50   Input ~ 0
~RD
Text GLabel 2100 1950 2    50   Input ~ 0
~WR
$Comp
L K1520:K1520_2x29-AC X1
U 1 1 6217363F
P 2400 3150
F 0 "X1" H 2515 5175 50  0000 C CNN
F 1 "K1520_2x29-AC" H 2515 5084 50  0000 C CNN
F 2 "K1520:K1520_EFS2x29_DIN_male" H 2400 3200 50  0001 C CNN
F 3 "Anschluß nach: http://www.robotrontechnik.de/index.htm?/html/standards/k1520.htm" H 2400 3200 50  0001 C CNN
	1    2400 3150
	-1   0    0    -1  
$EndComp
Text GLabel 8175 3450 2    50   Input ~ 0
~WR
$Comp
L power:GND #PWR0109
U 1 1 669738CA
P 4900 1275
F 0 "#PWR0109" H 4900 1025 50  0001 C CNN
F 1 "GND" H 4905 1102 50  0000 C CNN
F 2 "" H 4900 1275 50  0001 C CNN
F 3 "" H 4900 1275 50  0001 C CNN
	1    4900 1275
	1    0    0    -1  
$EndComp
Wire Wire Line
	7675 4050 7675 4325
$Comp
L power:GND #PWR0110
U 1 1 66973C3C
P 7175 4175
F 0 "#PWR0110" H 7175 3925 50  0001 C CNN
F 1 "GND" H 7180 4002 50  0000 C CNN
F 2 "" H 7175 4175 50  0001 C CNN
F 3 "" H 7175 4175 50  0001 C CNN
	1    7175 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4250 5300 4375
$Comp
L power:GND #PWR0111
U 1 1 66973F08
P 4425 1275
F 0 "#PWR0111" H 4425 1025 50  0001 C CNN
F 1 "GND" H 4430 1102 50  0000 C CNN
F 2 "" H 4425 1275 50  0001 C CNN
F 3 "" H 4425 1275 50  0001 C CNN
	1    4425 1275
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1700 5300 2050
$Comp
L power:+5P #PWR0112
U 1 1 6697A897
P 4425 850
F 0 "#PWR0112" H 4425 700 50  0001 C CNN
F 1 "+5P" H 4440 1023 50  0000 C CNN
F 2 "" H 4425 850 50  0001 C CNN
F 3 "" H 4425 850 50  0001 C CNN
	1    4425 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0113
U 1 1 66989155
P 4900 975
F 0 "#PWR0113" H 4900 825 50  0001 C CNN
F 1 "+5P" H 4915 1148 50  0000 C CNN
F 2 "" H 4900 975 50  0001 C CNN
F 3 "" H 4900 975 50  0001 C CNN
	1    4900 975 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8175 3250 8550 3250
Wire Wire Line
	7675 1725 7675 2050
$Comp
L power:+5P #PWR0114
U 1 1 669896C1
P 8550 3250
F 0 "#PWR0114" H 8550 3100 50  0001 C CNN
F 1 "+5P" H 8565 3423 50  0000 C CNN
F 2 "" H 8550 3250 50  0001 C CNN
F 3 "" H 8550 3250 50  0001 C CNN
	1    8550 3250
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR0118
U 1 1 669CA546
P 2100 4850
F 0 "#PWR0118" H 2100 4950 50  0001 C CNN
F 1 "-5V" V 2115 4978 50  0000 L CNN
F 2 "" H 2100 4850 50  0001 C CNN
F 3 "" H 2100 4850 50  0001 C CNN
	1    2100 4850
	0    1    1    0   
$EndComp
$Comp
L power:-5V #PWR0119
U 1 1 669CAC29
P 2100 4950
F 0 "#PWR0119" H 2100 5050 50  0001 C CNN
F 1 "-5V" V 2115 5078 50  0000 L CNN
F 2 "" H 2100 4950 50  0001 C CNN
F 3 "" H 2100 4950 50  0001 C CNN
	1    2100 4950
	0    1    1    0   
$EndComp
$Comp
L power:-12V #PWR0120
U 1 1 669CB57C
P 2100 5050
F 0 "#PWR0120" H 2100 5150 50  0001 C CNN
F 1 "-12V" V 2115 5178 50  0000 L CNN
F 2 "" H 2100 5050 50  0001 C CNN
F 3 "" H 2100 5050 50  0001 C CNN
	1    2100 5050
	0    1    1    0   
$EndComp
$Comp
L power:-12V #PWR0121
U 1 1 669CB919
P 2100 5150
F 0 "#PWR0121" H 2100 5250 50  0001 C CNN
F 1 "-12V" V 2115 5278 50  0000 L CNN
F 2 "" H 2100 5150 50  0001 C CNN
F 3 "" H 2100 5150 50  0001 C CNN
	1    2100 5150
	0    1    1    0   
$EndComp
$Comp
L power:+12P #PWR0122
U 1 1 669CBE26
P 2100 3850
F 0 "#PWR0122" H 2100 3700 50  0001 C CNN
F 1 "+12P" V 2115 3978 50  0000 L CNN
F 2 "" H 2100 3850 50  0001 C CNN
F 3 "" H 2100 3850 50  0001 C CNN
	1    2100 3850
	0    1    1    0   
$EndComp
$Comp
L power:+12P #PWR0123
U 1 1 669CCBF1
P 2100 3950
F 0 "#PWR0123" H 2100 3800 50  0001 C CNN
F 1 "+12P" V 2115 4078 50  0000 L CNN
F 2 "" H 2100 3950 50  0001 C CNN
F 3 "" H 2100 3950 50  0001 C CNN
	1    2100 3950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 6752825A
P 10050 1875
F 0 "#PWR0124" H 10050 1625 50  0001 C CNN
F 1 "GND" H 10055 1702 50  0000 C CNN
F 2 "" H 10050 1875 50  0001 C CNN
F 3 "" H 10050 1875 50  0001 C CNN
	1    10050 1875
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 67528772
P 10725 1450
F 0 "J2" H 10805 1442 50  0000 L CNN
F 1 "Conn_01x06" H 10805 1351 50  0000 L CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBA_2,5_6-G-5,08_1x06_P5.08mm_Horizontal" H 10725 1450 50  0001 C CNN
F 3 "~" H 10725 1450 50  0001 C CNN
	1    10725 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+12P #PWR0125
U 1 1 6752BB0E
P 10125 925
F 0 "#PWR0125" H 10125 775 50  0001 C CNN
F 1 "+12P" V 10140 1053 50  0000 L CNN
F 2 "" H 10125 925 50  0001 C CNN
F 3 "" H 10125 925 50  0001 C CNN
	1    10125 925 
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR0126
U 1 1 6752C581
P 9675 925
F 0 "#PWR0126" H 9675 1025 50  0001 C CNN
F 1 "-5V" V 9690 1053 50  0000 L CNN
F 2 "" H 9675 925 50  0001 C CNN
F 3 "" H 9675 925 50  0001 C CNN
	1    9675 925 
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR0127
U 1 1 6752CF0F
P 9500 925
F 0 "#PWR0127" H 9500 1025 50  0001 C CNN
F 1 "-12V" V 9515 1053 50  0000 L CNN
F 2 "" H 9500 925 50  0001 C CNN
F 3 "" H 9500 925 50  0001 C CNN
	1    9500 925 
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0128
U 1 1 6752D411
P 9900 925
F 0 "#PWR0128" H 9900 775 50  0001 C CNN
F 1 "+5P" H 9915 1098 50  0000 C CNN
F 2 "" H 9900 925 50  0001 C CNN
F 3 "" H 9900 925 50  0001 C CNN
	1    9900 925 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10125 925  10125 1250
Wire Wire Line
	10125 1250 10250 1250
Wire Wire Line
	9900 925  9900 1350
Wire Wire Line
	9900 1350 10525 1350
Wire Wire Line
	9675 925  9675 1650
Wire Wire Line
	9675 1650 9800 1650
Wire Wire Line
	9500 925  9500 1750
Wire Wire Line
	9500 1750 10525 1750
Wire Wire Line
	10050 1875 10050 1550
Wire Wire Line
	10050 1450 10525 1450
Wire Wire Line
	10525 1550 10050 1550
Connection ~ 10050 1550
Wire Wire Line
	10050 1550 10050 1450
$Comp
L Device:C C9
U 1 1 6757FCE6
P 9500 2000
F 0 "C9" H 9615 2046 50  0000 L CNN
F 1 "100nF" H 9615 1955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9538 1850 50  0001 C CNN
F 3 "~" H 9500 2000 50  0001 C CNN
	1    9500 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 67586042
P 9800 2000
F 0 "C10" H 9915 2046 50  0000 L CNN
F 1 "100nF" H 9915 1955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9838 1850 50  0001 C CNN
F 3 "~" H 9800 2000 50  0001 C CNN
	1    9800 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 675863D2
P 10250 2000
F 0 "C11" H 10365 2046 50  0000 L CNN
F 1 "100nF" H 10365 1955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 10288 1850 50  0001 C CNN
F 3 "~" H 10250 2000 50  0001 C CNN
	1    10250 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 675866D2
P 9800 2150
F 0 "#PWR0129" H 9800 1900 50  0001 C CNN
F 1 "GND" H 9805 1977 50  0000 C CNN
F 2 "" H 9800 2150 50  0001 C CNN
F 3 "" H 9800 2150 50  0001 C CNN
	1    9800 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 675869C0
P 9500 2150
F 0 "#PWR0130" H 9500 1900 50  0001 C CNN
F 1 "GND" H 9505 1977 50  0000 C CNN
F 2 "" H 9500 2150 50  0001 C CNN
F 3 "" H 9500 2150 50  0001 C CNN
	1    9500 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 67586CC8
P 10250 2150
F 0 "#PWR0131" H 10250 1900 50  0001 C CNN
F 1 "GND" H 10255 1977 50  0000 C CNN
F 2 "" H 10250 2150 50  0001 C CNN
F 3 "" H 10250 2150 50  0001 C CNN
	1    10250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 1850 10250 1250
Connection ~ 10250 1250
Wire Wire Line
	10250 1250 10525 1250
Wire Wire Line
	9500 1850 9500 1750
Connection ~ 9500 1750
Wire Wire Line
	9800 1850 9800 1650
Connection ~ 9800 1650
Wire Wire Line
	9800 1650 10525 1650
Text GLabel 2100 2650 2    50   Input ~ 0
~Reset
Text GLabel 2925 5925 0    50   Input ~ 0
~Reset
Wire Wire Line
	3550 5925 2925 5925
$Comp
L 74xx:74LS00 U4
U 1 1 6752BA00
P 8150 5250
F 0 "U4" H 8150 5575 50  0000 C CNN
F 1 "74LS00" H 8150 5484 50  0000 C CNN
F 2 "" H 8150 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8150 5250 50  0001 C CNN
	1    8150 5250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U4
U 2 1 6752D545
P 8150 5725
F 0 "U4" H 8150 6050 50  0000 C CNN
F 1 "74LS00" H 8150 5959 50  0000 C CNN
F 2 "" H 8150 5725 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8150 5725 50  0001 C CNN
	2    8150 5725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5350 7775 5350
Wire Wire Line
	7775 5350 7775 5450
Wire Wire Line
	7775 5450 8525 5450
Wire Wire Line
	8525 5450 8525 5725
Wire Wire Line
	8525 5725 8450 5725
Wire Wire Line
	7850 5625 7775 5625
Wire Wire Line
	7775 5625 7775 5500
Wire Wire Line
	8600 5250 8450 5250
Wire Wire Line
	7775 5500 8600 5500
Wire Wire Line
	8600 5250 8600 5500
Text GLabel 7850 5150 0    50   Input ~ 0
~Reset
Text GLabel 2825 5800 0    50   Input ~ 0
~RD
Wire Wire Line
	3550 5825 2950 5825
Wire Wire Line
	2950 5825 2950 5800
Wire Wire Line
	2950 5800 2825 5800
Wire Wire Line
	4550 5325 5750 5325
Wire Wire Line
	5750 5325 5750 5525
Wire Wire Line
	5750 5525 7200 5525
Wire Wire Line
	7200 5525 7200 5825
Wire Wire Line
	7200 5825 7850 5825
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 66762B9E
P 6225 6075
F 0 "J1" V 6229 6255 50  0000 L CNN
F 1 "Conn_02x04_Odd_Even" V 6320 6255 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 6225 6075 50  0001 C CNN
F 3 "~" H 6225 6075 50  0001 C CNN
	1    6225 6075
	0    1    1    0   
$EndComp
Wire Wire Line
	6625 6675 6625 6375
Wire Wire Line
	6625 6375 6325 6375
Wire Wire Line
	6325 5875 7150 5875
Wire Wire Line
	7150 5875 7150 6075
Wire Wire Line
	7150 6075 8725 6075
Wire Wire Line
	8725 6075 8725 5500
Wire Wire Line
	8725 5500 8600 5500
Connection ~ 8600 5500
$Comp
L 74xx:74LS00 U4
U 5 1 67554034
P 9025 5125
F 0 "U4" H 9255 5171 50  0000 L CNN
F 1 "74LS00" H 9255 5080 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9025 5125 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9025 5125 50  0001 C CNN
	5    9025 5125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 6755B72D
P 9025 5625
F 0 "#PWR0115" H 9025 5375 50  0001 C CNN
F 1 "GND" H 9030 5452 50  0000 C CNN
F 2 "" H 9025 5625 50  0001 C CNN
F 3 "" H 9025 5625 50  0001 C CNN
	1    9025 5625
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 67562477
P 9750 5025
F 0 "C5" H 9865 5071 50  0000 L CNN
F 1 "100nF" H 9865 4980 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9788 4875 50  0001 C CNN
F 3 "~" H 9750 5025 50  0001 C CNN
	1    9750 5025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 67562B51
P 9750 5175
F 0 "#PWR0116" H 9750 4925 50  0001 C CNN
F 1 "GND" H 9755 5002 50  0000 C CNN
F 2 "" H 9750 5175 50  0001 C CNN
F 3 "" H 9750 5175 50  0001 C CNN
	1    9750 5175
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0117
U 1 1 67562B5B
P 9750 4875
F 0 "#PWR0117" H 9750 4725 50  0001 C CNN
F 1 "+5P" H 9765 5048 50  0000 C CNN
F 2 "" H 9750 4875 50  0001 C CNN
F 3 "" H 9750 4875 50  0001 C CNN
	1    9750 4875
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5125 4625 5125
Wire Wire Line
	4625 5125 4625 3750
Wire Wire Line
	4625 3750 4900 3750
Wire Wire Line
	4900 3650 4675 3650
Wire Wire Line
	4850 5625 5250 5625
Wire Wire Line
	4850 5425 4850 5625
Wire Wire Line
	4550 5425 4850 5425
Wire Wire Line
	4675 3650 4675 5525
Wire Wire Line
	6225 5450 6225 5875
$EndSCHEMATC
