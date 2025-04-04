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
L power:+5P #PWR04
U 1 1 6251C8D1
P 1575 5500
F 0 "#PWR04" H 1575 5350 50  0001 C CNN
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
L power:GND #PWR05
U 1 1 6251CEE4
P 1725 6200
F 0 "#PWR05" H 1725 5950 50  0001 C CNN
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
DB0
Text Label 2450 2900 0    50   ~ 0
DB1
Text Label 2450 3000 0    50   ~ 0
DB2
Text Label 2450 3100 0    50   ~ 0
DB3
Text Label 2450 3200 0    50   ~ 0
DB4
Text Label 2450 3300 0    50   ~ 0
DB5
Text Label 2450 3400 0    50   ~ 0
DB6
Text Label 2450 3500 0    50   ~ 0
DB7
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
L power:+12P #PWR03
U 1 1 627F0A12
P 1550 5300
F 0 "#PWR03" H 1550 5150 50  0001 C CNN
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
L Device:C C2
U 1 1 62485604
P 1775 10000
F 0 "C2" V 1523 10000 50  0000 C CNN
F 1 "100nF" V 1614 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 1813 9850 50  0001 C CNN
F 3 "~" H 1775 10000 50  0001 C CNN
	1    1775 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR015
U 1 1 624866F0
P 1775 9850
F 0 "#PWR015" H 1775 9700 50  0001 C CNN
F 1 "+5P" V 1790 9978 50  0000 L CNN
F 2 "" H 1775 9850 50  0001 C CNN
F 3 "" H 1775 9850 50  0001 C CNN
	1    1775 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 62486A85
P 1775 10150
F 0 "#PWR016" H 1775 9900 50  0001 C CNN
F 1 "GND" H 1780 9977 50  0000 C CNN
F 2 "" H 1775 10150 50  0001 C CNN
F 3 "" H 1775 10150 50  0001 C CNN
	1    1775 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 62488D7D
P 2275 10000
F 0 "C3" V 2023 10000 50  0000 C CNN
F 1 "100nF" V 2114 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2313 9850 50  0001 C CNN
F 3 "~" H 2275 10000 50  0001 C CNN
	1    2275 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR017
U 1 1 62488D83
P 2275 9850
F 0 "#PWR017" H 2275 9700 50  0001 C CNN
F 1 "+5P" V 2290 9978 50  0000 L CNN
F 2 "" H 2275 9850 50  0001 C CNN
F 3 "" H 2275 9850 50  0001 C CNN
	1    2275 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 62488D89
P 2275 10150
F 0 "#PWR018" H 2275 9900 50  0001 C CNN
F 1 "GND" H 2280 9977 50  0000 C CNN
F 2 "" H 2275 10150 50  0001 C CNN
F 3 "" H 2275 10150 50  0001 C CNN
	1    2275 10150
	1    0    0    -1  
$EndComp
$Comp
L K1520:K1520_2x29-AC X1
U 1 1 6224A042
P 1750 4600
F 0 "X1" H 1865 6625 50  0000 C CNN
F 1 "K1520_2x29-AC" H 1865 6534 50  0000 C CNN
F 2 "K1520:K1520_EFS2x29_DIN_male" H 1750 4650 50  0001 C CNN
F 3 "Anschluß nach: http://www.robotrontechnik.de/index.htm?/html/standards/k1520.htm" H 1750 4650 50  0001 C CNN
	1    1750 4600
	-1   0    0    -1  
$EndComp
Entry Wire Line
	10275 3650 10375 3750
Wire Wire Line
	10375 3750 10825 3750
Entry Wire Line
	10275 3550 10375 3650
Wire Wire Line
	10375 3650 10825 3650
Text Label 10475 3650 0    50   ~ 0
~IORQ
Text Label 10500 3750 0    50   ~ 0
~RD
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
$Comp
L power:GND #PWR012
U 1 1 65652847
P 11325 4650
F 0 "#PWR012" H 11325 4400 50  0001 C CNN
F 1 "GND" H 11330 4477 50  0000 C CNN
F 2 "" H 11325 4650 50  0001 C CNN
F 3 "" H 11325 4650 50  0001 C CNN
	1    11325 4650
	1    0    0    -1  
$EndComp
Entry Wire Line
	10275 3150 10375 3250
Wire Wire Line
	10375 3250 10825 3250
Entry Wire Line
	10275 3050 10375 3150
Wire Wire Line
	10375 3150 10825 3150
Text Label 10500 3250 0    50   ~ 0
A0
Text Label 10500 3150 0    50   ~ 0
A1
Wire Wire Line
	1450 6300 1450 6400
Wire Wire Line
	1450 6600 1450 6500
$Comp
L power:-5V #PWR01
U 1 1 65619C28
P 1450 6400
F 0 "#PWR01" H 1450 6500 50  0001 C CNN
F 1 "-5V" V 1465 6528 50  0000 L CNN
F 2 "" H 1450 6400 50  0001 C CNN
F 3 "" H 1450 6400 50  0001 C CNN
	1    1450 6400
	0    1    1    0   
$EndComp
Connection ~ 1450 6400
$Comp
L power:-12V #PWR02
U 1 1 6561A936
P 1450 6600
F 0 "#PWR02" H 1450 6700 50  0001 C CNN
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
P 1275 9975
F 0 "C1" H 1393 10021 50  0000 L CNN
F 1 "500u" H 1393 9930 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 1313 9825 50  0001 C CNN
F 3 "~" H 1275 9975 50  0001 C CNN
	1    1275 9975
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR09
U 1 1 655FF1A8
P 1275 9825
F 0 "#PWR09" H 1275 9675 50  0001 C CNN
F 1 "+5P" V 1290 9953 50  0000 L CNN
F 2 "" H 1275 9825 50  0001 C CNN
F 3 "" H 1275 9825 50  0001 C CNN
	1    1275 9825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 655FF404
P 1275 10125
F 0 "#PWR010" H 1275 9875 50  0001 C CNN
F 1 "GND" H 1280 9952 50  0000 C CNN
F 2 "" H 1275 10125 50  0001 C CNN
F 3 "" H 1275 10125 50  0001 C CNN
	1    1275 10125
	1    0    0    -1  
$EndComp
Entry Wire Line
	10275 2350 10375 2450
Wire Wire Line
	10375 2450 10825 2450
Entry Wire Line
	10275 2450 10375 2550
Wire Wire Line
	10375 2550 10825 2550
Entry Wire Line
	10275 2550 10375 2650
Wire Wire Line
	10375 2650 10825 2650
Entry Wire Line
	10275 2850 10375 2950
Wire Wire Line
	10375 2950 10825 2950
Entry Wire Line
	10275 2750 10375 2850
Wire Wire Line
	10375 2850 10825 2850
Entry Wire Line
	10275 2650 10375 2750
Wire Wire Line
	10375 2750 10825 2750
Text Label 10500 2450 0    50   ~ 0
D2
Text Label 10500 2550 0    50   ~ 0
D3
Text Label 10500 2650 0    50   ~ 0
D4
Text Label 10500 2750 0    50   ~ 0
D5
Text Label 10500 2950 0    50   ~ 0
D7
Entry Wire Line
	10275 2150 10375 2250
Wire Wire Line
	10375 2250 10825 2250
Entry Wire Line
	10275 2250 10375 2350
Wire Wire Line
	10375 2350 10825 2350
Text Label 10500 2250 0    50   ~ 0
D0
Text Label 10500 2350 0    50   ~ 0
D1
Text Label 10600 2850 2    50   ~ 0
D6
$Comp
L Device:C C4
U 1 1 6563C3B4
P 2850 10000
F 0 "C4" V 2598 10000 50  0000 C CNN
F 1 "100nF" V 2689 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2888 9850 50  0001 C CNN
F 3 "~" H 2850 10000 50  0001 C CNN
	1    2850 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR019
U 1 1 6563C3BA
P 2850 9850
F 0 "#PWR019" H 2850 9700 50  0001 C CNN
F 1 "+5P" V 2865 9978 50  0000 L CNN
F 2 "" H 2850 9850 50  0001 C CNN
F 3 "" H 2850 9850 50  0001 C CNN
	1    2850 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 6563C3C0
P 2850 10150
F 0 "#PWR020" H 2850 9900 50  0001 C CNN
F 1 "GND" H 2855 9977 50  0000 C CNN
F 2 "" H 2850 10150 50  0001 C CNN
F 3 "" H 2850 10150 50  0001 C CNN
	1    2850 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 6563C3C6
P 3350 10000
F 0 "C5" V 3098 10000 50  0000 C CNN
F 1 "100nF" V 3189 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 3388 9850 50  0001 C CNN
F 3 "~" H 3350 10000 50  0001 C CNN
	1    3350 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR021
U 1 1 6563C3CC
P 3350 9850
F 0 "#PWR021" H 3350 9700 50  0001 C CNN
F 1 "+5P" V 3365 9978 50  0000 L CNN
F 2 "" H 3350 9850 50  0001 C CNN
F 3 "" H 3350 9850 50  0001 C CNN
	1    3350 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6563C3D2
P 3350 10150
F 0 "#PWR022" H 3350 9900 50  0001 C CNN
F 1 "GND" H 3355 9977 50  0000 C CNN
F 2 "" H 3350 10150 50  0001 C CNN
F 3 "" H 3350 10150 50  0001 C CNN
	1    3350 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C6
U 1 1 6565AA92
P 3800 10000
F 0 "C6" H 3918 10046 50  0000 L CNN
F 1 "4u7" H 3918 9955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3838 9850 50  0001 C CNN
F 3 "~" H 3800 10000 50  0001 C CNN
	1    3800 10000
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR023
U 1 1 6565AEA6
P 3800 9850
F 0 "#PWR023" H 3800 9700 50  0001 C CNN
F 1 "+5P" V 3815 9978 50  0000 L CNN
F 2 "" H 3800 9850 50  0001 C CNN
F 3 "" H 3800 9850 50  0001 C CNN
	1    3800 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 6565AEB0
P 3800 10150
F 0 "#PWR024" H 3800 9900 50  0001 C CNN
F 1 "GND" H 3805 9977 50  0000 C CNN
F 2 "" H 3800 10150 50  0001 C CNN
F 3 "" H 3800 10150 50  0001 C CNN
	1    3800 10150
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DS8286D U1
U 1 1 67CFEA2E
P 4975 2000
F 0 "U1" H 4975 2567 50  0000 C CNN
F 1 "DS8286D" H 4975 2476 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 5075 1800 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/ds8286.gif" H 5075 1800 50  0001 C CNN
	1    4975 2000
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:DS8286D U1
U 2 1 67CFF0F0
P 8600 9900
F 0 "U1" H 8688 9946 50  0000 L CNN
F 1 "DS8286D" H 8688 9855 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8700 9700 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/ds8286.gif" H 8700 9700 50  0001 C CNN
	2    8600 9900
	1    0    0    -1  
$EndComp
$Comp
L Zilog_Z80_Peripherals:PIO-DIP-40 U2
U 1 1 67D0130E
P 10925 2150
F 0 "U2" H 11325 2431 50  0000 C CNN
F 1 "PIO-DIP-40" H 11325 2340 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 11325 -450 50  0001 C CNN
F 3 "https://www.zilog.com/appnotes_download.php?FromPage=DirectLink&dn=PS0180&ft=Product%20Specification%20(Data%20Sheet)%20%20&f=YUhSMGNEb3ZMM2QzZHk1NmFXeHZaeTVqYjIwdlpHOWpjeTk2T0RBdmNITXdNVGd3TG5Ca1pnPT0=" H 10875 550 50  0001 C CNN
	1    10925 2150
	1    0    0    -1  
$EndComp
Entry Wire Line
	4250 1650 4150 1750
Entry Wire Line
	4250 1750 4150 1850
Entry Wire Line
	4250 1850 4150 1950
Entry Wire Line
	4250 1950 4150 2050
Entry Wire Line
	4250 2050 4150 2150
Entry Wire Line
	4250 2150 4150 2250
Entry Wire Line
	4250 2250 4150 2350
Entry Wire Line
	4250 2350 4150 2450
Wire Wire Line
	4625 2350 4250 2350
Wire Wire Line
	4625 2250 4250 2250
Wire Wire Line
	4625 2150 4250 2150
Wire Wire Line
	4625 2050 4250 2050
Wire Wire Line
	4625 1950 4250 1950
Wire Wire Line
	4625 1850 4250 1850
Wire Wire Line
	4625 1750 4250 1750
Wire Wire Line
	4625 1650 4250 1650
Text Label 4475 1650 2    50   ~ 0
DB0
Text Label 4475 1750 2    50   ~ 0
DB1
Text Label 4475 1850 2    50   ~ 0
DB2
Text Label 4475 1950 2    50   ~ 0
DB3
Text Label 4475 2050 2    50   ~ 0
DB4
Text Label 4475 2150 2    50   ~ 0
DB5
Text Label 4475 2250 2    50   ~ 0
DB6
Text Label 4475 2350 2    50   ~ 0
DB7
Entry Wire Line
	5875 1750 5775 1850
Wire Wire Line
	5775 1850 5325 1850
Entry Wire Line
	5875 1850 5775 1950
Wire Wire Line
	5775 1950 5325 1950
Entry Wire Line
	5875 1950 5775 2050
Wire Wire Line
	5775 2050 5325 2050
Entry Wire Line
	5875 2250 5775 2350
Wire Wire Line
	5775 2350 5325 2350
Entry Wire Line
	5875 2150 5775 2250
Wire Wire Line
	5775 2250 5325 2250
Entry Wire Line
	5875 2050 5775 2150
Wire Wire Line
	5775 2150 5325 2150
Text Label 5650 1850 2    50   ~ 0
D2
Text Label 5650 1950 2    50   ~ 0
D3
Text Label 5650 2050 2    50   ~ 0
D4
Text Label 5650 2150 2    50   ~ 0
D5
Text Label 5650 2350 2    50   ~ 0
D7
Entry Wire Line
	5875 1550 5775 1650
Wire Wire Line
	5775 1650 5325 1650
Entry Wire Line
	5875 1650 5775 1750
Wire Wire Line
	5775 1750 5325 1750
Text Label 5650 1650 2    50   ~ 0
D0
Text Label 5650 1750 2    50   ~ 0
D1
Text Label 5550 2250 0    50   ~ 0
D6
$Comp
L power:+5P #PWR011
U 1 1 6565252D
P 11325 2050
F 0 "#PWR011" H 11325 1900 50  0001 C CNN
F 1 "+5P" V 11340 2178 50  0000 L CNN
F 2 "" H 11325 2050 50  0001 C CNN
F 3 "" H 11325 2050 50  0001 C CNN
	1    11325 2050
	1    0    0    -1  
$EndComp
Entry Wire Line
	10275 7050 10375 7150
Wire Wire Line
	10375 7150 10825 7150
Text Label 10475 7150 0    50   ~ 0
~IORQ
$Comp
L power:GND #PWR014
U 1 1 67E8C508
P 11325 8150
F 0 "#PWR014" H 11325 7900 50  0001 C CNN
F 1 "GND" H 11330 7977 50  0000 C CNN
F 2 "" H 11325 8150 50  0001 C CNN
F 3 "" H 11325 8150 50  0001 C CNN
	1    11325 8150
	1    0    0    -1  
$EndComp
Entry Wire Line
	10275 6650 10375 6750
Wire Wire Line
	10375 6750 10825 6750
Entry Wire Line
	10275 6550 10375 6650
Wire Wire Line
	10375 6650 10825 6650
Text Label 10500 6750 0    50   ~ 0
A0
Text Label 10500 6650 0    50   ~ 0
A1
Entry Wire Line
	10275 5850 10375 5950
Wire Wire Line
	10375 5950 10825 5950
Entry Wire Line
	10275 5950 10375 6050
Wire Wire Line
	10375 6050 10825 6050
Entry Wire Line
	10275 6050 10375 6150
Wire Wire Line
	10375 6150 10825 6150
Entry Wire Line
	10275 6350 10375 6450
Wire Wire Line
	10375 6450 10825 6450
Entry Wire Line
	10275 6250 10375 6350
Wire Wire Line
	10375 6350 10825 6350
Entry Wire Line
	10275 6150 10375 6250
Wire Wire Line
	10375 6250 10825 6250
Text Label 10500 5950 0    50   ~ 0
D2
Text Label 10500 6050 0    50   ~ 0
D3
Text Label 10500 6150 0    50   ~ 0
D4
Text Label 10500 6250 0    50   ~ 0
D5
Text Label 10500 6450 0    50   ~ 0
D7
Entry Wire Line
	10275 5650 10375 5750
Wire Wire Line
	10375 5750 10825 5750
Entry Wire Line
	10275 5750 10375 5850
Wire Wire Line
	10375 5850 10825 5850
Text Label 10500 5750 0    50   ~ 0
D0
Text Label 10500 5850 0    50   ~ 0
D1
Text Label 10600 6350 2    50   ~ 0
D6
$Comp
L Zilog_Z80_Peripherals:PIO-DIP-40 U3
U 1 1 67E8C530
P 10925 5650
F 0 "U3" H 11325 5931 50  0000 C CNN
F 1 "PIO-DIP-40" H 11325 5840 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 11325 3050 50  0001 C CNN
F 3 "https://www.zilog.com/appnotes_download.php?FromPage=DirectLink&dn=PS0180&ft=Product%20Specification%20(Data%20Sheet)%20%20&f=YUhSMGNEb3ZMM2QzZHk1NmFXeHZaeTVqYjIwdlpHOWpjeTk2T0RBdmNITXdNVGd3TG5Ca1pnPT0=" H 10875 4050 50  0001 C CNN
	1    10925 5650
	1    0    0    -1  
$EndComp
Wire Bus Line
	5875 650  4150 650 
Connection ~ 5875 650 
Wire Bus Line
	2775 2550 4150 2550
Connection ~ 2775 2550
Wire Wire Line
	10250 4450 10250 7750
Wire Wire Line
	10250 4450 10825 4450
Wire Wire Line
	10825 7650 10375 7650
Wire Wire Line
	10825 7450 10375 7450
Entry Wire Line
	10275 7150 10375 7250
Wire Wire Line
	10375 7250 10825 7250
Text Label 10500 7250 0    50   ~ 0
~RD
Wire Wire Line
	10825 3450 10375 3450
Wire Wire Line
	10825 3550 10375 3550
Wire Wire Line
	10825 3950 10375 3950
Wire Wire Line
	10825 4150 10375 4150
Wire Wire Line
	10825 4350 10375 4350
$Comp
L Connector:DB37_Female J1
U 1 1 67EF7EFE
P 15050 6200
F 0 "J1" H 15230 6234 50  0000 L CNN
F 1 "DB37_Female" H 15230 6143 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-37_Female_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 15050 6200 50  0001 C CNN
F 3 " ~" H 15050 6200 50  0001 C CNN
	1    15050 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	11825 3450 13400 3450
Wire Wire Line
	13400 3450 13400 4400
Wire Wire Line
	13400 4400 14750 4400
Wire Wire Line
	11825 3550 13375 3550
Wire Wire Line
	13375 3550 13375 4600
Wire Wire Line
	13375 4600 14750 4600
Wire Wire Line
	11825 3650 13350 3650
Wire Wire Line
	13350 3650 13350 4800
Wire Wire Line
	13350 4800 14750 4800
Wire Wire Line
	11825 3750 13325 3750
Wire Wire Line
	13325 3750 13325 5000
Wire Wire Line
	13325 5000 14750 5000
Wire Wire Line
	11825 3850 13300 3850
Wire Wire Line
	13300 3850 13300 5200
Wire Wire Line
	13300 5200 14750 5200
Wire Wire Line
	11825 3950 13275 3950
Wire Wire Line
	13275 3950 13275 5400
Wire Wire Line
	13275 5400 14750 5400
Wire Wire Line
	11825 4050 13250 4050
Wire Wire Line
	13250 4050 13250 5600
Wire Wire Line
	13250 5600 14750 5600
Wire Wire Line
	11825 4150 13225 4150
Wire Wire Line
	13225 4150 13225 5800
Wire Wire Line
	13225 5800 14750 5800
Wire Wire Line
	11825 4350 13200 4350
Wire Wire Line
	13200 4350 13200 6000
Wire Wire Line
	13200 6000 14750 6000
Wire Wire Line
	11825 4450 13175 4450
Wire Wire Line
	13175 4450 13175 6200
Wire Wire Line
	13175 6200 14750 6200
Wire Wire Line
	11825 5750 13150 5750
Wire Wire Line
	13150 5750 13150 6400
Wire Wire Line
	13150 6400 14750 6400
Wire Wire Line
	11825 5850 13125 5850
Wire Wire Line
	13125 5850 13125 6600
Wire Wire Line
	13125 6600 14750 6600
Wire Wire Line
	11825 5950 13100 5950
Wire Wire Line
	13100 5950 13100 6800
Wire Wire Line
	13100 6800 14750 6800
Wire Wire Line
	11825 6050 13075 6050
Wire Wire Line
	13075 6050 13075 7000
Wire Wire Line
	13075 7000 14750 7000
Wire Wire Line
	11825 6150 13050 6150
Wire Wire Line
	13050 6150 13050 7200
Wire Wire Line
	13050 7200 14750 7200
Wire Wire Line
	11825 6250 13025 6250
Wire Wire Line
	13025 6250 13025 7400
Wire Wire Line
	13025 7400 14750 7400
Wire Wire Line
	11825 6350 13000 6350
Wire Wire Line
	13000 6350 13000 7600
Wire Wire Line
	13000 7600 14750 7600
Wire Wire Line
	11825 6450 12975 6450
Wire Wire Line
	12975 6450 12975 7800
Wire Wire Line
	12975 7800 14750 7800
Wire Wire Line
	11825 6650 12950 6650
Wire Wire Line
	12950 6650 12950 8000
Wire Wire Line
	12950 8000 14750 8000
Wire Wire Line
	11825 6750 13400 6750
Wire Wire Line
	13400 6750 13400 4500
Wire Wire Line
	13400 4500 14750 4500
Wire Wire Line
	11825 6950 13425 6950
Wire Wire Line
	13425 6950 13425 4700
Wire Wire Line
	13425 4700 14750 4700
Wire Wire Line
	14750 4900 13450 4900
Wire Wire Line
	13450 4900 13450 7050
Wire Wire Line
	13450 7050 11825 7050
Wire Wire Line
	11825 7150 13475 7150
Wire Wire Line
	13475 7150 13475 5100
Wire Wire Line
	13475 5100 14750 5100
Wire Wire Line
	11825 7250 13500 7250
Wire Wire Line
	13500 7250 13500 5300
Wire Wire Line
	13500 5300 14750 5300
Wire Wire Line
	11825 7350 13525 7350
Wire Wire Line
	13525 7350 13525 5500
Wire Wire Line
	13525 5500 14750 5500
Wire Wire Line
	11825 7450 13550 7450
Wire Wire Line
	13550 7450 13550 5700
Wire Wire Line
	13550 5700 14750 5700
Wire Wire Line
	11825 7550 13575 7550
Wire Wire Line
	13575 7550 13575 5900
Wire Wire Line
	13575 5900 14750 5900
Wire Wire Line
	11825 7650 13600 7650
Wire Wire Line
	13600 7650 13600 6100
Wire Wire Line
	13600 6100 14750 6100
Wire Wire Line
	11825 7850 13625 7850
Wire Wire Line
	13625 7850 13625 6300
Wire Wire Line
	13625 6300 14750 6300
Wire Wire Line
	11825 7950 13650 7950
Wire Wire Line
	13650 7950 13650 6500
Wire Wire Line
	13650 6500 14750 6500
Wire Wire Line
	14750 6700 13675 6700
Wire Wire Line
	13675 6700 13675 2850
Wire Wire Line
	13675 2850 11825 2850
Wire Wire Line
	11825 2950 13700 2950
Wire Wire Line
	13700 2950 13700 6900
Wire Wire Line
	13700 6900 14750 6900
Wire Wire Line
	14750 7100 14375 7100
$Comp
L power:GND #PWR025
U 1 1 6804A230
P 14375 8425
F 0 "#PWR025" H 14375 8175 50  0001 C CNN
F 1 "GND" H 14380 8252 50  0000 C CNN
F 2 "" H 14375 8425 50  0001 C CNN
F 3 "" H 14375 8425 50  0001 C CNN
	1    14375 8425
	1    0    0    -1  
$EndComp
Wire Wire Line
	14750 7700 14375 7700
Connection ~ 14375 7700
Wire Wire Line
	14375 7700 14375 8425
Wire Wire Line
	14750 7500 14375 7500
Connection ~ 14375 7500
Wire Wire Line
	14375 7500 14375 7700
Wire Wire Line
	14750 7300 14375 7300
Wire Wire Line
	14375 7100 14375 7300
Connection ~ 14375 7300
Wire Wire Line
	14375 7300 14375 7500
$Comp
L power:+5P #PWR013
U 1 1 67E8C53A
P 11325 5550
F 0 "#PWR013" H 11325 5400 50  0001 C CNN
F 1 "+5P" V 11340 5678 50  0000 L CNN
F 2 "" H 11325 5550 50  0001 C CNN
F 3 "" H 11325 5550 50  0001 C CNN
	1    11325 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR026
U 1 1 68081FC6
P 14750 7900
F 0 "#PWR026" H 14750 7750 50  0001 C CNN
F 1 "+5P" V 14765 8028 50  0000 L CNN
F 2 "" H 14750 7900 50  0001 C CNN
F 3 "" H 14750 7900 50  0001 C CNN
	1    14750 7900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 68082A79
P 8600 10100
F 0 "#PWR08" H 8600 9850 50  0001 C CNN
F 1 "GND" H 8605 9927 50  0000 C CNN
F 2 "" H 8600 10100 50  0001 C CNN
F 3 "" H 8600 10100 50  0001 C CNN
	1    8600 10100
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR07
U 1 1 6808300B
P 8600 9700
F 0 "#PWR07" H 8600 9550 50  0001 C CNN
F 1 "+5P" V 8615 9828 50  0000 L CNN
F 2 "" H 8600 9700 50  0001 C CNN
F 3 "" H 8600 9700 50  0001 C CNN
	1    8600 9700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U6
U 1 1 680EC3D1
P 4950 6025
F 0 "U6" H 4950 6806 50  0000 C CNN
F 1 "DS8205" H 4950 6715 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4950 6025 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4950 6025 50  0001 C CNN
	1    4950 6025
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 5725 4100 5725
Wire Wire Line
	4450 5825 4100 5825
Wire Wire Line
	4450 5925 4100 5925
Wire Wire Line
	4450 6225 4100 6225
Wire Wire Line
	4450 6325 4100 6325
Wire Wire Line
	4450 6425 4100 6425
Text Label 4175 5725 0    50   ~ 0
A2
Text Label 4175 5825 0    50   ~ 0
A3
Text Label 4175 5925 0    50   ~ 0
A4
Text Label 4200 6325 0    50   ~ 0
A6
Text Label 4200 6425 0    50   ~ 0
A7
Text Label 4200 6225 0    50   ~ 0
A5
$Comp
L 74xx:74LS04 U4
U 2 1 68157103
P 4600 7250
F 0 "U4" H 4600 7567 50  0000 C CNN
F 1 "74LS04" H 4600 7476 50  0000 C CNN
F 2 "" H 4600 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4600 7250 50  0001 C CNN
	2    4600 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7250 4100 7250
Text Label 4175 7250 0    50   ~ 0
~RD
$Comp
L 74xx:74LS04 U4
U 1 1 68178413
P 4600 7650
F 0 "U4" H 4600 7967 50  0000 C CNN
F 1 "74LS04" H 4600 7876 50  0000 C CNN
F 2 "" H 4600 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4600 7650 50  0001 C CNN
	1    4600 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7650 4100 7650
Text Label 4125 7650 0    50   ~ 0
~IORQ
$Comp
L 74xx:74LS04 U4
U 3 1 6818A1F4
P 4600 8050
F 0 "U4" H 4600 8367 50  0000 C CNN
F 1 "74LS04" H 4600 8276 50  0000 C CNN
F 2 "" H 4600 8050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4600 8050 50  0001 C CNN
	3    4600 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 8050 4100 8050
Text Label 4125 8050 0    50   ~ 0
~M1
$Comp
L 74xx:74LS04 U4
U 7 1 6819ADB8
P 8000 9925
F 0 "U4" H 8230 9971 50  0000 L CNN
F 1 "74LS04" H 8230 9880 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8000 9925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8000 9925 50  0001 C CNN
	7    8000 9925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6819C4B2
P 8000 10425
F 0 "#PWR0101" H 8000 10175 50  0001 C CNN
F 1 "GND" H 8005 10252 50  0000 C CNN
F 2 "" H 8000 10425 50  0001 C CNN
F 3 "" H 8000 10425 50  0001 C CNN
	1    8000 10425
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0102
U 1 1 6819C6FE
P 8000 9425
F 0 "#PWR0102" H 8000 9275 50  0001 C CNN
F 1 "+5P" V 8015 9553 50  0000 L CNN
F 2 "" H 8000 9425 50  0001 C CNN
F 3 "" H 8000 9425 50  0001 C CNN
	1    8000 9425
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 6 1 6819CA59
P 4600 8500
F 0 "U4" H 4600 8817 50  0000 C CNN
F 1 "74LS04" H 4600 8726 50  0000 C CNN
F 2 "" H 4600 8500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4600 8500 50  0001 C CNN
	6    4600 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 8500 4100 8500
Text Label 4125 8500 0    50   ~ 0
~IEO
Entry Wire Line
	1650 4400 1750 4300
Entry Wire Line
	1650 4500 1750 4400
Wire Wire Line
	1450 4400 1650 4400
Wire Wire Line
	1450 4500 1650 4500
Text Label 1475 4500 0    50   ~ 0
~IEO
Text Label 1475 4400 0    50   ~ 0
~IEI
Wire Wire Line
	1450 4600 1650 4600
Entry Wire Line
	1650 4600 1750 4500
Text Label 1475 4600 0    50   ~ 0
~INT
Entry Wire Line
	4000 5625 4100 5725
Entry Wire Line
	4000 5725 4100 5825
Entry Wire Line
	4000 5825 4100 5925
Entry Wire Line
	4000 6125 4100 6225
Entry Wire Line
	4000 6225 4100 6325
Entry Wire Line
	4000 6325 4100 6425
Entry Wire Line
	4000 7150 4100 7250
Entry Wire Line
	4000 7550 4100 7650
Entry Wire Line
	4000 7950 4100 8050
Entry Wire Line
	4000 8400 4100 8500
Wire Bus Line
	4000 5300 2775 5300
Entry Wire Line
	4000 8850 4100 8950
Text Label 4100 8950 0    50   ~ 0
~IEI
Wire Wire Line
	10825 7950 10375 7950
Wire Wire Line
	10675 7850 10675 7750
Wire Wire Line
	10675 7750 10250 7750
Wire Wire Line
	10675 7850 10825 7850
Entry Wire Line
	10275 7850 10375 7950
Entry Wire Line
	10275 7550 10375 7650
Entry Wire Line
	10275 7350 10375 7450
Text Label 10500 7450 0    50   ~ 0
CLK
Text Label 10500 7650 0    50   ~ 0
~INT
Text Label 10500 7950 0    50   ~ 0
~IEO
Text Label 10500 3950 0    50   ~ 0
CLK
Text Label 10500 4150 0    50   ~ 0
~INT
Text Label 10500 4350 0    50   ~ 0
~IEI
Entry Wire Line
	10275 3850 10375 3950
Entry Wire Line
	10275 4050 10375 4150
Entry Wire Line
	10275 4250 10375 4350
Entry Wire Line
	10275 3350 10375 3450
Entry Wire Line
	10275 3450 10375 3550
Text Label 10475 3450 0    50   ~ 0
~CS1
Text Label 10475 3550 0    50   ~ 0
~M1R
Text Label 10500 6950 0    50   ~ 0
~CS2
Text Label 10500 7050 0    50   ~ 0
~M1R
Entry Wire Line
	10275 6850 10375 6950
Entry Wire Line
	10275 6950 10375 7050
Wire Wire Line
	10375 6950 10825 6950
Wire Wire Line
	10375 7050 10825 7050
$Comp
L 74xx:74LS00 U5
U 4 1 6836A710
P 7150 6025
F 0 "U5" H 7150 6350 50  0000 C CNN
F 1 "74LS00" H 7150 6259 50  0000 C CNN
F 2 "" H 7150 6025 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7150 6025 50  0001 C CNN
	4    7150 6025
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 68380438
P 6075 5225
F 0 "J2" V 6039 5037 50  0000 R CNN
F 1 "Conn_01x03" V 5948 5037 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6075 5225 50  0001 C CNN
F 3 "~" H 6075 5225 50  0001 C CNN
	1    6075 5225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5450 6125 6175 6125
Wire Wire Line
	6175 6125 6175 5925
Wire Wire Line
	6850 5925 6175 5925
Connection ~ 6175 5925
Wire Wire Line
	6175 5925 6175 5425
Wire Wire Line
	5450 6225 6075 6225
Wire Wire Line
	6075 6225 6075 5425
Wire Wire Line
	6850 6125 6650 6125
Wire Wire Line
	6650 6125 6650 6225
Wire Wire Line
	6650 6225 6075 6225
Connection ~ 6075 6225
$Comp
L 74xx:74LS00 U5
U 5 1 683CCB3B
P 7300 9925
F 0 "U5" H 7530 9971 50  0000 L CNN
F 1 "74LS00" H 7530 9880 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7300 9925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7300 9925 50  0001 C CNN
	5    7300 9925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 683F7608
P 7300 10425
F 0 "#PWR0103" H 7300 10175 50  0001 C CNN
F 1 "GND" H 7305 10252 50  0000 C CNN
F 2 "" H 7300 10425 50  0001 C CNN
F 3 "" H 7300 10425 50  0001 C CNN
	1    7300 10425
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0104
U 1 1 683F7983
P 7300 9425
F 0 "#PWR0104" H 7300 9275 50  0001 C CNN
F 1 "+5P" V 7315 9553 50  0000 L CNN
F 2 "" H 7300 9425 50  0001 C CNN
F 3 "" H 7300 9425 50  0001 C CNN
	1    7300 9425
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS20 U7
U 3 1 683F85A5
P 6525 9925
F 0 "U7" H 6755 9971 50  0000 L CNN
F 1 "74LS20" H 6755 9880 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6525 9925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 6525 9925 50  0001 C CNN
	3    6525 9925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 683F96F1
P 6525 10425
F 0 "#PWR0105" H 6525 10175 50  0001 C CNN
F 1 "GND" H 6530 10252 50  0000 C CNN
F 2 "" H 6525 10425 50  0001 C CNN
F 3 "" H 6525 10425 50  0001 C CNN
	1    6525 10425
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0106
U 1 1 683F9A7B
P 6525 9425
F 0 "#PWR0106" H 6525 9275 50  0001 C CNN
F 1 "+5P" V 6540 9553 50  0000 L CNN
F 2 "" H 6525 9425 50  0001 C CNN
F 3 "" H 6525 9425 50  0001 C CNN
	1    6525 9425
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS20 U7
U 1 1 683F9E07
P 6800 7525
F 0 "U7" H 6800 7900 50  0000 C CNN
F 1 "74LS20" H 6800 7809 50  0000 C CNN
F 2 "" H 6800 7525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 6800 7525 50  0001 C CNN
	1    6800 7525
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS20 U7
U 2 1 6840FCFF
P 6800 8150
F 0 "U7" H 6800 8525 50  0000 C CNN
F 1 "74LS20" H 6800 8434 50  0000 C CNN
F 2 "" H 6800 8150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 6800 8150 50  0001 C CNN
	2    6800 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7250 5800 7250
Wire Wire Line
	5800 7250 5800 7375
Wire Wire Line
	5800 7375 6500 7375
Wire Wire Line
	6500 7475 6150 7475
Wire Wire Line
	6150 7475 6150 7575
Wire Wire Line
	6150 8300 6500 8300
Wire Wire Line
	6500 7575 6150 7575
Connection ~ 6150 7575
Wire Wire Line
	6150 7575 6150 7650
Wire Wire Line
	4900 7650 6150 7650
Connection ~ 6150 7650
Wire Wire Line
	6150 7650 6150 8300
Wire Wire Line
	7450 6025 7550 6025
Wire Wire Line
	7550 6025 7550 6475
Wire Wire Line
	7550 6475 6275 6475
Wire Wire Line
	6275 6475 6275 7675
Wire Wire Line
	6275 7675 6500 7675
Wire Wire Line
	4900 8050 6075 8050
Wire Wire Line
	6075 8050 6075 8200
Wire Wire Line
	6075 8200 6500 8200
Wire Wire Line
	4900 8500 6000 8500
Wire Wire Line
	6000 8500 6000 8100
Wire Wire Line
	6000 8100 6500 8100
Wire Wire Line
	5850 8950 5850 8000
Wire Wire Line
	5850 8000 6500 8000
Wire Wire Line
	4100 8950 5850 8950
$Comp
L Device:R R1
U 1 1 684D369E
P 6000 8950
F 0 "R1" V 5793 8950 50  0000 C CNN
F 1 "5K1" V 5884 8950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5930 8950 50  0001 C CNN
F 3 "~" H 6000 8950 50  0001 C CNN
	1    6000 8950
	0    1    1    0   
$EndComp
Connection ~ 5850 8950
$Comp
L power:+5P #PWR0107
U 1 1 684D489D
P 6150 8950
F 0 "#PWR0107" H 6150 8800 50  0001 C CNN
F 1 "+5P" V 6165 9078 50  0000 L CNN
F 2 "" H 6150 8950 50  0001 C CNN
F 3 "" H 6150 8950 50  0001 C CNN
	1    6150 8950
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS00 U5
U 2 1 684D5141
P 7800 7875
F 0 "U5" H 7800 8200 50  0000 C CNN
F 1 "74LS00" H 7800 8109 50  0000 C CNN
F 2 "" H 7800 7875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7800 7875 50  0001 C CNN
	2    7800 7875
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 8150 7225 8150
Wire Wire Line
	7225 8150 7225 7775
Wire Wire Line
	7225 7775 7500 7775
Wire Wire Line
	7500 7975 7325 7975
Wire Wire Line
	7325 7975 7325 7525
Wire Wire Line
	7325 7525 7100 7525
$Comp
L 74xx:74LS04 U4
U 5 1 68506684
P 8525 7875
F 0 "U4" H 8525 8192 50  0000 C CNN
F 1 "74LS04" H 8525 8101 50  0000 C CNN
F 2 "" H 8525 7875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8525 7875 50  0001 C CNN
	5    8525 7875
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 7875 8225 7875
Wire Wire Line
	8825 7875 8950 7875
Wire Wire Line
	8950 7875 8950 7500
Wire Wire Line
	8950 7500 7325 7500
Wire Wire Line
	7325 7500 7325 6875
Wire Wire Line
	7325 6875 6300 6875
Wire Wire Line
	6300 6875 6300 5875
Wire Wire Line
	6300 5875 5975 5875
Wire Wire Line
	5975 5875 5975 5425
Wire Wire Line
	4625 2550 4350 2550
Wire Wire Line
	4350 6875 6300 6875
Wire Wire Line
	4350 2550 4350 6875
Connection ~ 6300 6875
$Comp
L power:+5P #PWR0108
U 1 1 6856F66C
P 4950 5425
F 0 "#PWR0108" H 4950 5275 50  0001 C CNN
F 1 "+5P" V 4965 5553 50  0000 L CNN
F 2 "" H 4950 5425 50  0001 C CNN
F 3 "" H 4950 5425 50  0001 C CNN
	1    4950 5425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 6856FC58
P 4950 6725
F 0 "#PWR0109" H 4950 6475 50  0001 C CNN
F 1 "GND" H 4955 6552 50  0000 C CNN
F 2 "" H 4950 6725 50  0001 C CNN
F 3 "" H 4950 6725 50  0001 C CNN
	1    4950 6725
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 6125 6650 5550
Connection ~ 6650 6125
Text Label 7300 5550 0    50   ~ 0
~CS2
Wire Wire Line
	6175 6125 6175 6675
Connection ~ 6175 6125
Wire Wire Line
	6175 6675 7500 6675
Wire Wire Line
	6650 5550 7500 5550
Text Label 7300 6675 0    50   ~ 0
~CS1
Entry Wire Line
	7500 6675 7600 6575
Entry Wire Line
	7500 5550 7600 5450
Wire Bus Line
	7600 5000 4000 5000
Wire Bus Line
	4000 5000 4000 5300
Connection ~ 4000 5300
$Comp
L Interface_UART:MAX232 U8
U 1 1 685FC68E
P 8725 2900
F 0 "U8" H 8725 4281 50  0000 C CNN
F 1 "MAX232" H 8725 4190 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8775 1850 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8725 3000 50  0001 C CNN
	1    8725 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9525 2000 9700 2000
Wire Wire Line
	9700 2300 9525 2300
Wire Wire Line
	7825 2000 7925 2000
Wire Wire Line
	7925 2300 7825 2300
Wire Wire Line
	9525 2500 9975 2500
Wire Wire Line
	9975 2500 9975 2025
Wire Wire Line
	9600 2800 9525 2800
$Comp
L power:+5P #PWR0110
U 1 1 686FFD45
P 9975 1725
F 0 "#PWR0110" H 9975 1575 50  0001 C CNN
F 1 "+5P" V 9990 1853 50  0000 L CNN
F 2 "" H 9975 1725 50  0001 C CNN
F 3 "" H 9975 1725 50  0001 C CNN
	1    9975 1725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0111
U 1 1 687001AF
P 8725 1700
F 0 "#PWR0111" H 8725 1550 50  0001 C CNN
F 1 "+5P" V 8740 1828 50  0000 L CNN
F 2 "" H 8725 1700 50  0001 C CNN
F 3 "" H 8725 1700 50  0001 C CNN
	1    8725 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 68700CA0
P 8725 4100
F 0 "#PWR0112" H 8725 3850 50  0001 C CNN
F 1 "GND" H 8730 3927 50  0000 C CNN
F 2 "" H 8725 4100 50  0001 C CNN
F 3 "" H 8725 4100 50  0001 C CNN
	1    8725 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 687010FD
P 9900 2800
F 0 "#PWR0113" H 9900 2550 50  0001 C CNN
F 1 "GND" H 9905 2627 50  0000 C CNN
F 2 "" H 9900 2800 50  0001 C CNN
F 3 "" H 9900 2800 50  0001 C CNN
	1    9900 2800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:DB9_Male J4
U 1 1 68701D84
P 14700 1450
F 0 "J4" H 14618 758 50  0000 C CNN
F 1 "DB9_Male" H 14618 849 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 14700 1450 50  0001 C CNN
F 3 " ~" H 14700 1450 50  0001 C CNN
	1    14700 1450
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 68720743
P 14400 1850
F 0 "#PWR0114" H 14400 1600 50  0001 C CNN
F 1 "GND" H 14405 1677 50  0000 C CNN
F 2 "" H 14400 1850 50  0001 C CNN
F 3 "" H 14400 1850 50  0001 C CNN
	1    14400 1850
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:MAX232 U9
U 1 1 68743BE2
P 8725 5900
F 0 "U9" H 8725 7281 50  0000 C CNN
F 1 "MAX232" H 8725 7190 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8775 4850 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 8725 6000 50  0001 C CNN
	1    8725 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9525 5000 9700 5000
Wire Wire Line
	9700 5300 9525 5300
Wire Wire Line
	7825 5000 7925 5000
Wire Wire Line
	7925 5300 7825 5300
Wire Wire Line
	9525 5500 9975 5500
Wire Wire Line
	9975 5500 9975 5025
Wire Wire Line
	9600 5800 9525 5800
$Comp
L power:+5P #PWR0115
U 1 1 68743C07
P 9975 4725
F 0 "#PWR0115" H 9975 4575 50  0001 C CNN
F 1 "+5P" V 9990 4853 50  0000 L CNN
F 2 "" H 9975 4725 50  0001 C CNN
F 3 "" H 9975 4725 50  0001 C CNN
	1    9975 4725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0116
U 1 1 68743C0D
P 8725 4700
F 0 "#PWR0116" H 8725 4550 50  0001 C CNN
F 1 "+5P" V 8740 4828 50  0000 L CNN
F 2 "" H 8725 4700 50  0001 C CNN
F 3 "" H 8725 4700 50  0001 C CNN
	1    8725 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 68743C13
P 8725 7100
F 0 "#PWR0117" H 8725 6850 50  0001 C CNN
F 1 "GND" H 8730 6927 50  0000 C CNN
F 2 "" H 8725 7100 50  0001 C CNN
F 3 "" H 8725 7100 50  0001 C CNN
	1    8725 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 68743C19
P 9900 5800
F 0 "#PWR0118" H 9900 5550 50  0001 C CNN
F 1 "GND" H 9905 5627 50  0000 C CNN
F 2 "" H 9900 5800 50  0001 C CNN
F 3 "" H 9900 5800 50  0001 C CNN
	1    9900 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9525 6400 9900 6400
Wire Wire Line
	9525 6600 9900 6600
Text Label 9750 6600 0    50   ~ 0
PO
Text Label 9750 3600 0    50   ~ 0
RxD
Wire Wire Line
	9525 3600 9900 3600
Text Label 9750 6400 0    50   ~ 0
CTS
Wire Wire Line
	9525 3400 9900 3400
Wire Wire Line
	9525 3200 9900 3200
Wire Wire Line
	9525 3000 9900 3000
Text Label 9750 3000 0    50   ~ 0
RTS
Text Label 9750 3200 0    50   ~ 0
TxD
Text Label 9750 3400 0    50   ~ 0
DTR
Wire Wire Line
	11825 2250 12125 2250
Wire Wire Line
	12125 2250 12125 1150
Wire Wire Line
	12125 1150 7550 1150
Wire Wire Line
	7925 3200 7550 3200
Wire Wire Line
	7550 1150 7550 3200
Wire Wire Line
	7925 3000 7525 3000
Wire Wire Line
	7525 3000 7525 1125
Wire Wire Line
	7525 1125 12150 1125
Wire Wire Line
	12175 2450 11825 2450
Wire Wire Line
	7925 3600 7475 3600
Wire Wire Line
	7475 3600 7475 1100
Wire Wire Line
	7475 1100 12175 1100
Wire Wire Line
	11825 2350 12150 2350
Wire Wire Line
	12150 2350 12150 1125
Wire Wire Line
	12175 1100 12175 2450
Wire Wire Line
	12200 2550 12200 1075
Wire Wire Line
	12200 1075 7450 1075
Wire Wire Line
	7450 1075 7450 4925
Wire Wire Line
	7450 4925 7700 4925
Wire Wire Line
	7700 4925 7700 6400
Wire Wire Line
	7700 6400 7925 6400
Wire Wire Line
	7925 6600 7675 6600
Wire Wire Line
	7675 6600 7675 4950
Wire Wire Line
	7675 4950 7425 4950
Wire Wire Line
	7425 4950 7425 1050
Wire Wire Line
	7425 1050 12225 1050
Wire Wire Line
	12225 1050 12225 2750
Wire Wire Line
	12225 2750 11825 2750
Wire Wire Line
	11825 2550 12200 2550
Wire Wire Line
	11825 2650 12250 2650
Wire Wire Line
	12250 2650 12250 1025
Wire Wire Line
	12250 1025 7500 1025
Wire Wire Line
	7500 1025 7500 3400
Wire Wire Line
	7500 3400 7925 3400
Entry Wire Line
	9900 3000 10000 2900
Entry Wire Line
	9900 3200 10000 3100
Entry Wire Line
	9900 3400 10000 3300
Entry Wire Line
	9900 3600 10000 3500
Entry Wire Line
	9900 6400 10000 6300
Entry Wire Line
	9900 6600 10000 6500
Wire Bus Line
	10200 3875 10000 3875
Wire Bus Line
	10000 2900 10275 2900
Connection ~ 10275 2900
Connection ~ 10275 6225
Wire Bus Line
	10000 6225 10275 6225
Wire Bus Line
	5875 650  10275 650 
Connection ~ 10275 650 
Wire Wire Line
	14400 1250 13950 1250
Wire Wire Line
	14400 1450 13950 1450
Wire Wire Line
	14400 1650 13950 1650
Wire Wire Line
	14400 1550 13950 1550
Wire Wire Line
	14400 1350 13950 1350
Text Label 14050 1250 0    50   ~ 0
RxD
Text Label 14050 1450 0    50   ~ 0
TxD
Text Label 14050 1650 0    50   ~ 0
DTR
Text Label 14050 1350 0    50   ~ 0
RTS
Text Label 14050 1550 0    50   ~ 0
CTS
Entry Wire Line
	13850 1550 13950 1650
Entry Wire Line
	13850 1350 13950 1450
Entry Wire Line
	13850 1450 13950 1550
Entry Wire Line
	13750 1125 13850 1025
Entry Wire Line
	13850 1150 13950 1250
Entry Wire Line
	13850 1250 13950 1350
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J3
U 1 1 68C577A4
P 13650 2350
F 0 "J3" H 13700 2667 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 13700 2576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 13650 2350 50  0001 C CNN
F 3 "~" H 13650 2350 50  0001 C CNN
	1    13650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	13750 1125 13425 1125
Wire Wire Line
	13950 2250 14175 2250
Wire Wire Line
	14175 2250 14175 1050
Wire Wire Line
	14175 1050 14400 1050
Wire Wire Line
	13950 2350 14200 2350
Wire Wire Line
	14200 2350 14200 1150
Wire Wire Line
	14200 1150 14400 1150
Wire Wire Line
	13950 2450 14225 2450
Wire Wire Line
	14225 2450 14225 1750
Wire Wire Line
	14225 1750 14400 1750
Text Label 13550 1125 0    50   ~ 0
PO
Wire Bus Line
	10275 650  13850 650 
Wire Wire Line
	13450 2450 13425 2450
Wire Wire Line
	13425 1125 13425 2250
Wire Wire Line
	13450 2250 13425 2250
Connection ~ 13425 2250
Wire Wire Line
	13425 2250 13425 2350
Wire Wire Line
	13450 2350 13425 2350
Connection ~ 13425 2350
Wire Wire Line
	13425 2350 13425 2450
$Comp
L 74xx:74LS00 U5
U 1 1 68EFAB86
P 4925 4300
F 0 "U5" H 4925 4625 50  0000 C CNN
F 1 "74LS00" H 4925 4534 50  0000 C CNN
F 2 "" H 4925 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4925 4300 50  0001 C CNN
	1    4925 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 4 1 68F006B8
P 5650 4300
F 0 "U4" H 5650 4617 50  0000 C CNN
F 1 "74LS04" H 5650 4526 50  0000 C CNN
F 2 "" H 5650 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5650 4300 50  0001 C CNN
	4    5650 4300
	1    0    0    -1  
$EndComp
Connection ~ 4000 5000
Text Label 4125 4400 0    50   ~ 0
~M1
Entry Wire Line
	4000 4300 4100 4400
Wire Wire Line
	4100 4400 4625 4400
Wire Wire Line
	4625 4200 4100 4200
Entry Wire Line
	4000 4100 4100 4200
Entry Wire Line
	4000 3900 4100 4000
Wire Wire Line
	4100 4000 6175 4000
Wire Wire Line
	6175 4000 6175 4300
Wire Wire Line
	6175 4300 5950 4300
Wire Wire Line
	5350 4300 5225 4300
Text Label 4125 4000 0    50   ~ 0
~M1R
Text Label 4125 4200 0    50   ~ 0
~RESET
$Comp
L Device:C C7
U 1 1 69098DD4
P 4225 10000
F 0 "C7" V 3973 10000 50  0000 C CNN
F 1 "100nF" V 4064 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4263 9850 50  0001 C CNN
F 3 "~" H 4225 10000 50  0001 C CNN
	1    4225 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0119
U 1 1 69098DDA
P 4225 9850
F 0 "#PWR0119" H 4225 9700 50  0001 C CNN
F 1 "+5P" V 4240 9978 50  0000 L CNN
F 2 "" H 4225 9850 50  0001 C CNN
F 3 "" H 4225 9850 50  0001 C CNN
	1    4225 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 69098DE0
P 4225 10150
F 0 "#PWR0120" H 4225 9900 50  0001 C CNN
F 1 "GND" H 4230 9977 50  0000 C CNN
F 2 "" H 4225 10150 50  0001 C CNN
F 3 "" H 4225 10150 50  0001 C CNN
	1    4225 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 69098DE6
P 4725 10000
F 0 "C8" V 4473 10000 50  0000 C CNN
F 1 "100nF" V 4564 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4763 9850 50  0001 C CNN
F 3 "~" H 4725 10000 50  0001 C CNN
	1    4725 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0121
U 1 1 69098DEC
P 4725 9850
F 0 "#PWR0121" H 4725 9700 50  0001 C CNN
F 1 "+5P" V 4740 9978 50  0000 L CNN
F 2 "" H 4725 9850 50  0001 C CNN
F 3 "" H 4725 9850 50  0001 C CNN
	1    4725 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 69098DF2
P 4725 10150
F 0 "#PWR0122" H 4725 9900 50  0001 C CNN
F 1 "GND" H 4730 9977 50  0000 C CNN
F 2 "" H 4725 10150 50  0001 C CNN
F 3 "" H 4725 10150 50  0001 C CNN
	1    4725 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 69098E0A
P 5300 10000
F 0 "C9" V 5048 10000 50  0000 C CNN
F 1 "100nF" V 5139 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5338 9850 50  0001 C CNN
F 3 "~" H 5300 10000 50  0001 C CNN
	1    5300 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0123
U 1 1 69098E10
P 5300 9850
F 0 "#PWR0123" H 5300 9700 50  0001 C CNN
F 1 "+5P" V 5315 9978 50  0000 L CNN
F 2 "" H 5300 9850 50  0001 C CNN
F 3 "" H 5300 9850 50  0001 C CNN
	1    5300 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 69098E16
P 5300 10150
F 0 "#PWR0124" H 5300 9900 50  0001 C CNN
F 1 "GND" H 5305 9977 50  0000 C CNN
F 2 "" H 5300 10150 50  0001 C CNN
F 3 "" H 5300 10150 50  0001 C CNN
	1    5300 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 69098E1C
P 5800 10000
F 0 "C10" V 5548 10000 50  0000 C CNN
F 1 "100nF" V 5639 10000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5838 9850 50  0001 C CNN
F 3 "~" H 5800 10000 50  0001 C CNN
	1    5800 10000
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0125
U 1 1 69098E22
P 5800 9850
F 0 "#PWR0125" H 5800 9700 50  0001 C CNN
F 1 "+5P" V 5815 9978 50  0000 L CNN
F 2 "" H 5800 9850 50  0001 C CNN
F 3 "" H 5800 9850 50  0001 C CNN
	1    5800 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 69098E28
P 5800 10150
F 0 "#PWR0126" H 5800 9900 50  0001 C CNN
F 1 "GND" H 5805 9977 50  0000 C CNN
F 2 "" H 5800 10150 50  0001 C CNN
F 3 "" H 5800 10150 50  0001 C CNN
	1    5800 10150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 691C8AEC
P 4450 2825
F 0 "#PWR0127" H 4450 2575 50  0001 C CNN
F 1 "GND" H 4455 2652 50  0000 C CNN
F 2 "" H 4450 2825 50  0001 C CNN
F 3 "" H 4450 2825 50  0001 C CNN
	1    4450 2825
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2825 4450 2450
Wire Wire Line
	4450 2450 4625 2450
$Comp
L Device:C C12
U 1 1 692830AC
P 7825 5150
F 0 "C12" H 7940 5196 50  0000 L CNN
F 1 "1µ" H 7940 5105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 7863 5000 50  0001 C CNN
F 3 "~" H 7825 5150 50  0001 C CNN
	1    7825 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 692835A3
P 9700 5150
F 0 "C14" H 9815 5196 50  0000 L CNN
F 1 "1µ" H 9815 5105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9738 5000 50  0001 C CNN
F 3 "~" H 9700 5150 50  0001 C CNN
	1    9700 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 69283A8E
P 9975 4875
F 0 "C18" H 10090 4921 50  0000 L CNN
F 1 "1µ" H 10090 4830 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 10013 4725 50  0001 C CNN
F 3 "~" H 9975 4875 50  0001 C CNN
	1    9975 4875
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 69283DC7
P 9750 5800
F 0 "C16" V 9498 5800 50  0000 C CNN
F 1 "1µ" V 9589 5800 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9788 5650 50  0001 C CNN
F 3 "~" H 9750 5800 50  0001 C CNN
	1    9750 5800
	0    1    1    0   
$EndComp
$Comp
L Device:C C17
U 1 1 69284443
P 9975 1875
F 0 "C17" V 9723 1875 50  0000 C CNN
F 1 "1µ" V 9814 1875 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 10013 1725 50  0001 C CNN
F 3 "~" H 9975 1875 50  0001 C CNN
	1    9975 1875
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 69284892
P 9750 2800
F 0 "C15" V 9498 2800 50  0000 C CNN
F 1 "1µ" V 9589 2800 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9788 2650 50  0001 C CNN
F 3 "~" H 9750 2800 50  0001 C CNN
	1    9750 2800
	0    1    1    0   
$EndComp
$Comp
L Device:C C13
U 1 1 69284DCD
P 9700 2150
F 0 "C13" H 9815 2196 50  0000 L CNN
F 1 "1µ" H 9815 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9738 2000 50  0001 C CNN
F 3 "~" H 9700 2150 50  0001 C CNN
	1    9700 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 692DE6AD
P 7825 2150
F 0 "C11" H 7940 2196 50  0000 L CNN
F 1 "1µ" H 7940 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 7863 2000 50  0001 C CNN
F 3 "~" H 7825 2150 50  0001 C CNN
	1    7825 2150
	1    0    0    -1  
$EndComp
Wire Bus Line
	7600 5000 7600 6575
Wire Bus Line
	10000 6225 10000 6500
Wire Bus Line
	10000 2900 10000 3500
Wire Bus Line
	4000 3900 4000 5000
Wire Bus Line
	10275 650  10275 2900
Wire Bus Line
	5875 650  5875 2250
Wire Bus Line
	13850 650  13850 1550
Wire Bus Line
	4000 5300 4000 8850
Wire Bus Line
	4150 650  4150 2550
Wire Bus Line
	1750 2550 1750 4500
Wire Bus Line
	10275 6225 10275 7850
Wire Bus Line
	10275 2900 10275 6225
Wire Bus Line
	2775 2550 2775 5300
$EndSCHEMATC
