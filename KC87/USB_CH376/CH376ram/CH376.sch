EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
Wire Wire Line
	1525 4900 1525 5000
Wire Wire Line
	1500 4400 1500 4500
$Comp
L power:+5P #PWR01002
U 1 1 6251C8D1
P 1575 5500
F 0 "#PWR01002" H 1575 5350 50  0001 C CNN
F 1 "+5P" V 1590 5628 50  0000 L CNN
F 2 "" H 1575 5500 50  0001 C CNN
F 3 "" H 1575 5500 50  0001 C CNN
	1    1575 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	1725 5700 1725 5800
Connection ~ 1725 6100
Wire Wire Line
	1725 6100 1725 6200
Wire Wire Line
	1550 5600 1550 5500
Connection ~ 1550 5500
Wire Wire Line
	1550 5500 1575 5500
Connection ~ 1725 5800
Wire Wire Line
	1725 5800 1725 5900
Connection ~ 1725 5900
Connection ~ 1725 6000
Wire Wire Line
	1725 6000 1725 6100
Wire Wire Line
	1725 5900 1725 6000
Connection ~ 1725 6200
$Comp
L power:GND #PWR01003
U 1 1 6251CEE4
P 1725 6200
F 0 "#PWR01003" H 1725 5950 50  0001 C CNN
F 1 "GND" H 1730 6027 50  0000 C CNN
F 2 "" H 1725 6200 50  0001 C CNN
F 3 "" H 1725 6200 50  0001 C CNN
	1    1725 6200
	1    0    0    -1  
$EndComp
Entry Wire Line
	2675 2800 2775 2900
Entry Wire Line
	2675 2900 2775 3000
Entry Wire Line
	2675 3000 2775 3100
Entry Wire Line
	2675 3100 2775 3200
Entry Wire Line
	2675 3200 2775 3300
Entry Wire Line
	2675 3300 2775 3400
Entry Wire Line
	2675 3400 2775 3500
Entry Wire Line
	2675 3500 2775 3600
Entry Wire Line
	2675 3700 2775 3800
Entry Wire Line
	2675 3800 2775 3900
Entry Wire Line
	2675 3900 2775 4000
Entry Wire Line
	2675 4000 2775 4100
Entry Wire Line
	2675 4400 2775 4500
Entry Wire Line
	2675 4300 2775 4400
Entry Wire Line
	2675 4100 2775 4200
Entry Wire Line
	2675 4200 2775 4300
Wire Wire Line
	2300 4400 2675 4400
Wire Wire Line
	2300 4300 2675 4300
Wire Wire Line
	2300 4200 2675 4200
Wire Wire Line
	2300 4100 2675 4100
Wire Wire Line
	2300 4000 2675 4000
Wire Wire Line
	2300 3900 2675 3900
Wire Wire Line
	2300 3800 2675 3800
Wire Wire Line
	2300 3700 2675 3700
Wire Wire Line
	2300 3500 2675 3500
Wire Wire Line
	2300 3400 2675 3400
Wire Wire Line
	2300 3300 2675 3300
Wire Wire Line
	2300 3200 2675 3200
Wire Wire Line
	2300 3100 2675 3100
Wire Wire Line
	2300 3000 2675 3000
Wire Wire Line
	2300 2900 2675 2900
Wire Wire Line
	2300 2800 2675 2800
Wire Wire Line
	1725 6200 1450 6200
Wire Wire Line
	1450 6100 1725 6100
Wire Wire Line
	1450 6000 1725 6000
Wire Wire Line
	1450 5900 1725 5900
Wire Wire Line
	1450 5800 1725 5800
Wire Wire Line
	1450 5700 1725 5700
Wire Wire Line
	1450 5600 1550 5600
Wire Wire Line
	1450 5500 1550 5500
Wire Wire Line
	1525 5000 1450 5000
Wire Wire Line
	1450 4900 1525 4900
Wire Wire Line
	1500 4500 1450 4500
Wire Wire Line
	1450 4400 1500 4400
Text Label 2450 2800 0    50   ~ 0
D0
Text Label 2450 2900 0    50   ~ 0
D1
Text Label 2450 3000 0    50   ~ 0
D2
Text Label 2450 3100 0    50   ~ 0
D3
Text Label 2450 3200 0    50   ~ 0
D4
Text Label 2450 3300 0    50   ~ 0
D5
Text Label 2450 3400 0    50   ~ 0
D6
Text Label 2450 3500 0    50   ~ 0
D7
Text Label 2450 3700 0    50   ~ 0
A0
Text Label 2450 3800 0    50   ~ 0
A1
Text Label 2450 3900 0    50   ~ 0
A2
Text Label 2450 4000 0    50   ~ 0
A3
Text Label 2450 4100 0    50   ~ 0
A4
Text Label 2450 4200 0    50   ~ 0
A5
Text Label 2450 4300 0    50   ~ 0
A6
Text Label 2450 4400 0    50   ~ 0
A7
$Comp
L power:+12P #PWR01001
U 1 1 627F0A12
P 1550 5300
F 0 "#PWR01001" H 1550 5150 50  0001 C CNN
F 1 "+12P" V 1565 5428 50  0000 L CNN
F 2 "" H 1550 5300 50  0001 C CNN
F 3 "" H 1550 5300 50  0001 C CNN
	1    1550 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 5300 1450 5300
Wire Wire Line
	1450 5400 1550 5400
Wire Wire Line
	1550 5400 1550 5300
Connection ~ 1550 5300
$Comp
L Device:C C1012
U 1 1 62485604
P 3525 9450
F 0 "C1012" V 3273 9450 50  0000 C CNN
F 1 "100nF" V 3364 9450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 3563 9300 50  0001 C CNN
F 3 "~" H 3525 9450 50  0001 C CNN
	1    3525 9450
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0101
U 1 1 624866F0
P 3525 9300
F 0 "#PWR0101" H 3525 9150 50  0001 C CNN
F 1 "+5P" V 3540 9428 50  0000 L CNN
F 2 "" H 3525 9300 50  0001 C CNN
F 3 "" H 3525 9300 50  0001 C CNN
	1    3525 9300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 62486A85
P 3525 9600
F 0 "#PWR0102" H 3525 9350 50  0001 C CNN
F 1 "GND" H 3530 9427 50  0000 C CNN
F 2 "" H 3525 9600 50  0001 C CNN
F 3 "" H 3525 9600 50  0001 C CNN
	1    3525 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1013
U 1 1 62488D7D
P 4025 9450
F 0 "C1013" V 3773 9450 50  0000 C CNN
F 1 "100nF" V 3864 9450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4063 9300 50  0001 C CNN
F 3 "~" H 4025 9450 50  0001 C CNN
	1    4025 9450
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0103
U 1 1 62488D83
P 4025 9300
F 0 "#PWR0103" H 4025 9150 50  0001 C CNN
F 1 "+5P" V 4040 9428 50  0000 L CNN
F 2 "" H 4025 9300 50  0001 C CNN
F 3 "" H 4025 9300 50  0001 C CNN
	1    4025 9300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 62488D89
P 4025 9600
F 0 "#PWR0104" H 4025 9350 50  0001 C CNN
F 1 "GND" H 4030 9427 50  0000 C CNN
F 2 "" H 4025 9600 50  0001 C CNN
F 3 "" H 4025 9600 50  0001 C CNN
	1    4025 9600
	1    0    0    -1  
$EndComp
$Comp
L K1520:K1520_2x29-AC X1001
U 1 1 6224A042
P 1750 4600
F 0 "X1001" H 1865 6625 50  0000 C CNN
F 1 "K1520_2x29-AC" H 1865 6534 50  0000 C CNN
F 2 "K1520:K1520_EFS2x29_DIN_male" H 1750 4650 50  0001 C CNN
F 3 "Anschluß nach: http://www.robotrontechnik.de/index.htm?/html/standards/k1520.htm" H 1750 4650 50  0001 C CNN
	1    1750 4600
	-1   0    0    -1  
$EndComp
Wire Bus Line
	2775 2075 6825 2075
Wire Bus Line
	8425 3200 6825 3200
Entry Wire Line
	3375 3400 3475 3500
Wire Wire Line
	3475 3500 3925 3500
Entry Wire Line
	3375 3500 3475 3600
Wire Wire Line
	3475 3600 3925 3600
Entry Wire Line
	3375 3600 3475 3700
Wire Wire Line
	3475 3700 3925 3700
Entry Wire Line
	3375 4100 3475 4200
Wire Wire Line
	3475 4200 3925 4200
Entry Wire Line
	3375 4000 3475 4100
Wire Wire Line
	3475 4100 3925 4100
Entry Wire Line
	3375 3900 3475 4000
Wire Wire Line
	3475 4000 3925 4000
Entry Wire Line
	3375 3800 3475 3900
Wire Wire Line
	3475 3900 3925 3900
Entry Wire Line
	3375 3700 3475 3800
Wire Wire Line
	3475 3800 3925 3800
Wire Bus Line
	3375 2550 2775 2550
Wire Bus Line
	2775 2075 2775 2550
Connection ~ 2775 2550
Text Label 3600 3500 0    50   ~ 0
A2
Text Label 3600 3600 0    50   ~ 0
A3
Text Label 3600 3700 0    50   ~ 0
A4
Text Label 3600 3800 0    50   ~ 0
A5
Text Label 3600 3900 0    50   ~ 0
A6
Text Label 3600 4000 0    50   ~ 0
A7
Text Label 3600 4100 0    50   ~ 0
~IORQ
Text Label 3600 4200 0    50   ~ 0
~RD
Wire Wire Line
	3925 4300 3475 4300
Wire Wire Line
	3925 4400 3475 4400
Entry Wire Line
	3375 4200 3475 4300
Entry Wire Line
	3375 4300 3475 4400
Text Label 3600 4300 0    50   ~ 0
~WR
$Comp
L felge1966:GAL20V8 U1
U 1 1 655EEEFF
P 4425 4200
F 0 "U1" H 4425 5281 50  0000 C CNN
F 1 "GAL20V8" H 4425 5190 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_LongPads" H 4425 4200 50  0001 C CNN
F 3 "" H 4425 4200 50  0001 C CNN
	1    4425 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3925 4500 3475 4500
Entry Wire Line
	3375 4400 3475 4500
Wire Wire Line
	3925 4600 3475 4600
Entry Wire Line
	3375 4500 3475 4600
Wire Wire Line
	3925 4700 3475 4700
Entry Wire Line
	3375 4600 3475 4700
Wire Wire Line
	3925 4800 3475 4800
Entry Wire Line
	3375 4700 3475 4800
Wire Wire Line
	4925 3500 5375 3500
Entry Wire Line
	5475 3400 5375 3500
Wire Wire Line
	4925 3600 5375 3600
Entry Wire Line
	5475 3500 5375 3600
Wire Wire Line
	4925 3700 5375 3700
Entry Wire Line
	5475 3600 5375 3700
Entry Wire Line
	2675 4500 2775 4600
Entry Wire Line
	2675 4600 2775 4700
Entry Wire Line
	2675 4700 2775 4800
Entry Wire Line
	2675 4800 2775 4900
Entry Wire Line
	2675 5200 2775 5300
Entry Wire Line
	2675 5100 2775 5200
Entry Wire Line
	2675 4900 2775 5000
Entry Wire Line
	2675 5000 2775 5100
Wire Wire Line
	2300 5200 2675 5200
Wire Wire Line
	2300 5100 2675 5100
Wire Wire Line
	2300 5000 2675 5000
Wire Wire Line
	2300 4900 2675 4900
Wire Wire Line
	2300 4800 2675 4800
Wire Wire Line
	2300 4700 2675 4700
Wire Wire Line
	2300 4600 2675 4600
Wire Wire Line
	2300 4500 2675 4500
Text Label 2450 4500 0    50   ~ 0
A8
Text Label 2450 4600 0    50   ~ 0
A9
Text Label 2450 4700 0    50   ~ 0
A10
Text Label 2450 4800 0    50   ~ 0
A11
Text Label 2450 4900 0    50   ~ 0
A12
Text Label 2450 5000 0    50   ~ 0
A13
Text Label 2450 5100 0    50   ~ 0
A14
Text Label 2450 5200 0    50   ~ 0
A15
Wire Bus Line
	2775 2550 1750 2550
Entry Wire Line
	1650 4100 1750 4000
Entry Wire Line
	1650 4200 1750 4100
Wire Wire Line
	1450 4100 1650 4100
Wire Wire Line
	1650 4200 1450 4200
Wire Wire Line
	1450 2800 1650 2800
Wire Wire Line
	1450 2900 1650 2900
Wire Wire Line
	1450 3000 1650 3000
Wire Wire Line
	1450 3100 1650 3100
Wire Wire Line
	1450 3300 1650 3300
Wire Wire Line
	1450 3400 1650 3400
Entry Wire Line
	1650 2800 1750 2700
Entry Wire Line
	1650 2900 1750 2800
Entry Wire Line
	1650 3000 1750 2900
Entry Wire Line
	1650 3100 1750 3000
Entry Wire Line
	1650 3300 1750 3200
Entry Wire Line
	1650 3400 1750 3300
Text Label 1450 2800 0    50   ~ 0
~MEMDI
Text Label 1475 2900 0    50   ~ 0
~M1
Text Label 1450 3000 0    50   ~ 0
~MREQ
Text Label 1450 3100 0    50   ~ 0
~IORQ
Text Label 1500 3300 0    50   ~ 0
~RD
Text Label 1500 3400 0    50   ~ 0
~WR
Text Label 1450 4100 0    50   ~ 0
~RESET
Text Label 1450 4200 0    50   ~ 0
CLK
Text Label 3600 4400 0    50   ~ 0
A15
Text Label 3600 4500 0    50   ~ 0
A14
Text Label 3600 4600 0    50   ~ 0
A13
Text Label 3600 4700 0    50   ~ 0
A12
Text Label 3600 4800 0    50   ~ 0
~MREQ
Text Label 5000 3500 0    50   ~ 0
A11
Text Label 5000 3600 0    50   ~ 0
~CS-ROM
Text Label 5000 3700 0    50   ~ 0
CS
$Comp
L power:GND #PWR0105
U 1 1 65639B0D
P 4425 5000
F 0 "#PWR0105" H 4425 4750 50  0001 C CNN
F 1 "GND" H 4430 4827 50  0000 C CNN
F 2 "" H 4425 5000 50  0001 C CNN
F 3 "" H 4425 5000 50  0001 C CNN
	1    4425 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0106
U 1 1 65639FF6
P 4425 3300
F 0 "#PWR0106" H 4425 3150 50  0001 C CNN
F 1 "+5P" V 4440 3428 50  0000 L CNN
F 2 "" H 4425 3300 50  0001 C CNN
F 3 "" H 4425 3300 50  0001 C CNN
	1    4425 3300
	1    0    0    -1  
$EndComp
Wire Bus Line
	5475 2550 3375 2550
Connection ~ 3375 2550
Entry Wire Line
	3375 2675 3475 2775
Wire Wire Line
	3475 2775 3675 2775
Entry Wire Line
	3375 2925 3475 3025
Wire Wire Line
	3475 3025 3675 3025
$Comp
L power:+5P #PWR0107
U 1 1 6565252D
P 3675 2775
F 0 "#PWR0107" H 3675 2625 50  0001 C CNN
F 1 "+5P" V 3690 2903 50  0000 L CNN
F 2 "" H 3675 2775 50  0001 C CNN
F 3 "" H 3675 2775 50  0001 C CNN
	1    3675 2775
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 65652847
P 3675 3025
F 0 "#PWR0108" H 3675 2775 50  0001 C CNN
F 1 "GND" H 3680 2852 50  0000 C CNN
F 2 "" H 3675 3025 50  0001 C CNN
F 3 "" H 3675 3025 50  0001 C CNN
	1    3675 3025
	1    0    0    -1  
$EndComp
Text Label 3525 2775 0    50   ~ 0
5P
Text Label 3525 3025 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J1
U 1 1 6565646E
P 7675 2575
F 0 "J1" H 7725 3092 50  0000 C CNN
F 1 "CH376" H 7725 3001 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 7675 2575 50  0001 C CNN
F 3 "~" H 7675 2575 50  0001 C CNN
	1    7675 2575
	-1   0    0    1   
$EndComp
Entry Wire Line
	6825 2075 6925 2175
Wire Wire Line
	6925 2875 7375 2875
Entry Wire Line
	6825 2175 6925 2275
Wire Wire Line
	6925 2775 7375 2775
Entry Wire Line
	6825 2275 6925 2375
Wire Wire Line
	6925 2675 7375 2675
Entry Wire Line
	6825 2775 6925 2875
Wire Wire Line
	6925 2175 7375 2175
Entry Wire Line
	6825 2675 6925 2775
Wire Wire Line
	6925 2275 7375 2275
Entry Wire Line
	6825 2575 6925 2675
Wire Wire Line
	6925 2375 7375 2375
Entry Wire Line
	6825 2475 6925 2575
Wire Wire Line
	6925 2475 7375 2475
Entry Wire Line
	6825 2375 6925 2475
Wire Wire Line
	6925 2575 7375 2575
Entry Wire Line
	8425 2075 8325 2175
Entry Wire Line
	8425 2775 8325 2875
Wire Wire Line
	8325 2175 7875 2175
Entry Wire Line
	8425 2675 8325 2775
Wire Wire Line
	8325 2275 7875 2275
Entry Wire Line
	8425 2575 8325 2675
Wire Wire Line
	8325 2375 7875 2375
Entry Wire Line
	8425 2475 8325 2575
Wire Wire Line
	8325 2475 7875 2475
Entry Wire Line
	8425 2375 8325 2475
Wire Wire Line
	8325 2575 7875 2575
Entry Wire Line
	8425 2275 8325 2375
Wire Wire Line
	8325 2675 7875 2675
Entry Wire Line
	8425 2175 8325 2275
Wire Wire Line
	8325 2775 7875 2775
Text Label 7200 2175 0    50   ~ 0
D0
Text Label 7200 2275 0    50   ~ 0
D1
Text Label 7200 2375 0    50   ~ 0
D2
Text Label 7200 2475 0    50   ~ 0
D3
Text Label 7200 2575 0    50   ~ 0
D4
Text Label 7200 2675 0    50   ~ 0
D5
Text Label 7200 2775 0    50   ~ 0
D6
Text Label 7200 2875 0    50   ~ 0
D7
Text Label 8025 2675 0    50   ~ 0
CS
Text Label 8025 2575 0    50   ~ 0
A0
Text Label 8025 2475 0    50   ~ 0
INT
Text Label 8025 2375 0    50   ~ 0
5P
Text Label 8025 2275 0    50   ~ 0
GND
Text Label 8025 2175 0    50   ~ 0
GND
Wire Wire Line
	4925 3800 5375 3800
Entry Wire Line
	5375 3800 5475 3700
Text Label 5000 3800 0    50   ~ 0
ST
Entry Wire Line
	3575 5950 3675 6050
Wire Wire Line
	3675 6050 4125 6050
Entry Wire Line
	3575 6050 3675 6150
Wire Wire Line
	3675 6150 4125 6150
Entry Wire Line
	3575 6150 3675 6250
Wire Wire Line
	3675 6250 4125 6250
Entry Wire Line
	3575 6450 3675 6550
Wire Wire Line
	3675 6550 4125 6550
Entry Wire Line
	3575 6350 3675 6450
Wire Wire Line
	3675 6450 4125 6450
Entry Wire Line
	3575 6250 3675 6350
Wire Wire Line
	3675 6350 4125 6350
Text Label 3800 6050 0    50   ~ 0
A2
Text Label 3800 6150 0    50   ~ 0
A3
Text Label 3800 6250 0    50   ~ 0
A4
Text Label 3800 6350 0    50   ~ 0
A5
Text Label 3800 6450 0    50   ~ 0
A6
Text Label 3800 6550 0    50   ~ 0
A7
Entry Wire Line
	3575 5750 3675 5850
Wire Wire Line
	3675 5850 4125 5850
Entry Wire Line
	3575 5850 3675 5950
Wire Wire Line
	3675 5950 4125 5950
Text Label 3800 5850 0    50   ~ 0
A0
Text Label 3800 5950 0    50   ~ 0
A1
Entry Wire Line
	5475 5950 5375 6050
Wire Wire Line
	5375 6050 4925 6050
Entry Wire Line
	5475 6050 5375 6150
Wire Wire Line
	5375 6150 4925 6150
Entry Wire Line
	5475 6150 5375 6250
Wire Wire Line
	5375 6250 4925 6250
Entry Wire Line
	5475 6450 5375 6550
Wire Wire Line
	5375 6550 4925 6550
Entry Wire Line
	5475 6350 5375 6450
Wire Wire Line
	5375 6450 4925 6450
Entry Wire Line
	5475 6250 5375 6350
Wire Wire Line
	5375 6350 4925 6350
Text Label 5250 6050 2    50   ~ 0
D2
Text Label 5250 6150 2    50   ~ 0
D3
Text Label 5250 6250 2    50   ~ 0
D4
Text Label 5250 6350 2    50   ~ 0
D5
Text Label 5250 6550 2    50   ~ 0
D7
Entry Wire Line
	5475 5750 5375 5850
Wire Wire Line
	5375 5850 4925 5850
Entry Wire Line
	5475 5850 5375 5950
Wire Wire Line
	5375 5950 4925 5950
Text Label 5250 5850 2    50   ~ 0
D0
Text Label 5250 5950 2    50   ~ 0
D1
Text Label 5150 6450 0    50   ~ 0
D6
Wire Wire Line
	4125 6650 3675 6650
Wire Wire Line
	4125 6750 3675 6750
Wire Wire Line
	4125 6850 3675 6850
Wire Wire Line
	4125 7550 3675 7550
Wire Wire Line
	4125 7650 3675 7650
$Comp
L power:GND #PWR0109
U 1 1 656FC508
P 4525 7850
F 0 "#PWR0109" H 4525 7600 50  0001 C CNN
F 1 "GND" H 4530 7677 50  0000 C CNN
F 2 "" H 4525 7850 50  0001 C CNN
F 3 "" H 4525 7850 50  0001 C CNN
	1    4525 7850
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0110
U 1 1 656FCB2C
P 4525 5650
F 0 "#PWR0110" H 4525 5500 50  0001 C CNN
F 1 "+5P" V 4540 5778 50  0000 L CNN
F 2 "" H 4525 5650 50  0001 C CNN
F 3 "" H 4525 5650 50  0001 C CNN
	1    4525 5650
	1    0    0    -1  
$EndComp
Entry Wire Line
	3575 6550 3675 6650
Entry Wire Line
	3575 6650 3675 6750
Entry Wire Line
	3575 6750 3675 6850
Entry Wire Line
	3575 7450 3675 7550
Entry Wire Line
	3575 7550 3675 7650
Wire Bus Line
	3575 4925 3375 4925
Wire Bus Line
	3575 4925 3575 5325
Connection ~ 3575 5325
Text Label 3800 6650 0    50   ~ 0
A8
Text Label 3800 6750 0    50   ~ 0
A9
Text Label 3800 6850 0    50   ~ 0
A10
Text Label 3775 7550 0    50   ~ 0
~CS-ROM
Text Label 3775 7650 0    50   ~ 0
~RD
Wire Wire Line
	4925 3900 5375 3900
Entry Wire Line
	5375 3900 5475 3800
Text Label 4975 3900 0    50   ~ 0
~RESET
Wire Wire Line
	1450 6300 1450 6400
Wire Wire Line
	1450 6600 1450 6500
$Comp
L power:-5V #PWR0111
U 1 1 65619C28
P 1450 6400
F 0 "#PWR0111" H 1450 6500 50  0001 C CNN
F 1 "-5V" V 1465 6528 50  0000 L CNN
F 2 "" H 1450 6400 50  0001 C CNN
F 3 "" H 1450 6400 50  0001 C CNN
	1    1450 6400
	0    1    1    0   
$EndComp
Connection ~ 1450 6400
$Comp
L power:-12V #PWR0112
U 1 1 6561A936
P 1450 6600
F 0 "#PWR0112" H 1450 6700 50  0001 C CNN
F 1 "-12V" V 1465 6728 50  0000 L CNN
F 2 "" H 1450 6600 50  0001 C CNN
F 3 "" H 1450 6600 50  0001 C CNN
	1    1450 6600
	0    1    1    0   
$EndComp
Connection ~ 1450 6600
$Comp
L Device:CP C1
U 1 1 655FE866
P 3025 9425
F 0 "C1" H 3143 9471 50  0000 L CNN
F 1 "500u" H 3143 9380 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P2.50mm" H 3063 9275 50  0001 C CNN
F 3 "~" H 3025 9425 50  0001 C CNN
	1    3025 9425
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0113
U 1 1 655FF1A8
P 3025 9275
F 0 "#PWR0113" H 3025 9125 50  0001 C CNN
F 1 "+5P" V 3040 9403 50  0000 L CNN
F 2 "" H 3025 9275 50  0001 C CNN
F 3 "" H 3025 9275 50  0001 C CNN
	1    3025 9275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 655FF404
P 3025 9575
F 0 "#PWR0114" H 3025 9325 50  0001 C CNN
F 1 "GND" H 3030 9402 50  0000 C CNN
F 2 "" H 3025 9575 50  0001 C CNN
F 3 "" H 3025 9575 50  0001 C CNN
	1    3025 9575
	1    0    0    -1  
$EndComp
Entry Wire Line
	5750 6350 5850 6450
Wire Wire Line
	5850 6450 6300 6450
Entry Wire Line
	5750 6450 5850 6550
Wire Wire Line
	5850 6550 6300 6550
Entry Wire Line
	5750 6550 5850 6650
Wire Wire Line
	5850 6650 6300 6650
Entry Wire Line
	5750 6850 5850 6950
Wire Wire Line
	5850 6950 6300 6950
Entry Wire Line
	5750 6750 5850 6850
Wire Wire Line
	5850 6850 6300 6850
Entry Wire Line
	5750 6650 5850 6750
Wire Wire Line
	5850 6750 6300 6750
Text Label 5975 6450 0    50   ~ 0
A2
Text Label 5975 6550 0    50   ~ 0
A3
Text Label 5975 6650 0    50   ~ 0
A4
Text Label 5975 6750 0    50   ~ 0
A5
Text Label 5975 6850 0    50   ~ 0
A6
Text Label 5975 6950 0    50   ~ 0
A7
Entry Wire Line
	5750 6150 5850 6250
Wire Wire Line
	5850 6250 6300 6250
Entry Wire Line
	5750 6250 5850 6350
Wire Wire Line
	5850 6350 6300 6350
Text Label 5975 6250 0    50   ~ 0
A0
Text Label 5975 6350 0    50   ~ 0
A1
Entry Wire Line
	7850 6350 7750 6450
Wire Wire Line
	7750 6450 7300 6450
Entry Wire Line
	7850 6450 7750 6550
Wire Wire Line
	7750 6550 7300 6550
Entry Wire Line
	7850 6550 7750 6650
Wire Wire Line
	7750 6650 7300 6650
Entry Wire Line
	7850 6850 7750 6950
Wire Wire Line
	7750 6950 7300 6950
Entry Wire Line
	7850 6750 7750 6850
Wire Wire Line
	7750 6850 7300 6850
Entry Wire Line
	7850 6650 7750 6750
Wire Wire Line
	7750 6750 7300 6750
Text Label 7625 6450 2    50   ~ 0
D2
Text Label 7625 6550 2    50   ~ 0
D3
Text Label 7625 6650 2    50   ~ 0
D4
Text Label 7625 6750 2    50   ~ 0
D5
Text Label 7625 6950 2    50   ~ 0
D7
Entry Wire Line
	7850 6150 7750 6250
Wire Wire Line
	7750 6250 7300 6250
Entry Wire Line
	7850 6250 7750 6350
Wire Wire Line
	7750 6350 7300 6350
Text Label 7625 6250 2    50   ~ 0
D0
Text Label 7625 6350 2    50   ~ 0
D1
Text Label 7525 6850 0    50   ~ 0
D6
Wire Wire Line
	6300 7050 5850 7050
Wire Wire Line
	6300 7150 5850 7150
Wire Wire Line
	6300 7250 5850 7250
Wire Wire Line
	7300 7350 7750 7350
$Comp
L power:GND #PWR0115
U 1 1 6560A2E4
P 6800 8050
F 0 "#PWR0115" H 6800 7800 50  0001 C CNN
F 1 "GND" H 6805 7877 50  0000 C CNN
F 2 "" H 6800 8050 50  0001 C CNN
F 3 "" H 6800 8050 50  0001 C CNN
	1    6800 8050
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0116
U 1 1 6560A2EA
P 6800 5750
F 0 "#PWR0116" H 6800 5600 50  0001 C CNN
F 1 "+5P" V 6815 5878 50  0000 L CNN
F 2 "" H 6800 5750 50  0001 C CNN
F 3 "" H 6800 5750 50  0001 C CNN
	1    6800 5750
	1    0    0    -1  
$EndComp
Entry Wire Line
	5750 6950 5850 7050
Entry Wire Line
	5750 7050 5850 7150
Entry Wire Line
	5750 7150 5850 7250
Entry Wire Line
	7850 7250 7750 7350
Text Label 5975 7050 0    50   ~ 0
A8
Text Label 5975 7150 0    50   ~ 0
A9
Text Label 5975 7250 0    50   ~ 0
A10
Text Label 7650 7350 2    50   ~ 0
~RD
$Comp
L Device:C C2
U 1 1 6563C3B4
P 4600 9450
F 0 "C2" V 4348 9450 50  0000 C CNN
F 1 "100nF" V 4439 9450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4638 9300 50  0001 C CNN
F 3 "~" H 4600 9450 50  0001 C CNN
	1    4600 9450
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0117
U 1 1 6563C3BA
P 4600 9300
F 0 "#PWR0117" H 4600 9150 50  0001 C CNN
F 1 "+5P" V 4615 9428 50  0000 L CNN
F 2 "" H 4600 9300 50  0001 C CNN
F 3 "" H 4600 9300 50  0001 C CNN
	1    4600 9300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 6563C3C0
P 4600 9600
F 0 "#PWR0118" H 4600 9350 50  0001 C CNN
F 1 "GND" H 4605 9427 50  0000 C CNN
F 2 "" H 4600 9600 50  0001 C CNN
F 3 "" H 4600 9600 50  0001 C CNN
	1    4600 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 6563C3C6
P 5100 9450
F 0 "C3" V 4848 9450 50  0000 C CNN
F 1 "100nF" V 4939 9450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5138 9300 50  0001 C CNN
F 3 "~" H 5100 9450 50  0001 C CNN
	1    5100 9450
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0119
U 1 1 6563C3CC
P 5100 9300
F 0 "#PWR0119" H 5100 9150 50  0001 C CNN
F 1 "+5P" V 5115 9428 50  0000 L CNN
F 2 "" H 5100 9300 50  0001 C CNN
F 3 "" H 5100 9300 50  0001 C CNN
	1    5100 9300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6563C3D2
P 5100 9600
F 0 "#PWR0120" H 5100 9350 50  0001 C CNN
F 1 "GND" H 5105 9427 50  0000 C CNN
F 2 "" H 5100 9600 50  0001 C CNN
F 3 "" H 5100 9600 50  0001 C CNN
	1    5100 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 6565AA92
P 5550 9450
F 0 "C4" H 5668 9496 50  0000 L CNN
F 1 "4u7" H 5668 9405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5588 9300 50  0001 C CNN
F 3 "~" H 5550 9450 50  0001 C CNN
	1    5550 9450
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0121
U 1 1 6565AEA6
P 5550 9300
F 0 "#PWR0121" H 5550 9150 50  0001 C CNN
F 1 "+5P" V 5565 9428 50  0000 L CNN
F 2 "" H 5550 9300 50  0001 C CNN
F 3 "" H 5550 9300 50  0001 C CNN
	1    5550 9300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 6565AEB0
P 5550 9600
F 0 "#PWR0122" H 5550 9350 50  0001 C CNN
F 1 "GND" H 5555 9427 50  0000 C CNN
F 2 "" H 5550 9600 50  0001 C CNN
F 3 "" H 5550 9600 50  0001 C CNN
	1    5550 9600
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM:628128_DIP32_SSOP32 U3
U 1 1 67B5812F
P 6800 7050
F 0 "U3" H 6800 8231 50  0000 C CNN
F 1 "628128_DIP32_SSOP32" H 6800 8140 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 6800 7050 50  0001 C CNN
F 3 "http://www.futurlec.com/Datasheet/Memory/628128.pdf" H 6800 7050 50  0001 C CNN
	1    6800 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 6050 6800 5750
Wire Bus Line
	5750 5325 7850 5325
Connection ~ 5750 5325
Wire Wire Line
	7300 7450 7750 7450
Wire Wire Line
	6300 7350 5850 7350
Wire Wire Line
	6300 7450 5850 7450
Wire Wire Line
	6300 7550 5850 7550
Wire Wire Line
	6300 7650 5850 7650
Wire Wire Line
	6300 7750 5850 7750
Wire Wire Line
	6300 7850 6125 7850
Wire Wire Line
	6125 7850 6125 8000
$Comp
L power:GND #PWR0123
U 1 1 67C7EFDE
P 6125 8000
F 0 "#PWR0123" H 6125 7750 50  0001 C CNN
F 1 "GND" H 6130 7827 50  0000 C CNN
F 2 "" H 6125 8000 50  0001 C CNN
F 3 "" H 6125 8000 50  0001 C CNN
	1    6125 8000
	1    0    0    -1  
$EndComp
Entry Wire Line
	5750 7250 5850 7350
Entry Wire Line
	5750 7350 5850 7450
Entry Wire Line
	5750 7450 5850 7550
Entry Wire Line
	5750 7550 5850 7650
Entry Wire Line
	5750 7650 5850 7750
Entry Wire Line
	7750 7450 7850 7350
Wire Wire Line
	7300 7150 7750 7150
$Comp
L power:+5P #PWR0124
U 1 1 67CAD7EA
P 7300 7250
F 0 "#PWR0124" H 7300 7100 50  0001 C CNN
F 1 "+5P" V 7315 7378 50  0000 L CNN
F 2 "" H 7300 7250 50  0001 C CNN
F 3 "" H 7300 7250 50  0001 C CNN
	1    7300 7250
	0    1    1    0   
$EndComp
Entry Wire Line
	7750 7150 7850 7050
Wire Wire Line
	4925 4000 5375 4000
Entry Wire Line
	5375 4000 5475 3900
Text Label 4975 4000 0    50   ~ 0
~CS-RAM
Text Label 7375 7150 0    50   ~ 0
~CS-RAM
Text Label 7550 7450 0    50   ~ 0
~WR
Text Label 5975 7350 0    50   ~ 0
A11
Text Label 5975 7450 0    50   ~ 0
A12
Text Label 5975 7550 0    50   ~ 0
A13
Text Label 5975 7650 0    50   ~ 0
A14
Text Label 5975 7750 0    50   ~ 0
A15
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J2
U 1 1 67D35D0F
P 6025 4575
F 0 "J2" V 6029 4655 50  0000 L CNN
F 1 "RAM-Sel" V 6120 4655 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Horizontal" H 6025 4575 50  0001 C CNN
F 3 "~" H 6025 4575 50  0001 C CNN
	1    6025 4575
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 67D36B78
P 5925 4875
F 0 "#PWR0125" H 5925 4625 50  0001 C CNN
F 1 "GND" H 5930 4702 50  0000 C CNN
F 2 "" H 5925 4875 50  0001 C CNN
F 3 "" H 5925 4875 50  0001 C CNN
	1    5925 4875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 67D3725F
P 6025 4875
F 0 "#PWR0126" H 6025 4625 50  0001 C CNN
F 1 "GND" H 6030 4702 50  0000 C CNN
F 2 "" H 6025 4875 50  0001 C CNN
F 3 "" H 6025 4875 50  0001 C CNN
	1    6025 4875
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 4100 6025 4375
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 67D6A520
P 7500 4575
F 0 "J3" H 7580 4567 50  0000 L CNN
F 1 "/ROMDI" H 7580 4476 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 7500 4575 50  0001 C CNN
F 3 "~" H 7500 4575 50  0001 C CNN
	1    7500 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 67D6B24B
P 7300 4675
F 0 "#PWR0129" H 7300 4425 50  0001 C CNN
F 1 "GND" H 7305 4502 50  0000 C CNN
F 2 "" H 7300 4675 50  0001 C CNN
F 3 "" H 7300 4675 50  0001 C CNN
	1    7300 4675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4575 6600 4575
Wire Wire Line
	6600 4575 6600 3175
Wire Wire Line
	6600 3175 5575 3175
Entry Wire Line
	5475 3075 5575 3175
Text Label 5750 3175 0    50   ~ 0
~MEMDI
Wire Wire Line
	4925 4200 5450 4200
Wire Wire Line
	5925 4200 5925 4375
Wire Wire Line
	4925 4100 5400 4100
Text Label 5000 4100 0    50   ~ 0
48KRAM
Text Label 5000 4200 0    50   ~ 0
RAM-ON
$Comp
L Memory_EPROM:27C512 U2
U 1 1 67B558DB
P 4525 6750
F 0 "U2" H 4525 8031 50  0000 C CNN
F 1 "27512" H 4525 7940 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 4525 6750 50  0001 C CNN
F 3 "https://downloads.reactivemicro.com/Electronics/ROM/2764%20EPROM.pdf" H 4525 6750 50  0001 C CNN
	1    4525 6750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J4
U 1 1 67BF947A
P 2975 7600
F 0 "J4" V 2979 7680 50  0000 L CNN
F 1 "ROM-Sel" V 3070 7680 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Horizontal" H 2975 7600 50  0001 C CNN
F 3 "~" H 2975 7600 50  0001 C CNN
	1    2975 7600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 67BF9480
P 2875 7900
F 0 "#PWR0130" H 2875 7650 50  0001 C CNN
F 1 "GND" H 2880 7727 50  0000 C CNN
F 2 "" H 2875 7900 50  0001 C CNN
F 3 "" H 2875 7900 50  0001 C CNN
	1    2875 7900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 67BF9486
P 2975 7900
F 0 "#PWR0131" H 2975 7650 50  0001 C CNN
F 1 "GND" H 2980 7727 50  0000 C CNN
F 2 "" H 2975 7900 50  0001 C CNN
F 3 "" H 2975 7900 50  0001 C CNN
	1    2975 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4125 7250 2875 7250
Wire Wire Line
	4125 7350 2975 7350
Wire Bus Line
	3575 5325 5475 5325
Connection ~ 5475 5325
Wire Bus Line
	5475 5325 5750 5325
Wire Wire Line
	4125 6950 3675 6950
Entry Wire Line
	3575 6850 3675 6950
Text Label 3800 6950 0    50   ~ 0
A11
Text Label 3750 7250 0    50   ~ 0
ROM1
Text Label 3750 7350 0    50   ~ 0
ROM2
Wire Wire Line
	4125 7050 3675 7050
Entry Wire Line
	3575 6950 3675 7050
Text Label 3800 7050 0    50   ~ 0
A12
$Comp
L Device:R_Network04 RN1
U 1 1 67D077B4
P 2975 5875
F 0 "RN1" H 2695 5921 50  0000 R CNN
F 1 "10K" H 2695 5830 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP5" V 3250 5875 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2975 5875 50  0001 C CNN
	1    2975 5875
	-1   0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0132
U 1 1 67D165E1
P 3175 5675
F 0 "#PWR0132" H 3175 5525 50  0001 C CNN
F 1 "+5P" V 3190 5803 50  0000 L CNN
F 2 "" H 3175 5675 50  0001 C CNN
F 3 "" H 3175 5675 50  0001 C CNN
	1    3175 5675
	1    0    0    -1  
$EndComp
Wire Wire Line
	3075 6075 3075 6300
Wire Wire Line
	3075 6300 3325 6300
Wire Wire Line
	3325 6300 3325 5225
Wire Wire Line
	3325 5225 5450 5225
Wire Wire Line
	5450 5225 5450 4200
Connection ~ 5450 4200
Wire Wire Line
	5450 4200 5925 4200
Wire Wire Line
	3175 6075 3175 6250
Wire Wire Line
	3175 6250 3300 6250
Wire Wire Line
	3300 6250 3300 5200
Wire Wire Line
	3300 5200 5400 5200
Wire Wire Line
	5400 5200 5400 4100
Connection ~ 5400 4100
Wire Wire Line
	5400 4100 6025 4100
Text Label 8025 2775 0    50   ~ 0
~RD
Text Label 8025 2875 0    50   ~ 0
~WR
Wire Wire Line
	7875 2875 8325 2875
Connection ~ 2975 7350
Wire Wire Line
	2975 7350 2975 7400
Wire Wire Line
	2975 6075 2975 7350
Connection ~ 2875 7250
Wire Wire Line
	2875 7250 2875 7400
Wire Wire Line
	2875 6075 2875 7250
Wire Wire Line
	4125 7150 3675 7150
Entry Wire Line
	3575 7050 3675 7150
Text Label 3800 7150 0    50   ~ 0
A13
Wire Bus Line
	5475 5325 5475 6450
Wire Bus Line
	5475 2550 5475 3900
Wire Bus Line
	8425 2075 8425 3200
Wire Bus Line
	6825 2075 6825 3200
Wire Bus Line
	1750 2550 1750 4100
Wire Bus Line
	3375 2550 3375 4925
Wire Bus Line
	3575 5325 3575 7550
Wire Bus Line
	7850 5325 7850 7350
Wire Bus Line
	5750 5325 5750 7650
Wire Bus Line
	2775 2550 2775 5300
$EndSCHEMATC
