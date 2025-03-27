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
Entry Wire Line
	12350 2000 12450 2100
Wire Wire Line
	12450 2100 12900 2100
Entry Wire Line
	12350 2100 12450 2200
Wire Wire Line
	12450 2200 12900 2200
Entry Wire Line
	12350 2200 12450 2300
Wire Wire Line
	12450 2300 12900 2300
Entry Wire Line
	12350 2700 12450 2800
Wire Wire Line
	12450 2800 12900 2800
Entry Wire Line
	12350 2600 12450 2700
Wire Wire Line
	12450 2700 12900 2700
Entry Wire Line
	12350 2500 12450 2600
Wire Wire Line
	12450 2600 12900 2600
Entry Wire Line
	12350 2400 12450 2500
Wire Wire Line
	12450 2500 12900 2500
Entry Wire Line
	12350 2300 12450 2400
Wire Wire Line
	12450 2400 12900 2400
Connection ~ 2775 2550
Text Label 12575 2800 0    50   ~ 0
~RD
Wire Wire Line
	12900 2900 12450 2900
Entry Wire Line
	12350 2800 12450 2900
Entry Wire Line
	12350 2900 12450 3000
Text Label 12575 2900 0    50   ~ 0
~WR
Wire Wire Line
	13900 2400 14350 2400
Entry Wire Line
	14450 2300 14350 2400
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
Text Label 12575 2600 0    50   ~ 0
A15
Text Label 12575 2500 0    50   ~ 0
A14
Text Label 12575 2400 0    50   ~ 0
A13
Text Label 12575 2300 0    50   ~ 0
A12
Text Label 12575 2700 0    50   ~ 0
~MREQ
Text Label 12575 2100 0    50   ~ 0
A10
Text Label 13975 2400 0    50   ~ 0
~CS-ROM
$Comp
L power:GND #PWR0105
U 1 1 65639B0D
P 13400 3300
F 0 "#PWR0105" H 13400 3050 50  0001 C CNN
F 1 "GND" H 13405 3127 50  0000 C CNN
F 2 "" H 13400 3300 50  0001 C CNN
F 3 "" H 13400 3300 50  0001 C CNN
	1    13400 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0106
U 1 1 65639FF6
P 13400 1900
F 0 "#PWR0106" H 13400 1750 50  0001 C CNN
F 1 "+5P" V 13415 2028 50  0000 L CNN
F 2 "" H 13400 1900 50  0001 C CNN
F 3 "" H 13400 1900 50  0001 C CNN
	1    13400 1900
	1    0    0    -1  
$EndComp
Entry Wire Line
	10700 6725 10800 6825
Wire Wire Line
	10800 6825 11250 6825
Entry Wire Line
	10700 6825 10800 6925
Wire Wire Line
	10800 6925 11250 6925
Entry Wire Line
	10700 6925 10800 7025
Wire Wire Line
	10800 7025 11250 7025
Entry Wire Line
	10700 7225 10800 7325
Wire Wire Line
	10800 7325 11250 7325
Entry Wire Line
	10700 7125 10800 7225
Wire Wire Line
	10800 7225 11250 7225
Entry Wire Line
	10700 7025 10800 7125
Wire Wire Line
	10800 7125 11250 7125
Text Label 10925 6825 0    50   ~ 0
A2
Text Label 10925 6925 0    50   ~ 0
A3
Text Label 10925 7025 0    50   ~ 0
A4
Text Label 10925 7125 0    50   ~ 0
A5
Text Label 10925 7225 0    50   ~ 0
A6
Text Label 10925 7325 0    50   ~ 0
A7
Entry Wire Line
	10700 6525 10800 6625
Wire Wire Line
	10800 6625 11250 6625
Entry Wire Line
	10700 6625 10800 6725
Wire Wire Line
	10800 6725 11250 6725
Text Label 10925 6625 0    50   ~ 0
A0
Text Label 10925 6725 0    50   ~ 0
A1
Entry Wire Line
	12600 6725 12500 6825
Wire Wire Line
	12500 6825 12050 6825
Entry Wire Line
	12600 6825 12500 6925
Wire Wire Line
	12500 6925 12050 6925
Entry Wire Line
	12600 6925 12500 7025
Wire Wire Line
	12500 7025 12050 7025
Entry Wire Line
	12600 7225 12500 7325
Wire Wire Line
	12500 7325 12050 7325
Entry Wire Line
	12600 7125 12500 7225
Wire Wire Line
	12500 7225 12050 7225
Entry Wire Line
	12600 7025 12500 7125
Wire Wire Line
	12500 7125 12050 7125
Text Label 12375 6825 2    50   ~ 0
D2
Text Label 12375 6925 2    50   ~ 0
D3
Text Label 12375 7025 2    50   ~ 0
D4
Text Label 12375 7125 2    50   ~ 0
D5
Text Label 12375 7325 2    50   ~ 0
D7
Entry Wire Line
	12600 6525 12500 6625
Wire Wire Line
	12500 6625 12050 6625
Entry Wire Line
	12600 6625 12500 6725
Wire Wire Line
	12500 6725 12050 6725
Text Label 12375 6625 2    50   ~ 0
D0
Text Label 12375 6725 2    50   ~ 0
D1
Text Label 12275 7225 0    50   ~ 0
D6
Wire Wire Line
	11250 7425 10800 7425
Wire Wire Line
	11250 7525 10800 7525
Wire Wire Line
	11250 7625 10800 7625
Wire Wire Line
	11250 8225 10800 8225
Wire Wire Line
	11250 8325 10800 8325
$Comp
L power:GND #PWR0109
U 1 1 656FC508
P 11650 8625
F 0 "#PWR0109" H 11650 8375 50  0001 C CNN
F 1 "GND" H 11655 8452 50  0000 C CNN
F 2 "" H 11650 8625 50  0001 C CNN
F 3 "" H 11650 8625 50  0001 C CNN
	1    11650 8625
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0110
U 1 1 656FCB2C
P 11650 6425
F 0 "#PWR0110" H 11650 6275 50  0001 C CNN
F 1 "+5P" V 11665 6553 50  0000 L CNN
F 2 "" H 11650 6425 50  0001 C CNN
F 3 "" H 11650 6425 50  0001 C CNN
	1    11650 6425
	1    0    0    -1  
$EndComp
Entry Wire Line
	10700 7325 10800 7425
Entry Wire Line
	10700 7425 10800 7525
Entry Wire Line
	10700 7525 10800 7625
Entry Wire Line
	10700 8225 10800 8325
Entry Wire Line
	10700 8125 10800 8225
Text Label 10925 7425 0    50   ~ 0
A8
Text Label 10925 7525 0    50   ~ 0
A9
Text Label 10925 7625 0    50   ~ 0
A10
Text Label 10900 8225 0    50   ~ 0
~CS-ROM
Text Label 10900 8325 0    50   ~ 0
~RD
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
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 3063 9275 50  0001 C CNN
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
	12875 7125 12975 7225
Wire Wire Line
	12975 7225 13425 7225
Entry Wire Line
	12875 7225 12975 7325
Wire Wire Line
	12975 7325 13425 7325
Entry Wire Line
	12875 7325 12975 7425
Wire Wire Line
	12975 7425 13425 7425
Entry Wire Line
	12875 7625 12975 7725
Wire Wire Line
	12975 7725 13425 7725
Entry Wire Line
	12875 7525 12975 7625
Wire Wire Line
	12975 7625 13425 7625
Entry Wire Line
	12875 7425 12975 7525
Wire Wire Line
	12975 7525 13425 7525
Text Label 13100 7225 0    50   ~ 0
A2
Text Label 13100 7325 0    50   ~ 0
A3
Text Label 13100 7425 0    50   ~ 0
A4
Text Label 13100 7525 0    50   ~ 0
A5
Text Label 13100 7625 0    50   ~ 0
A6
Text Label 13100 7725 0    50   ~ 0
A7
Entry Wire Line
	12875 6925 12975 7025
Wire Wire Line
	12975 7025 13425 7025
Entry Wire Line
	12875 7025 12975 7125
Wire Wire Line
	12975 7125 13425 7125
Text Label 13100 7025 0    50   ~ 0
A0
Text Label 13100 7125 0    50   ~ 0
A1
Entry Wire Line
	14975 7125 14875 7225
Wire Wire Line
	14875 7225 14425 7225
Entry Wire Line
	14975 7225 14875 7325
Wire Wire Line
	14875 7325 14425 7325
Entry Wire Line
	14975 7325 14875 7425
Wire Wire Line
	14875 7425 14425 7425
Entry Wire Line
	14975 7625 14875 7725
Wire Wire Line
	14875 7725 14425 7725
Entry Wire Line
	14975 7525 14875 7625
Wire Wire Line
	14875 7625 14425 7625
Entry Wire Line
	14975 7425 14875 7525
Wire Wire Line
	14875 7525 14425 7525
Text Label 14750 7225 2    50   ~ 0
D2
Text Label 14750 7325 2    50   ~ 0
D3
Text Label 14750 7425 2    50   ~ 0
D4
Text Label 14750 7525 2    50   ~ 0
D5
Text Label 14750 7725 2    50   ~ 0
D7
Entry Wire Line
	14975 6925 14875 7025
Wire Wire Line
	14875 7025 14425 7025
Entry Wire Line
	14975 7025 14875 7125
Wire Wire Line
	14875 7125 14425 7125
Text Label 14750 7025 2    50   ~ 0
D0
Text Label 14750 7125 2    50   ~ 0
D1
Text Label 14650 7625 0    50   ~ 0
D6
Wire Wire Line
	13425 7825 12975 7825
Wire Wire Line
	13425 7925 12975 7925
Wire Wire Line
	13425 8025 12975 8025
Wire Wire Line
	14425 8125 14875 8125
$Comp
L power:GND #PWR0115
U 1 1 6560A2E4
P 13925 8825
F 0 "#PWR0115" H 13925 8575 50  0001 C CNN
F 1 "GND" H 13930 8652 50  0000 C CNN
F 2 "" H 13925 8825 50  0001 C CNN
F 3 "" H 13925 8825 50  0001 C CNN
	1    13925 8825
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0116
U 1 1 6560A2EA
P 13925 6525
F 0 "#PWR0116" H 13925 6375 50  0001 C CNN
F 1 "+5P" V 13940 6653 50  0000 L CNN
F 2 "" H 13925 6525 50  0001 C CNN
F 3 "" H 13925 6525 50  0001 C CNN
	1    13925 6525
	1    0    0    -1  
$EndComp
Entry Wire Line
	12875 7725 12975 7825
Entry Wire Line
	12875 7825 12975 7925
Entry Wire Line
	12875 7925 12975 8025
Entry Wire Line
	14975 8025 14875 8125
Text Label 13100 7825 0    50   ~ 0
A8
Text Label 13100 7925 0    50   ~ 0
A9
Text Label 13100 8025 0    50   ~ 0
A10
Text Label 14775 8125 2    50   ~ 0
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
P 13925 7825
F 0 "U3" H 13925 9006 50  0000 C CNN
F 1 "628128_DIP32_SSOP32" H 13925 8915 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 13925 7825 50  0001 C CNN
F 3 "http://www.futurlec.com/Datasheet/Memory/628128.pdf" H 13925 7825 50  0001 C CNN
	1    13925 7825
	1    0    0    -1  
$EndComp
Wire Wire Line
	13925 6825 13925 6525
Wire Bus Line
	12875 6100 14975 6100
Connection ~ 12875 6100
Wire Wire Line
	14425 8225 14875 8225
Wire Wire Line
	13425 8125 12975 8125
Wire Wire Line
	13425 8225 12975 8225
Wire Wire Line
	13425 8325 12975 8325
Wire Wire Line
	13425 8425 12975 8425
Wire Wire Line
	13425 8525 12975 8525
Wire Wire Line
	13425 8625 13250 8625
Wire Wire Line
	13250 8625 13250 8775
$Comp
L power:GND #PWR0123
U 1 1 67C7EFDE
P 13250 8775
F 0 "#PWR0123" H 13250 8525 50  0001 C CNN
F 1 "GND" H 13255 8602 50  0000 C CNN
F 2 "" H 13250 8775 50  0001 C CNN
F 3 "" H 13250 8775 50  0001 C CNN
	1    13250 8775
	1    0    0    -1  
$EndComp
Entry Wire Line
	12875 8025 12975 8125
Entry Wire Line
	12875 8125 12975 8225
Entry Wire Line
	12875 8225 12975 8325
Entry Wire Line
	12875 8325 12975 8425
Entry Wire Line
	12875 8425 12975 8525
Entry Wire Line
	14875 8225 14975 8125
Wire Wire Line
	14425 7925 14875 7925
$Comp
L power:+5P #PWR0124
U 1 1 67CAD7EA
P 14425 8025
F 0 "#PWR0124" H 14425 7875 50  0001 C CNN
F 1 "+5P" V 14440 8153 50  0000 L CNN
F 2 "" H 14425 8025 50  0001 C CNN
F 3 "" H 14425 8025 50  0001 C CNN
	1    14425 8025
	0    1    1    0   
$EndComp
Entry Wire Line
	14875 7925 14975 7825
Wire Wire Line
	13900 2500 14350 2500
Entry Wire Line
	14350 2500 14450 2400
Text Label 13950 2500 0    50   ~ 0
~CS-RAM
Text Label 14500 7925 0    50   ~ 0
~CS-RAM
Text Label 14675 8225 0    50   ~ 0
~WR
Text Label 13100 8125 0    50   ~ 0
A11
Text Label 13100 8225 0    50   ~ 0
A12
Text Label 13100 8325 0    50   ~ 0
A13
Text Label 13100 8425 0    50   ~ 0
A14
Text Label 13100 8525 0    50   ~ 0
A15
Text Label 12575 3000 0    50   ~ 0
~MEMDI
Wire Bus Line
	10700 6100 12350 6100
Connection ~ 12600 6100
Wire Bus Line
	12600 6100 12875 6100
$Comp
L Memory_EPROM:2764 U6
U 1 1 67E9515B
P 11650 7425
F 0 "U6" H 11650 8606 50  0000 C CNN
F 1 "2764" H 11650 8515 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 11650 7425 50  0001 C CNN
F 3 "https://downloads.reactivemicro.com/Electronics/ROM/2764%20EPROM.pdf" H 11650 7425 50  0001 C CNN
	1    11650 7425
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0107
U 1 1 67EBEE6B
P 10850 8025
F 0 "#PWR0107" H 10850 7875 50  0001 C CNN
F 1 "+5P" V 10865 8153 50  0000 L CNN
F 2 "" H 10850 8025 50  0001 C CNN
F 3 "" H 10850 8025 50  0001 C CNN
	1    10850 8025
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 67EBF523
P 11075 8500
F 0 "#PWR0108" H 11075 8250 50  0001 C CNN
F 1 "GND" H 11080 8327 50  0000 C CNN
F 2 "" H 11075 8500 50  0001 C CNN
F 3 "" H 11075 8500 50  0001 C CNN
	1    11075 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 8125 11000 8125
Wire Wire Line
	11000 8125 11000 8025
Wire Wire Line
	11000 8025 10850 8025
Wire Wire Line
	11000 8025 11250 8025
Connection ~ 11000 8025
Wire Wire Line
	11250 7725 11075 7725
Wire Wire Line
	11075 7725 11075 7825
Wire Wire Line
	11250 7825 11075 7825
Connection ~ 11075 7825
Wire Wire Line
	11075 7825 11075 8500
Wire Wire Line
	11650 8625 11650 8525
Text Label 12575 2200 0    50   ~ 0
A11
$Comp
L Logic_Programmable:GAL16V8 U7
U 1 1 67F204E1
P 13400 2600
F 0 "U7" H 13400 3481 50  0000 C CNN
F 1 "GAL16V8" H 13400 3390 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 13400 2600 50  0001 C CNN
F 3 "" H 13400 2600 50  0001 C CNN
	1    13400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	12900 3000 12450 3000
Wire Bus Line
	12350 1375 14450 1375
$Comp
L power:+5P #PWR0125
U 1 1 67F9A2A0
P 15025 1500
F 0 "#PWR0125" H 15025 1350 50  0001 C CNN
F 1 "+5P" V 15040 1628 50  0000 L CNN
F 2 "" H 15025 1500 50  0001 C CNN
F 3 "" H 15025 1500 50  0001 C CNN
	1    15025 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04 RN1
U 1 1 67F9A75E
P 15225 1700
F 0 "RN1" H 15413 1746 50  0000 L CNN
F 1 "10K" H 15413 1655 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 15500 1700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 15225 1700 50  0001 C CNN
	1    15225 1700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x04 SW2
U 1 1 67F9B683
P 15125 3225
F 0 "SW2" V 15079 3555 50  0000 L CNN
F 1 "RAM-Sel" V 15170 3555 50  0000 L CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx04_Slide_6.7x11.72mm_W7.62mm_P2.54mm_LowProfile" H 15125 3225 50  0001 C CNN
F 3 "~" H 15125 3225 50  0001 C CNN
	1    15125 3225
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 67F9DE54
P 15025 3525
F 0 "#PWR0126" H 15025 3275 50  0001 C CNN
F 1 "GND" H 15030 3352 50  0000 C CNN
F 2 "" H 15025 3525 50  0001 C CNN
F 3 "" H 15025 3525 50  0001 C CNN
	1    15025 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	15325 3525 15225 3525
Connection ~ 15025 3525
Connection ~ 15125 3525
Wire Wire Line
	15125 3525 15025 3525
Connection ~ 15225 3525
Wire Wire Line
	15225 3525 15125 3525
Wire Wire Line
	15025 2800 15025 2925
Wire Wire Line
	13900 2800 15025 2800
Wire Wire Line
	15125 2700 15125 2925
Wire Wire Line
	13900 2700 15125 2700
Wire Wire Line
	15225 2200 15225 2925
Wire Wire Line
	13900 2200 15225 2200
Wire Wire Line
	15325 2100 15325 2925
Wire Wire Line
	13900 2100 15325 2100
Wire Wire Line
	15025 2800 15025 1900
Connection ~ 15025 2800
Wire Wire Line
	15325 2100 15325 1900
Connection ~ 15325 2100
Wire Wire Line
	15225 2200 15225 1900
Connection ~ 15225 2200
Wire Wire Line
	15125 2700 15125 1900
Connection ~ 15125 2700
Connection ~ 12350 6100
Wire Bus Line
	12350 6100 12600 6100
Wire Bus Line
	2775 675  4825 675 
Wire Bus Line
	12350 675  12350 1375
Wire Bus Line
	2775 675  2775 2550
Connection ~ 12350 1375
$Comp
L Zilog_Z80_Peripherals:SIO2-DIP-40 IC1
U 1 1 680052DA
P 5575 1975
F 0 "IC1" H 5875 2356 50  0000 C CNN
F 1 "SIO2-DIP-40" H 5875 2265 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 5625 3875 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0183.pdf" H 4775 825 50  0001 L CNN
F 4 "Z80 CMOS SIO/2 Z84C42 Zilog" H 5625 3675 50  0001 L CNN "Description"
F 5 "4.06" H 5975 3525 50  0001 L CNN "Height"
F 6 "Zilog" H 5975 3425 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 5625 3375 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 5625 3275 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 5625 3175 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 5625 3075 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 5625 2975 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 5625 2875 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 5625 2775 50  0001 L CNN "Allied Price/Stock"
	1    5575 1975
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:PICO J2
U 1 1 680076CA
P 8150 3900
F 0 "J2" H 8850 1211 50  0000 C CNN
F 1 "PICO" H 8850 1120 50  0000 C CNN
F 2 "PICO" H 9400 6100 50  0001 L CNN
F 3 "https://datasheets.raspberrypi.org/pico/pico_datasheet.pdf" H 9400 6000 50  0001 L CNN
F 4 "RP2040 microcontroller chip designed by Raspberry Pi in the United Kingdom 2  SPI, 2  I2C, 2  UART, 3  12-bit ADC, 16  controllable PWM channels" H 9400 5900 50  0001 L CNN "Description"
F 5 "1" H 9400 5800 50  0001 L CNN "Height"
F 6 "RASPBERRY-PI" H 9400 5700 50  0001 L CNN "Manufacturer_Name"
F 7 "PICO" H 9400 5600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 9400 5500 50  0001 L CNN "Mouser Part Number"
F 9 "" H 9400 5400 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 9400 5300 50  0001 L CNN "Arrow Part Number"
F 11 "" H 9400 5200 50  0001 L CNN "Arrow Price/Stock"
	1    8150 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 5 1 68012B4D
P 6625 9575
F 0 "U1" H 6855 9621 50  0000 L CNN
F 1 "74LS00" H 6855 9530 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6625 9575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6625 9575 50  0001 C CNN
	5    6625 9575
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U2
U 1 1 68014BE3
P 5150 6550
F 0 "U2" H 5150 7331 50  0000 C CNN
F 1 "74LS138" H 5150 7240 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5150 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5150 6550 50  0001 C CNN
	1    5150 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS193 U4
U 1 1 68015368
P 5925 8000
F 0 "U4" H 5925 8881 50  0000 C CNN
F 1 "74LS193" H 5925 8790 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5925 8000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls193.pdf" H 5925 8000 50  0001 C CNN
	1    5925 8000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6801660C
P 1625 7925
F 0 "R1" V 1832 7925 50  0000 C CNN
F 1 "2K7" V 1741 7925 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1555 7925 50  0001 C CNN
F 3 "~" H 1625 7925 50  0001 C CNN
	1    1625 7925
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 68016CE3
P 2375 7625
F 0 "Y1" H 2375 7893 50  0000 C CNN
F 1 "9.8304MHz" H 2375 7802 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Horizontal" H 2375 7625 50  0001 C CNN
F 3 "~" H 2375 7625 50  0001 C CNN
	1    2375 7625
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 680178BB
P 2475 8525
F 0 "C5" V 2727 8525 50  0000 C CNN
F 1 "22p" V 2636 8525 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2513 8375 50  0001 C CNN
F 3 "~" H 2475 8525 50  0001 C CNN
	1    2475 8525
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 68018B21
P 11100 2950
F 0 "J3" H 11180 2942 50  0000 L CNN
F 1 "Conn_01x06" H 11180 2851 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 11100 2950 50  0001 C CNN
F 3 "~" H 11100 2950 50  0001 C CNN
	1    11100 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 68023193
P 10800 3400
F 0 "#PWR0127" H 10800 3150 50  0001 C CNN
F 1 "GND" H 10805 3227 50  0000 C CNN
F 2 "" H 10800 3400 50  0001 C CNN
F 3 "" H 10800 3400 50  0001 C CNN
	1    10800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 3250 10800 3250
Wire Wire Line
	10800 3250 10800 3400
Entry Wire Line
	4825 2125 4925 2225
Wire Wire Line
	4925 2225 5375 2225
Entry Wire Line
	4825 2225 4925 2325
Wire Wire Line
	4925 2325 5375 2325
Entry Wire Line
	4825 2325 4925 2425
Wire Wire Line
	4925 2425 5375 2425
Entry Wire Line
	4825 2625 4925 2725
Wire Wire Line
	4925 2725 5375 2725
Entry Wire Line
	4825 2525 4925 2625
Wire Wire Line
	4925 2625 5375 2625
Entry Wire Line
	4825 2425 4925 2525
Wire Wire Line
	4925 2525 5375 2525
Text Label 5050 2225 0    50   ~ 0
D2
Text Label 5050 2325 0    50   ~ 0
D3
Text Label 5050 2425 0    50   ~ 0
D4
Text Label 5050 2525 0    50   ~ 0
D5
Text Label 5050 2725 0    50   ~ 0
D7
Entry Wire Line
	4825 1925 4925 2025
Wire Wire Line
	4925 2025 5375 2025
Entry Wire Line
	4825 2025 4925 2125
Wire Wire Line
	4925 2125 5375 2125
Text Label 5050 2025 0    50   ~ 0
D0
Text Label 5050 2125 0    50   ~ 0
D1
Text Label 5150 2625 2    50   ~ 0
D6
$Comp
L power:GND #PWR0128
U 1 1 68042AAB
P 6625 10075
F 0 "#PWR0128" H 6625 9825 50  0001 C CNN
F 1 "GND" H 6630 9902 50  0000 C CNN
F 2 "" H 6625 10075 50  0001 C CNN
F 3 "" H 6625 10075 50  0001 C CNN
	1    6625 10075
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0129
U 1 1 68042E98
P 6625 9075
F 0 "#PWR0129" H 6625 8925 50  0001 C CNN
F 1 "+5P" V 6640 9203 50  0000 L CNN
F 2 "" H 6625 9075 50  0001 C CNN
F 3 "" H 6625 9075 50  0001 C CNN
	1    6625 9075
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 1 1 680436B9
P 3825 6950
F 0 "U1" H 3825 7275 50  0000 C CNN
F 1 "74LS00" H 3825 7184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3825 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3825 6950 50  0001 C CNN
	1    3825 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 6950 4125 6950
Wire Wire Line
	4650 6250 3425 6250
Wire Wire Line
	4650 6350 3425 6350
Wire Wire Line
	3425 6450 4650 6450
Wire Wire Line
	3525 7050 3525 6850
Wire Wire Line
	3425 6850 3525 6850
Wire Wire Line
	4650 6750 4450 6750
Wire Wire Line
	4450 6750 4450 6575
Wire Wire Line
	4450 6575 3425 6575
Wire Wire Line
	4650 6850 4350 6850
Wire Wire Line
	4350 6850 4350 6675
Wire Wire Line
	4350 6675 3425 6675
Entry Wire Line
	3325 6150 3425 6250
Entry Wire Line
	3325 6250 3425 6350
Entry Wire Line
	3325 6350 3425 6450
Entry Wire Line
	3325 6475 3425 6575
Entry Wire Line
	3325 6575 3425 6675
Entry Wire Line
	3325 6750 3425 6850
Text Label 3450 6850 0    50   ~ 0
A5
Text Label 3450 6675 0    50   ~ 0
A7
Text Label 3450 6575 0    50   ~ 0
A4
Text Label 3450 6450 0    50   ~ 0
A6
Text Label 3450 6350 0    50   ~ 0
A3
Text Label 3450 6250 0    50   ~ 0
A2
Wire Bus Line
	3325 5300 2775 5300
Wire Wire Line
	5650 6350 5950 6350
Wire Wire Line
	5950 6350 5950 5475
Wire Wire Line
	5950 5475 4425 5475
Wire Wire Line
	5275 2875 5275 2775
Wire Wire Line
	5275 2775 4425 2775
Wire Wire Line
	5275 2875 5375 2875
Wire Wire Line
	4425 2775 4425 5475
Wire Wire Line
	5375 2975 4925 2975
Wire Wire Line
	5375 3075 4925 3075
Wire Wire Line
	5375 3175 4925 3175
Wire Wire Line
	5375 3275 4925 3275
Wire Wire Line
	5375 3475 4925 3475
Wire Wire Line
	5375 3625 4925 3625
Wire Wire Line
	5375 1325 4925 1325
Wire Wire Line
	5375 3975 4925 3975
Wire Wire Line
	5375 4075 4925 4075
Entry Wire Line
	4825 3975 4925 4075
Entry Wire Line
	4825 3875 4925 3975
Entry Wire Line
	4825 1325 4925 1425
Entry Wire Line
	4825 1225 4925 1325
Entry Wire Line
	4825 3525 4925 3625
Entry Wire Line
	4825 3375 4925 3475
Entry Wire Line
	4825 3175 4925 3275
Entry Wire Line
	4825 3075 4925 3175
Entry Wire Line
	4825 2975 4925 3075
Entry Wire Line
	4825 2875 4925 2975
Text Label 5050 2975 0    50   ~ 0
~Reset
Wire Wire Line
	1450 4400 1650 4400
Wire Wire Line
	1450 4500 1650 4500
Entry Wire Line
	1650 4400 1750 4300
Entry Wire Line
	1650 4500 1750 4400
Text Label 1475 4400 0    50   ~ 0
~IEI
Text Label 1475 4500 0    50   ~ 0
~IEO
Wire Wire Line
	1450 4600 1650 4600
Entry Wire Line
	1650 4600 1750 4500
Text Label 1475 4600 0    50   ~ 0
~INT
Connection ~ 4825 675 
Wire Bus Line
	4825 675  12350 675 
Text Label 5050 3075 0    50   ~ 0
~M1
Text Label 5050 3175 0    50   ~ 0
~IORQ
Text Label 5050 3275 0    50   ~ 0
~RD
Text Label 5050 3475 0    50   ~ 0
CLK
Text Label 5050 3625 0    50   ~ 0
~INT
Text Label 5050 1325 0    50   ~ 0
~IEI
Text Label 5050 1425 0    50   ~ 0
~IEO
Text Label 5050 3975 0    50   ~ 0
A0
Text Label 5050 4075 0    50   ~ 0
A1
$Comp
L power:GND #PWR0130
U 1 1 681F328A
P 5875 4325
F 0 "#PWR0130" H 5875 4075 50  0001 C CNN
F 1 "GND" H 5880 4152 50  0000 C CNN
F 2 "" H 5875 4325 50  0001 C CNN
F 3 "" H 5875 4325 50  0001 C CNN
	1    5875 4325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 681F3792
P 5150 7250
F 0 "#PWR0131" H 5150 7000 50  0001 C CNN
F 1 "GND" H 5155 7077 50  0000 C CNN
F 2 "" H 5150 7250 50  0001 C CNN
F 3 "" H 5150 7250 50  0001 C CNN
	1    5150 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 681F3D20
P 5925 8800
F 0 "#PWR0132" H 5925 8550 50  0001 C CNN
F 1 "GND" H 5930 8627 50  0000 C CNN
F 2 "" H 5925 8800 50  0001 C CNN
F 3 "" H 5925 8800 50  0001 C CNN
	1    5925 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0133
U 1 1 681F415F
P 5150 5950
F 0 "#PWR0133" H 5150 5800 50  0001 C CNN
F 1 "+5P" V 5165 6078 50  0000 L CNN
F 2 "" H 5150 5950 50  0001 C CNN
F 3 "" H 5150 5950 50  0001 C CNN
	1    5150 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0134
U 1 1 681F4C0F
P 5925 7300
F 0 "#PWR0134" H 5925 7150 50  0001 C CNN
F 1 "+5P" V 5940 7428 50  0000 L CNN
F 2 "" H 5925 7300 50  0001 C CNN
F 3 "" H 5925 7300 50  0001 C CNN
	1    5925 7300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 3 1 681F5135
P 3025 8525
F 0 "U1" H 3025 8850 50  0000 C CNN
F 1 "74LS00" H 3025 8759 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3025 8525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3025 8525 50  0001 C CNN
	3    3025 8525
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 4 1 681F6694
P 1950 8525
F 0 "U1" H 1950 8850 50  0000 C CNN
F 1 "74LS00" H 1950 8759 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1950 8525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 1950 8525 50  0001 C CNN
	4    1950 8525
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 2 1 68219D20
P 3925 8525
F 0 "U1" H 3925 8850 50  0000 C CNN
F 1 "74LS00" H 3925 8759 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3925 8525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3925 8525 50  0001 C CNN
	2    3925 8525
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 6823C87A
P 2975 7950
F 0 "R2" V 3182 7950 50  0000 C CNN
F 1 "4K7" V 3091 7950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2905 7950 50  0001 C CNN
F 3 "~" H 2975 7950 50  0001 C CNN
	1    2975 7950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 8625 1475 8625
Wire Wire Line
	1200 8625 1200 7925
Wire Wire Line
	1200 7925 1475 7925
Wire Wire Line
	1650 8425 1475 8425
Wire Wire Line
	1475 8425 1475 8625
Connection ~ 1475 8625
Wire Wire Line
	1475 8625 1200 8625
Wire Wire Line
	1775 7925 2325 7925
Wire Wire Line
	2325 7925 2325 8525
Wire Wire Line
	2325 8525 2250 8525
Connection ~ 2325 8525
Wire Wire Line
	2625 8525 2625 8425
Wire Wire Line
	2625 7950 2825 7950
Wire Wire Line
	2725 8625 2625 8625
Wire Wire Line
	2625 8625 2625 8525
Connection ~ 2625 8525
Wire Wire Line
	2725 8425 2625 8425
Connection ~ 2625 8425
Wire Wire Line
	2625 8425 2625 7950
Wire Wire Line
	3125 7950 3425 7950
Wire Wire Line
	3425 7950 3425 8425
Wire Wire Line
	3425 8525 3325 8525
Wire Wire Line
	3425 8525 3425 8625
Wire Wire Line
	3425 8625 3625 8625
Connection ~ 3425 8525
Wire Wire Line
	3625 8425 3425 8425
Connection ~ 3425 8425
Wire Wire Line
	3425 8425 3425 8525
Wire Wire Line
	3425 7950 3425 7625
Wire Wire Line
	3425 7625 2525 7625
Connection ~ 3425 7950
Wire Wire Line
	1200 7925 1200 7625
Wire Wire Line
	1200 7625 2225 7625
Connection ~ 1200 7925
Wire Wire Line
	4225 8525 4900 8525
Wire Wire Line
	4900 8525 4900 8400
Wire Wire Line
	4900 8400 5425 8400
Wire Wire Line
	5425 8500 5400 8500
Wire Wire Line
	5400 8500 5400 8675
$Comp
L power:GND #PWR0135
U 1 1 683583C6
P 5400 8675
F 0 "#PWR0135" H 5400 8425 50  0001 C CNN
F 1 "GND" H 5405 8502 50  0000 C CNN
F 2 "" H 5400 8675 50  0001 C CNN
F 3 "" H 5400 8675 50  0001 C CNN
	1    5400 8675
	1    0    0    -1  
$EndComp
Wire Wire Line
	6425 7900 6625 7900
Wire Wire Line
	6625 7900 6625 3425
Wire Wire Line
	6625 2125 6375 2125
Wire Wire Line
	6375 2325 6625 2325
Connection ~ 6625 2325
Wire Wire Line
	6625 2325 6625 2125
Wire Wire Line
	6375 3225 6625 3225
Connection ~ 6625 3225
Wire Wire Line
	6625 3225 6625 2325
Wire Wire Line
	6375 3425 6625 3425
Connection ~ 6625 3425
Wire Wire Line
	6625 3425 6625 3225
$Comp
L Device:R R4
U 1 1 683AAEB2
P 6925 2025
F 0 "R4" V 7132 2025 50  0000 C CNN
F 1 "1K0" V 7041 2025 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6855 2025 50  0001 C CNN
F 3 "~" H 6925 2025 50  0001 C CNN
	1    6925 2025
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 683D4649
P 6925 2225
F 0 "R5" V 7132 2225 50  0000 C CNN
F 1 "1K0" V 7041 2225 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6855 2225 50  0001 C CNN
F 3 "~" H 6925 2225 50  0001 C CNN
	1    6925 2225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6375 2225 6775 2225
Wire Wire Line
	6375 2025 6775 2025
Wire Wire Line
	8150 4900 7625 4900
Wire Wire Line
	7625 4900 7625 2025
Wire Wire Line
	7625 2025 7075 2025
Wire Wire Line
	8150 5000 7600 5000
Wire Wire Line
	7600 5000 7600 2225
Wire Wire Line
	7600 2225 7075 2225
$Comp
L Device:D D1
U 1 1 6843FB70
P 10125 1800
F 0 "D1" V 10171 1720 50  0000 R CNN
F 1 "1N5819" V 10080 1720 50  0000 R CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 10125 1800 50  0001 C CNN
F 3 "~" H 10125 1800 50  0001 C CNN
	1    10125 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 3900 10125 3900
Wire Wire Line
	10125 3900 10125 1950
Wire Wire Line
	4925 1425 5375 1425
Wire Wire Line
	5375 1425 5375 1325
$Comp
L Device:R R3
U 1 1 684B2A57
P 5225 3725
F 0 "R3" V 5432 3725 50  0000 C CNN
F 1 "10K" V 5341 3725 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5155 3725 50  0001 C CNN
F 3 "~" H 5225 3725 50  0001 C CNN
	1    5225 3725
	0    -1   -1   0   
$EndComp
$Comp
L power:+5P #PWR0136
U 1 1 684B2F39
P 10125 1650
F 0 "#PWR0136" H 10125 1500 50  0001 C CNN
F 1 "+5P" V 10140 1778 50  0000 L CNN
F 2 "" H 10125 1650 50  0001 C CNN
F 3 "" H 10125 1650 50  0001 C CNN
	1    10125 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0137
U 1 1 684B3B7C
P 5875 1775
F 0 "#PWR0137" H 5875 1625 50  0001 C CNN
F 1 "+5P" V 5890 1903 50  0000 L CNN
F 2 "" H 5875 1775 50  0001 C CNN
F 3 "" H 5875 1775 50  0001 C CNN
	1    5875 1775
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0138
U 1 1 684B41D6
P 5075 3725
F 0 "#PWR0138" H 5075 3575 50  0001 C CNN
F 1 "+5P" V 5090 3853 50  0000 L CNN
F 2 "" H 5075 3725 50  0001 C CNN
F 3 "" H 5075 3725 50  0001 C CNN
	1    5075 3725
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 4300 10225 4300
Wire Wire Line
	10225 4300 10225 3150
Wire Wire Line
	10225 3150 10900 3150
Wire Wire Line
	7650 5500 7650 800 
Wire Wire Line
	7650 800  10375 800 
Wire Wire Line
	10375 800  10375 2750
Wire Wire Line
	10375 2750 10900 2750
Wire Wire Line
	7650 5500 8150 5500
Wire Wire Line
	10900 2850 10350 2850
Wire Wire Line
	10350 2850 10350 825 
Wire Wire Line
	10350 825  7675 825 
Wire Wire Line
	7675 825  7675 5200
Wire Wire Line
	7675 5200 8150 5200
Wire Wire Line
	10325 2950 10325 850 
Wire Wire Line
	10325 850  7700 850 
Wire Wire Line
	7700 850  7700 5300
Wire Wire Line
	7700 5300 8150 5300
Wire Wire Line
	8150 5400 7725 5400
Wire Wire Line
	7725 5400 7725 875 
Wire Wire Line
	7725 875  10300 875 
Wire Wire Line
	10300 875  10300 3050
Wire Wire Line
	10300 3050 10900 3050
Wire Wire Line
	10325 2950 10900 2950
Wire Wire Line
	8550 1500 8550 1325
Wire Wire Line
	8550 1325 8000 1325
$Comp
L power:GND #PWR0139
U 1 1 685649C8
P 8000 6650
F 0 "#PWR0139" H 8000 6400 50  0001 C CNN
F 1 "GND" H 8005 6477 50  0000 C CNN
F 2 "" H 8000 6650 50  0001 C CNN
F 3 "" H 8000 6650 50  0001 C CNN
	1    8000 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5600 8000 5600
Connection ~ 8000 5600
Wire Wire Line
	8000 5600 8000 6650
Wire Wire Line
	8150 5100 8000 5100
Connection ~ 8000 5100
Wire Wire Line
	8000 5100 8000 5600
Wire Wire Line
	8150 4600 8000 4600
Connection ~ 8000 4600
Wire Wire Line
	8000 4600 8000 5100
Wire Wire Line
	8150 4100 8000 4100
Wire Wire Line
	8000 1325 8000 4100
Connection ~ 8000 4100
Wire Wire Line
	8000 4100 8000 4600
$Comp
L power:GND #PWR0140
U 1 1 685CF63D
P 8850 6500
F 0 "#PWR0140" H 8850 6250 50  0001 C CNN
F 1 "GND" H 8855 6327 50  0000 C CNN
F 2 "" H 8850 6500 50  0001 C CNN
F 3 "" H 8850 6500 50  0001 C CNN
	1    8850 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 685CFB36
P 9750 6175
F 0 "#PWR0141" H 9750 5925 50  0001 C CNN
F 1 "GND" H 9755 6002 50  0000 C CNN
F 2 "" H 9750 6175 50  0001 C CNN
F 3 "" H 9750 6175 50  0001 C CNN
	1    9750 6175
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 4100 9550 4100
Wire Wire Line
	9550 4600 9750 4600
Connection ~ 9750 4600
Wire Wire Line
	9750 4600 9750 4100
Wire Wire Line
	9550 5100 9750 5100
Connection ~ 9750 5100
Wire Wire Line
	9750 5100 9750 4600
Wire Wire Line
	9550 5600 9750 5600
Wire Wire Line
	9750 5100 9750 5600
Connection ~ 9750 5600
Wire Wire Line
	9750 5600 9750 6175
Wire Wire Line
	9550 4900 10850 4900
$Comp
L Switch:SW_Push SW1
U 1 1 6865BFEB
P 10850 5100
F 0 "SW1" V 10804 5248 50  0000 L CNN
F 1 "SW_Push" V 10895 5248 50  0000 L CNN
F 2 "Button_Switch_THT:SW_Tactile_SKHH_Angled" H 10850 5300 50  0001 C CNN
F 3 "~" H 10850 5300 50  0001 C CNN
	1    10850 5100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 6865D987
P 10850 5300
F 0 "#PWR0142" H 10850 5050 50  0001 C CNN
F 1 "GND" H 10855 5127 50  0000 C CNN
F 2 "" H 10850 5300 50  0001 C CNN
F 3 "" H 10850 5300 50  0001 C CNN
	1    10850 5300
	1    0    0    -1  
$EndComp
$Comp
L felge1966:FT232RL U5
U 1 1 6865E338
P 9625 8075
F 0 "U5" H 9647 7626 50  0000 R CNN
F 1 "FT232RL" H 9647 7535 50  0000 R CNN
F 2 "footprint:FT232R" H 9625 8075 50  0001 C CNN
F 3 "" H 9625 8075 50  0001 C CNN
	1    9625 8075
	-1   0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0143
U 1 1 68660DB9
P 8850 8050
F 0 "#PWR0143" H 8850 7900 50  0001 C CNN
F 1 "+5P" V 8865 8178 50  0000 L CNN
F 2 "" H 8850 8050 50  0001 C CNN
F 3 "" H 8850 8050 50  0001 C CNN
	1    8850 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 686612E1
P 8850 9000
F 0 "#PWR0144" H 8850 8750 50  0001 C CNN
F 1 "GND" H 8855 8827 50  0000 C CNN
F 2 "" H 8850 9000 50  0001 C CNN
F 3 "" H 8850 9000 50  0001 C CNN
	1    8850 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9175 8875 8850 8875
Wire Wire Line
	8850 8875 8850 9000
Wire Wire Line
	8850 8275 8850 8050
Wire Wire Line
	8850 8275 9175 8275
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 686B8FE1
P 7650 8475
F 0 "J1" H 7700 8792 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 7700 8701 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7650 8475 50  0001 C CNN
F 3 "~" H 7650 8475 50  0001 C CNN
	1    7650 8475
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 8375 8175 8375
Wire Wire Line
	8175 8375 8175 8850
Wire Wire Line
	8175 8850 7400 8850
Wire Wire Line
	7400 8850 7400 8575
Wire Wire Line
	7400 8575 7450 8575
Connection ~ 8175 8375
Wire Wire Line
	8175 8375 9175 8375
Wire Wire Line
	9175 8475 8700 8475
Wire Wire Line
	8700 8475 8700 8575
Wire Wire Line
	8700 8575 7950 8575
Wire Wire Line
	7450 8375 7400 8375
Wire Wire Line
	7400 8375 7400 8200
Wire Wire Line
	7400 8200 8700 8200
Wire Wire Line
	8700 8200 8700 8475
Connection ~ 8700 8475
Wire Wire Line
	7950 8475 8075 8475
Wire Wire Line
	8075 8475 8075 8000
Wire Wire Line
	8075 8000 7425 8000
Wire Wire Line
	7425 8000 7425 3125
Wire Wire Line
	7425 3125 6375 3125
Wire Wire Line
	6375 3325 7400 3325
Wire Wire Line
	7400 3325 7400 8000
Wire Wire Line
	7400 8000 7225 8000
Wire Wire Line
	7225 8475 7450 8475
Wire Wire Line
	7225 8000 7225 8475
$Comp
L Device:C C6
U 1 1 67EF8943
P 2075 9425
F 0 "C6" V 1823 9425 50  0000 C CNN
F 1 "100nF" V 1914 9425 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2113 9275 50  0001 C CNN
F 3 "~" H 2075 9425 50  0001 C CNN
	1    2075 9425
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0145
U 1 1 67EF9345
P 2075 9275
F 0 "#PWR0145" H 2075 9125 50  0001 C CNN
F 1 "+5P" V 2090 9403 50  0000 L CNN
F 2 "" H 2075 9275 50  0001 C CNN
F 3 "" H 2075 9275 50  0001 C CNN
	1    2075 9275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 67EF934F
P 2075 9575
F 0 "#PWR0146" H 2075 9325 50  0001 C CNN
F 1 "GND" H 2080 9402 50  0000 C CNN
F 2 "" H 2075 9575 50  0001 C CNN
F 3 "" H 2075 9575 50  0001 C CNN
	1    2075 9575
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 67EF9359
P 2575 9425
F 0 "C7" V 2323 9425 50  0000 C CNN
F 1 "100nF" V 2414 9425 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2613 9275 50  0001 C CNN
F 3 "~" H 2575 9425 50  0001 C CNN
	1    2575 9425
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0147
U 1 1 67EF9363
P 2575 9275
F 0 "#PWR0147" H 2575 9125 50  0001 C CNN
F 1 "+5P" V 2590 9403 50  0000 L CNN
F 2 "" H 2575 9275 50  0001 C CNN
F 3 "" H 2575 9275 50  0001 C CNN
	1    2575 9275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 67EF936D
P 2575 9575
F 0 "#PWR0148" H 2575 9325 50  0001 C CNN
F 1 "GND" H 2580 9402 50  0000 C CNN
F 2 "" H 2575 9575 50  0001 C CNN
F 3 "" H 2575 9575 50  0001 C CNN
	1    2575 9575
	1    0    0    -1  
$EndComp
Wire Bus Line
	14450 1375 14450 2400
Wire Bus Line
	12600 6100 12600 7225
Wire Bus Line
	3325 5300 3325 6750
Wire Bus Line
	12350 1375 12350 6100
Wire Bus Line
	1750 2550 1750 4500
Wire Bus Line
	10700 6100 10700 8325
Wire Bus Line
	14975 6100 14975 8125
Wire Bus Line
	12875 6100 12875 8425
Wire Bus Line
	2775 2550 2775 5300
Wire Bus Line
	4825 675  4825 3975
$EndSCHEMATC
