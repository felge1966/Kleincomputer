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
Text GLabel 900  2700 0    50   Input ~ 0
AB0
Text GLabel 900  2600 0    50   Input ~ 0
AB2
Text GLabel 900  2500 0    50   Input ~ 0
AB4
Text GLabel 900  2400 0    50   Input ~ 0
AB6
Text GLabel 2300 2700 2    50   Input ~ 0
AB1
Text GLabel 2300 2600 2    50   Input ~ 0
AB3
Text GLabel 2300 2500 2    50   Input ~ 0
AB5
Text GLabel 2300 2400 2    50   Input ~ 0
AB7
Wire Wire Line
	2300 2400 2250 2400
Wire Wire Line
	2250 2500 2300 2500
Wire Wire Line
	2300 2600 2250 2600
Wire Wire Line
	2250 2700 2300 2700
Wire Wire Line
	950  2700 900  2700
Wire Wire Line
	900  2600 950  2600
Wire Wire Line
	950  2500 900  2500
Wire Wire Line
	900  2400 950  2400
Text GLabel 2300 2200 2    50   Input ~ 0
AB9
Text GLabel 2300 2100 2    50   Input ~ 0
AB11
Text GLabel 900  2200 0    50   Input ~ 0
AB8
Text GLabel 900  2100 0    50   Input ~ 0
AB10
Wire Wire Line
	2300 2100 2250 2100
Wire Wire Line
	2250 2200 2300 2200
Wire Wire Line
	900  2100 950  2100
Wire Wire Line
	900  2200 950  2200
Wire Wire Line
	2250 3700 2300 3700
Wire Wire Line
	2300 3700 2300 3650
Wire Wire Line
	900  3650 900  3700
Wire Wire Line
	900  3700 950  3700
$Comp
L power:GND #PWR01
U 1 1 5F2C97FE
P 750 950
F 0 "#PWR01" H 750 700 50  0001 C CNN
F 1 "GND" H 650 850 50  0000 C CNN
F 2 "" H 750 950 50  0001 C CNN
F 3 "" H 750 950 50  0001 C CNN
	1    750  950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  900  900  900 
Wire Wire Line
	950  1000 900  1000
$Comp
L power:GND #PWR09
U 1 1 5F2CB9A2
P 2450 950
F 0 "#PWR09" H 2450 700 50  0001 C CNN
F 1 "GND" H 2550 850 50  0000 C CNN
F 2 "" H 2450 950 50  0001 C CNN
F 3 "" H 2450 950 50  0001 C CNN
	1    2450 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 900  2300 900 
Wire Wire Line
	2250 1000 2300 1000
Text GLabel 900  2000 0    50   Input ~ 0
AB12
Wire Wire Line
	900  2000 950  2000
Text GLabel 2300 1500 2    50   Input ~ 0
DB0
Text GLabel 2300 1400 2    50   Input ~ 0
DB2
Text GLabel 2300 1300 2    50   Input ~ 0
DB4
Text GLabel 2300 1200 2    50   Input ~ 0
DB6
Text GLabel 900  1500 0    50   Input ~ 0
DB1
Text GLabel 900  1400 0    50   Input ~ 0
DB3
Text GLabel 900  1300 0    50   Input ~ 0
DB5
Text GLabel 900  1200 0    50   Input ~ 0
DB7
Wire Wire Line
	900  1200 950  1200
Wire Wire Line
	950  1300 900  1300
Wire Wire Line
	900  1400 950  1400
Wire Wire Line
	950  1500 900  1500
Wire Wire Line
	2300 1500 2250 1500
Wire Wire Line
	2250 1400 2300 1400
Wire Wire Line
	2300 1300 2250 1300
Wire Wire Line
	2250 1200 2300 1200
Text GLabel 2300 1800 2    50   Input ~ 0
IEI
Text GLabel 900  1800 0    50   Input ~ 0
IEO
Wire Wire Line
	900  1800 950  1800
Wire Wire Line
	2300 1800 2250 1800
Text GLabel 900  1900 0    50   Input ~ 0
AB14
Wire Wire Line
	900  1900 950  1900
Text GLabel 2300 1900 2    50   Input ~ 0
AB15
Wire Wire Line
	2300 1900 2250 1900
Text GLabel 2300 2000 2    50   Input ~ 0
AB13
Wire Wire Line
	2300 2000 2250 2000
$Comp
L power:GND #PWR07
U 1 1 5F2F75CF
P 2300 2950
F 0 "#PWR07" H 2300 2700 50  0001 C CNN
F 1 "GND" H 2400 2850 50  0000 C CNN
F 2 "" H 2300 2950 50  0001 C CNN
F 3 "" H 2300 2950 50  0001 C CNN
	1    2300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2950 2300 2900
Wire Wire Line
	2300 2900 2250 2900
Text GLabel 2300 1700 2    39   Input ~ 0
~IORQ
Wire Wire Line
	2300 1700 2250 1700
Text GLabel 900  1700 0    39   Input ~ 0
~MREQ
Wire Wire Line
	900  1700 950  1700
Text GLabel 900  1600 0    39   Input ~ 0
~WR
Wire Wire Line
	900  1600 950  1600
Text GLabel 2300 1600 2    39   Input ~ 0
~RD
Wire Wire Line
	2300 1600 2250 1600
Text GLabel 900  2900 0    50   Input ~ 0
TAKT
Wire Wire Line
	900  2900 950  2900
Text GLabel 900  3400 0    39   Input ~ 0
~MAD
Wire Wire Line
	900  3400 950  3400
Text GLabel 2300 3200 2    50   Input ~ 0
MEI
Wire Wire Line
	2300 3200 2250 3200
Text GLabel 900  3200 0    50   Input ~ 0
MEO
Wire Wire Line
	900  3200 950  3200
Wire Wire Line
	2300 900  2300 1000
Connection ~ 2300 900 
Wire Wire Line
	2300 900  2250 900 
Wire Wire Line
	900  900  900  1000
Connection ~ 900  900 
Wire Wire Line
	900  900  950  900 
Wire Wire Line
	750  900  750  950 
Wire Wire Line
	2450 900  2450 950 
$Comp
L felge1966:KC85_Modulsteckverbinder_M037-KC85_Modulsteckverbinder XM1
U 1 1 6C96DE75
P 1600 2250
F 0 "XM1" H 1350 3800 60  0000 C CNN
F 1 "KC85_Modulsteckverbinder" H 1600 3931 60  0000 C CNN
F 2 "Libs:KC85_Modul" H 1600 375 60  0000 C CNN
F 3 "" H 1600 2700 60  0000 C CNN
	1    1600 2250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U3
U 1 1 65F863FA
P 4400 3850
F 0 "U3" H 4400 4175 50  0000 C CNN
F 1 "74LS08" H 4400 4084 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4400 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4400 3850 50  0001 C CNN
	1    4400 3850
	1    0    0    -1  
$EndComp
Text GLabel 3850 3750 0    50   Input ~ 0
AB8
$Comp
L 74xx:74LS08 U3
U 2 1 65F88EB7
P 5475 3950
F 0 "U3" H 5475 4275 50  0000 C CNN
F 1 "74LS08" H 5475 4184 50  0000 C CNN
F 2 "" H 5475 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5475 3950 50  0001 C CNN
	2    5475 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U3
U 3 1 65F8BCA4
P 2450 5375
F 0 "U3" H 2450 5700 50  0000 C CNN
F 1 "74LS08" H 2450 5609 50  0000 C CNN
F 2 "" H 2450 5375 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2450 5375 50  0001 C CNN
	3    2450 5375
	1    0    0    -1  
$EndComp
Text GLabel 3850 3950 0    50   Input ~ 0
AB9
Wire Wire Line
	3850 3750 4100 3750
Wire Wire Line
	4100 3950 3850 3950
Wire Wire Line
	4700 3850 5175 3850
Text GLabel 3850 4300 0    50   Input ~ 0
AB0
Text GLabel 3850 4500 0    50   Input ~ 0
AB1
Wire Wire Line
	4100 4300 3850 4300
Wire Wire Line
	4100 4500 3850 4500
Wire Wire Line
	4700 4400 4875 4400
Wire Wire Line
	4875 4400 4875 4050
Wire Wire Line
	4875 4050 5175 4050
Wire Wire Line
	5775 3950 6000 3950
Wire Wire Line
	6000 3950 6000 3375
Wire Wire Line
	6000 3375 7300 3375
$Comp
L 74xx:74LS08 U3
U 4 1 65F98415
P 6650 5225
F 0 "U3" H 6650 5550 50  0000 C CNN
F 1 "74LS08" H 6650 5459 50  0000 C CNN
F 2 "" H 6650 5225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6650 5225 50  0001 C CNN
	4    6650 5225
	1    0    0    -1  
$EndComp
Text GLabel 3850 4850 0    50   Input ~ 0
AB5
Text GLabel 3850 5050 0    50   Input ~ 0
AB6
Wire Wire Line
	3850 4850 4100 4850
Wire Wire Line
	3850 5050 4100 5050
Wire Wire Line
	4700 4950 4975 4950
Wire Wire Line
	4975 4950 4975 4200
Wire Wire Line
	4975 4200 6025 4200
Wire Wire Line
	6025 4200 6025 3475
Wire Wire Line
	6025 3475 7300 3475
Wire Wire Line
	7300 3575 6700 3575
Wire Wire Line
	7300 3675 6700 3675
Wire Wire Line
	7300 3775 6700 3775
Wire Wire Line
	7300 3875 6700 3875
Text GLabel 6700 3575 0    50   Input ~ 0
AB2
Text GLabel 6700 3675 0    50   Input ~ 0
AB3
Text GLabel 6700 3775 0    50   Input ~ 0
AB4
Text GLabel 6700 3875 0    50   Input ~ 0
AB7
$Comp
L 74xx:74LS74 U1
U 1 1 65FABD94
P 5075 2000
F 0 "U1" H 5075 2481 50  0000 C CNN
F 1 "74LS74" H 5075 2390 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5075 2000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5075 2000 50  0001 C CNN
	1    5075 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network07 RN1
U 1 1 65FAD0CB
P 6200 825
F 0 "RN1" H 6588 871 50  0000 L CNN
F 1 "3K9" H 6588 780 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 6475 825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6200 825 50  0001 C CNN
	1    6200 825 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 1700 5075 1225
Wire Wire Line
	5075 2300 5075 2400
Wire Wire Line
	5075 2400 5900 2400
Wire Wire Line
	5900 2400 5900 1025
Wire Wire Line
	4775 1900 4300 1900
$Comp
L Device:R R1
U 1 1 65FB4FB2
P 4150 1900
F 0 "R1" V 3943 1900 50  0000 C CNN
F 1 "100" V 4034 1900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4080 1900 50  0001 C CNN
F 3 "~" H 4150 1900 50  0001 C CNN
	1    4150 1900
	0    1    1    0   
$EndComp
Text GLabel 4000 1900 0    50   Input ~ 0
DB0
Wire Wire Line
	8500 3375 8500 2500
Wire Wire Line
	8500 2500 4575 2500
Wire Wire Line
	4575 2500 4575 2000
Wire Wire Line
	4575 2000 4775 2000
Wire Wire Line
	8300 3375 8500 3375
Wire Wire Line
	8300 3475 8525 3475
Wire Wire Line
	8525 3475 8525 2475
Wire Wire Line
	8525 2475 5925 2475
Wire Wire Line
	5925 2475 5925 1900
Wire Wire Line
	5925 1900 5375 1900
$Comp
L 74xx:74LS02 U2
U 1 1 65FC9838
P 4400 4400
F 0 "U2" H 4400 4725 50  0000 C CNN
F 1 "74LS02" H 4400 4634 50  0000 C CNN
F 2 "" H 4400 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 4400 4400 50  0001 C CNN
	1    4400 4400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U2
U 2 1 65FCF409
P 4400 4950
F 0 "U2" H 4400 5275 50  0000 C CNN
F 1 "74LS02" H 4400 5184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4400 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 4400 4950 50  0001 C CNN
	2    4400 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U2
U 5 1 65FD20F6
P 1875 9700
F 0 "U2" H 2105 9746 50  0000 L CNN
F 1 "74LS02" H 2105 9655 50  0000 L CNN
F 2 "" H 1875 9700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 1875 9700 50  0001 C CNN
	5    1875 9700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U3
U 5 1 65FD910B
P 2675 9700
F 0 "U3" H 2905 9746 50  0000 L CNN
F 1 "74LS08" H 2905 9655 50  0000 L CNN
F 2 "" H 2675 9700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2675 9700 50  0001 C CNN
	5    2675 9700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U2
U 3 1 65FDF62B
P 4400 5500
F 0 "U2" H 4400 5825 50  0000 C CNN
F 1 "74LS02" H 4400 5734 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4400 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 4400 5500 50  0001 C CNN
	3    4400 5500
	1    0    0    -1  
$EndComp
Text GLabel 3850 5400 0    50   Input ~ 0
~RD
Text GLabel 3875 5875 0    50   Input ~ 0
~WR
Wire Wire Line
	3850 5400 4100 5400
Wire Wire Line
	3875 5875 4125 5875
$Comp
L 74xx:74LS02 U2
U 4 1 65FE582B
P 4425 5975
F 0 "U2" H 4425 6300 50  0000 C CNN
F 1 "74LS02" H 4425 6209 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4425 5975 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 4425 5975 50  0001 C CNN
	4    4425 5975
	1    0    0    -1  
$EndComp
Text GLabel 3850 5600 0    39   Input ~ 0
~MAD
Wire Wire Line
	4100 5600 3950 5600
Wire Wire Line
	3950 5600 3950 6075
Wire Wire Line
	3950 6075 4125 6075
Connection ~ 3950 5600
Wire Wire Line
	3950 5600 3850 5600
Wire Wire Line
	4700 5500 5025 5500
Wire Wire Line
	5025 5500 5025 4225
Wire Wire Line
	5025 4225 6050 4225
Wire Wire Line
	6050 4225 6050 3975
Wire Wire Line
	6050 3975 7300 3975
Wire Wire Line
	4725 5975 5050 5975
Wire Wire Line
	5050 5975 5050 4250
Wire Wire Line
	5050 4250 6075 4250
Wire Wire Line
	6075 4250 6075 4075
Wire Wire Line
	6075 4075 7300 4075
Text GLabel 4025 2650 0    50   Input ~ 0
DB0
$Comp
L Device:D D1
U 1 1 66004071
P 4350 2650
F 0 "D1" H 4350 2433 50  0000 C CNN
F 1 "GA104" H 4350 2524 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 4350 2650 50  0001 C CNN
F 3 "~" H 4350 2650 50  0001 C CNN
	1    4350 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4025 2650 4200 2650
Wire Wire Line
	4500 2650 5225 2650
Text GLabel 4025 2800 0    50   Input ~ 0
DB4
$Comp
L Device:D D2
U 1 1 6600D8F9
P 4350 2800
F 0 "D2" H 4350 2583 50  0000 C CNN
F 1 "GA104" H 4350 2674 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 4350 2800 50  0001 C CNN
F 3 "~" H 4350 2800 50  0001 C CNN
	1    4350 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4025 2800 4200 2800
Wire Wire Line
	4500 2800 5225 2800
Wire Wire Line
	5225 2800 5225 2650
$Comp
L Logic_Programmable:GAL16V8 U5
U 1 1 66019CEF
P 7800 3875
F 0 "U5" H 7800 4756 50  0000 C CNN
F 1 "GAL16V8" H 7800 4665 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 7800 3875 50  0001 C CNN
F 3 "" H 7800 3875 50  0001 C CNN
	1    7800 3875
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2650 8550 4075
Wire Wire Line
	8550 4075 8300 4075
Wire Wire Line
	5225 2650 8550 2650
Connection ~ 5225 2650
Wire Wire Line
	7300 4275 5975 4275
Wire Wire Line
	5975 4275 5975 2675
Wire Wire Line
	5975 2675 5900 2675
Wire Wire Line
	5900 2675 5900 2400
Connection ~ 5900 2400
Text GLabel 6700 4175 0    39   Input ~ 0
~IORQ
Wire Wire Line
	7300 4175 6700 4175
$Comp
L power:GND #PWR026
U 1 1 66039A3D
P 7800 4575
F 0 "#PWR026" H 7800 4325 50  0001 C CNN
F 1 "GND" H 7805 4402 50  0000 C CNN
F 2 "" H 7800 4575 50  0001 C CNN
F 3 "" H 7800 4575 50  0001 C CNN
	1    7800 4575
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR025
U 1 1 66039F48
P 7800 3175
F 0 "#PWR025" H 7800 3025 50  0001 C CNN
F 1 "+5P" H 7815 3348 50  0000 C CNN
F 2 "" H 7800 3175 50  0001 C CNN
F 3 "" H 7800 3175 50  0001 C CNN
	1    7800 3175
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR08
U 1 1 6603AB04
P 2300 3650
F 0 "#PWR08" H 2300 3500 50  0001 C CNN
F 1 "+5P" H 2315 3823 50  0000 C CNN
F 2 "" H 2300 3650 50  0001 C CNN
F 3 "" H 2300 3650 50  0001 C CNN
	1    2300 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR02
U 1 1 6603BE76
P 900 3650
F 0 "#PWR02" H 900 3500 50  0001 C CNN
F 1 "+5P" H 915 3823 50  0000 C CNN
F 2 "" H 900 3650 50  0001 C CNN
F 3 "" H 900 3650 50  0001 C CNN
	1    900  3650
	1    0    0    -1  
$EndComp
Text GLabel 850  3000 0    50   Input ~ 0
~M1
Wire Wire Line
	950  3000 850  3000
Text GLabel 2000 5275 0    50   Input ~ 0
~M1
Wire Wire Line
	2150 5275 2000 5275
Wire Wire Line
	2000 5475 2150 5475
Wire Wire Line
	875  2800 950  2800
Text GLabel 875  2800 0    50   Input ~ 0
~RESET
Text GLabel 2000 5475 0    50   Input ~ 0
~RESET
Text GLabel 5350 4575 0    50   Input ~ 0
MEI
Text GLabel 5375 4700 0    50   Input ~ 0
MEO
Wire Wire Line
	5350 4575 7525 4575
Wire Wire Line
	7525 4575 7525 4800
Wire Wire Line
	7525 4800 8500 4800
Wire Wire Line
	8500 4800 8500 3975
Wire Wire Line
	8500 3975 8300 3975
Wire Wire Line
	5375 4700 7500 4700
Wire Wire Line
	7500 4700 7500 4825
Wire Wire Line
	7500 4825 8525 4825
Wire Wire Line
	8525 4825 8525 3875
Wire Wire Line
	8525 3875 8300 3875
$Comp
L RFT_Digitalschaltkreise:Z80PIO U4
U 1 1 66076B93
P 10350 2450
F 0 "U4" H 10375 3817 50  0000 C CNN
F 1 "Z80PIO" H 10375 3726 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 10450 2650 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/u855.gif" H 10450 2650 50  0001 C CNN
	1    10350 2450
	1    0    0    -1  
$EndComp
$Comp
L Zilog_Z80_Peripherals:SIO0-DIP-40 IC2
U 1 1 66078A6D
P 10100 4775
F 0 "IC2" H 10400 5156 50  0000 C CNN
F 1 "SIO0-DIP-40" H 10400 5065 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 10500 6625 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0183.pdf" H 9300 3625 50  0001 L CNN
F 4 "Z80 CMOS SIO/0 Z84C40 Zilog" H 10500 6425 50  0001 L CNN "Description"
F 5 "4.06" H 10500 6325 50  0001 L CNN "Height"
F 6 "Zilog" H 10500 6225 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 10500 6125 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 10500 6025 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 10500 5925 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 10500 5825 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 10500 5725 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 10500 5625 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 10500 5525 50  0001 L CNN "Allied Price/Stock"
	1    10100 4775
	1    0    0    -1  
$EndComp
$Comp
L Zilog_Z80_Peripherals:CTC-DIP-28 IC1
U 1 1 6607AFC8
P 10025 7875
F 0 "IC1" H 10425 8256 50  0000 C CNN
F 1 "CTC-DIP-28" H 10425 8165 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 11475 8875 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0181.pdf" H 11475 8775 50  0001 L CNN
F 4 "Z8430 Zilog CTC" H 11475 8675 50  0001 L CNN "Description"
F 5 "5.21" H 11475 8575 50  0001 L CNN "Height"
F 6 "Zilog" H 11475 8475 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C3010PEG" H 11475 8375 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C3010PEG" H 11475 8275 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C3010PEG" H 11475 8175 50  0001 L CNN "Mouser Price/Stock"
	1    10025 7875
	1    0    0    -1  
$EndComp
$Comp
L RFT_Digitalschaltkreise:Z80PIO U4
U 2 1 6607C671
P 3425 9600
F 0 "U4" H 3513 9646 50  0000 L CNN
F 1 "Z80PIO" H 3513 9555 50  0000 L CNN
F 2 "" H 3525 9800 50  0001 C CNN
F 3 "https://www-user.tu-chemnitz.de/~heha/basteln/Konsumg%C3%BCter/DDR-Halbleiter/u855.gif" H 3525 9800 50  0001 C CNN
	2    3425 9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5375 3250 5375
Wire Wire Line
	3250 5375 3250 2950
Wire Wire Line
	3250 2950 9900 2950
Wire Wire Line
	8300 3575 8575 3575
Wire Wire Line
	8575 3575 8575 2850
Wire Wire Line
	8575 2850 9900 2850
Wire Wire Line
	9900 2650 9400 2650
Wire Wire Line
	9900 2750 9400 2750
Text GLabel 9400 2650 0    50   Input ~ 0
A0
Text GLabel 9400 2750 0    50   Input ~ 0
A1
Wire Wire Line
	9900 3150 9400 3150
Wire Wire Line
	9900 3300 9400 3300
Text GLabel 9400 3150 0    50   Input ~ 0
~RD
Text GLabel 9400 3300 0    50   Input ~ 0
TAKT
Wire Wire Line
	9900 1400 9650 1400
Wire Wire Line
	9900 1500 9650 1500
Wire Wire Line
	9900 1600 9650 1600
Wire Wire Line
	9900 1700 9650 1700
Wire Wire Line
	9900 1800 9650 1800
Wire Wire Line
	9900 1900 9650 1900
Wire Wire Line
	9900 2000 9650 2000
Wire Wire Line
	9900 2100 9650 2100
Text GLabel 9650 1400 0    50   Input ~ 0
DB0
Text GLabel 9650 1500 0    50   Input ~ 0
DB1
Text GLabel 9650 1600 0    50   Input ~ 0
DB2
Text GLabel 9650 1700 0    50   Input ~ 0
DB3
Text GLabel 9650 1800 0    50   Input ~ 0
DB4
Text GLabel 9650 1900 0    50   Input ~ 0
DB5
Text GLabel 9650 2000 0    50   Input ~ 0
DB6
Text GLabel 9650 2100 0    50   Input ~ 0
DB7
Wire Wire Line
	9900 4825 9650 4825
Wire Wire Line
	9900 4925 9650 4925
Wire Wire Line
	9900 5025 9650 5025
Wire Wire Line
	9900 5125 9650 5125
Wire Wire Line
	9900 5225 9650 5225
Wire Wire Line
	9900 5325 9650 5325
Wire Wire Line
	9900 5425 9650 5425
Wire Wire Line
	9900 5525 9650 5525
Text GLabel 9650 4825 0    50   Input ~ 0
DB0
Text GLabel 9650 4925 0    50   Input ~ 0
DB1
Text GLabel 9650 5025 0    50   Input ~ 0
DB2
Text GLabel 9650 5125 0    50   Input ~ 0
DB3
Text GLabel 9650 5225 0    50   Input ~ 0
DB4
Text GLabel 9650 5325 0    50   Input ~ 0
DB5
Text GLabel 9650 5425 0    50   Input ~ 0
DB6
Text GLabel 9650 5525 0    50   Input ~ 0
DB7
Wire Wire Line
	9825 7925 9575 7925
Wire Wire Line
	9825 8025 9575 8025
Wire Wire Line
	9825 8125 9575 8125
Wire Wire Line
	9825 8225 9575 8225
Wire Wire Line
	9825 8325 9575 8325
Wire Wire Line
	9825 8425 9575 8425
Wire Wire Line
	9825 8525 9575 8525
Wire Wire Line
	9825 8625 9575 8625
Text GLabel 9575 7925 0    50   Input ~ 0
DB0
Text GLabel 9575 8025 0    50   Input ~ 0
DB1
Text GLabel 9575 8125 0    50   Input ~ 0
DB2
Text GLabel 9575 8225 0    50   Input ~ 0
DB3
Text GLabel 9575 8325 0    50   Input ~ 0
DB4
Text GLabel 9575 8425 0    50   Input ~ 0
DB5
Text GLabel 9575 8525 0    50   Input ~ 0
DB6
Text GLabel 9575 8625 0    50   Input ~ 0
DB7
Wire Wire Line
	8300 3675 8575 3675
Wire Wire Line
	8575 5675 9900 5675
Wire Wire Line
	8575 3675 8575 5675
Wire Wire Line
	8300 3775 8600 3775
Wire Wire Line
	8600 3775 8600 8775
Wire Wire Line
	8600 8775 9825 8775
Wire Wire Line
	9900 6775 9400 6775
Wire Wire Line
	9900 6875 9400 6875
Text GLabel 9400 6775 0    50   Input ~ 0
A0
Text GLabel 9400 6875 0    50   Input ~ 0
A1
Wire Wire Line
	9825 8875 9325 8875
Wire Wire Line
	9825 8975 9325 8975
Text GLabel 9325 8875 0    50   Input ~ 0
A0
Text GLabel 9325 8975 0    50   Input ~ 0
A1
Wire Wire Line
	9825 9075 9325 9075
Wire Wire Line
	9825 9175 9325 9175
Wire Wire Line
	9825 9275 9325 9275
Wire Wire Line
	9825 9625 9325 9625
Text GLabel 9325 9625 0    50   Input ~ 0
~INT
Text GLabel 9325 9275 0    50   Input ~ 0
~RD
Text GLabel 9325 9175 0    50   Input ~ 0
~IORQ
Text GLabel 9325 9075 0    50   Input ~ 0
~M1
Wire Wire Line
	9900 6425 9400 6425
Wire Wire Line
	9900 6075 9400 6075
Wire Wire Line
	9900 6275 9400 6275
Wire Wire Line
	9900 5975 9400 5975
Wire Wire Line
	9900 5875 9400 5875
Wire Wire Line
	9900 5775 9400 5775
Text GLabel 9400 5775 0    50   Input ~ 0
~RESET
Text GLabel 9400 5875 0    50   Input ~ 0
~M1
Text GLabel 9400 5975 0    50   Input ~ 0
~IORQ
Text GLabel 9400 6075 0    50   Input ~ 0
~RD
Text GLabel 9400 6275 0    50   Input ~ 0
TAKT
Text GLabel 9400 6425 0    50   Input ~ 0
~INT
Wire Wire Line
	9825 9425 9650 9425
Wire Wire Line
	9650 9425 9650 6625
Wire Wire Line
	9650 6625 9900 6625
Wire Wire Line
	6350 5125 6250 5125
Text GLabel 5950 5125 0    50   Input ~ 0
IEI
Wire Wire Line
	6250 5125 6250 4725
Wire Wire Line
	6250 4725 7475 4725
Wire Wire Line
	7475 4725 7475 4850
Wire Wire Line
	7475 4850 8625 4850
Wire Wire Line
	8625 4850 8625 3450
Wire Wire Line
	8625 3450 9900 3450
Connection ~ 6250 5125
Wire Wire Line
	6250 5125 5950 5125
Wire Wire Line
	10850 3550 10950 3550
Wire Wire Line
	10950 3550 10950 3675
Wire Wire Line
	10950 3675 8650 3675
Wire Wire Line
	8650 3675 8650 6525
Wire Wire Line
	8650 6525 9900 6525
Wire Wire Line
	10850 3450 10975 3450
Wire Wire Line
	10975 3450 10975 3700
Wire Wire Line
	10975 3700 9675 3700
Wire Wire Line
	9675 3700 9675 3550
Wire Wire Line
	9675 3550 9425 3550
Text GLabel 9425 3550 0    50   Input ~ 0
~INT
Wire Wire Line
	11025 8625 11150 8625
Wire Wire Line
	11150 8625 11150 8825
Wire Wire Line
	11150 8825 11025 8825
Wire Wire Line
	11025 8225 11150 8225
Wire Wire Line
	11150 8225 11150 7925
Wire Wire Line
	11150 7925 11025 7925
$Comp
L 74xx:74LS74 U1
U 2 1 66215567
P 5625 6175
F 0 "U1" H 5625 6656 50  0000 C CNN
F 1 "74LS74" H 5625 6565 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5625 6175 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5625 6175 50  0001 C CNN
	2    5625 6175
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U1
U 3 1 662173BB
P 1150 9675
F 0 "U1" H 1380 9721 50  0000 L CNN
F 1 "74LS74" H 1380 9630 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1150 9675 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1150 9675 50  0001 C CNN
	3    1150 9675
	1    0    0    -1  
$EndComp
Text GLabel 4975 6175 0    50   Input ~ 0
TAKT
Wire Wire Line
	5325 6175 4975 6175
Wire Wire Line
	5925 6275 6025 6275
Wire Wire Line
	6025 6275 6025 6600
Wire Wire Line
	6025 6600 5250 6600
Wire Wire Line
	5250 6600 5250 6075
Wire Wire Line
	5250 6075 5325 6075
Wire Wire Line
	5925 6075 8625 6075
Wire Wire Line
	8625 7425 11150 7425
Wire Wire Line
	11150 7425 11150 7925
Wire Wire Line
	8625 6075 8625 7425
Connection ~ 11150 7925
Wire Wire Line
	5625 5875 5625 4275
Wire Wire Line
	5625 4275 5950 4275
Wire Wire Line
	5950 4275 5950 1900
Wire Wire Line
	5950 1900 6000 1900
Wire Wire Line
	6000 1900 6000 1025
Wire Wire Line
	6100 4300 5650 4300
Wire Wire Line
	5650 4300 5650 5650
Wire Wire Line
	5650 5650 5225 5650
Wire Wire Line
	5225 5650 5225 6525
Wire Wire Line
	5225 6525 5625 6525
Wire Wire Line
	5625 6525 5625 6475
Wire Wire Line
	6100 1025 6100 4300
Wire Wire Line
	9825 9525 9625 9525
Wire Wire Line
	9625 9525 9625 6625
Wire Wire Line
	9625 6625 8575 6625
Wire Wire Line
	8575 6625 8575 5700
Wire Wire Line
	8575 5700 8550 5700
Wire Wire Line
	8550 5700 8550 5525
Wire Wire Line
	8550 5525 6175 5525
Wire Wire Line
	6175 5525 6175 5325
Wire Wire Line
	6175 5325 6350 5325
Wire Wire Line
	6950 5225 7175 5225
Text GLabel 7175 5225 2    50   Input ~ 0
IEO
Wire Wire Line
	11025 9025 11150 9025
Wire Wire Line
	11150 9025 11150 10275
Wire Wire Line
	11150 10275 9375 10275
Wire Wire Line
	11025 9225 11125 9225
Wire Wire Line
	11125 9225 11125 10150
Wire Wire Line
	11125 10150 9375 10150
Text GLabel 9375 10150 0    50   Input ~ 0
TAKT
Text GLabel 9375 10275 0    50   Input ~ 0
~RESET
$Comp
L power:GND #PWR030
U 1 1 662E5B35
P 10425 9875
F 0 "#PWR030" H 10425 9625 50  0001 C CNN
F 1 "GND" H 10430 9702 50  0000 C CNN
F 2 "" H 10425 9875 50  0001 C CNN
F 3 "" H 10425 9875 50  0001 C CNN
	1    10425 9875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 662E7264
P 10400 7125
F 0 "#PWR028" H 10400 6875 50  0001 C CNN
F 1 "GND" H 10405 6952 50  0000 C CNN
F 2 "" H 10400 7125 50  0001 C CNN
F 3 "" H 10400 7125 50  0001 C CNN
	1    10400 7125
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR029
U 1 1 662E7924
P 10425 7675
F 0 "#PWR029" H 10425 7525 50  0001 C CNN
F 1 "+5P" H 10440 7848 50  0000 C CNN
F 2 "" H 10425 7675 50  0001 C CNN
F 3 "" H 10425 7675 50  0001 C CNN
	1    10425 7675
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR027
U 1 1 662E88BB
P 10400 4575
F 0 "#PWR027" H 10400 4425 50  0001 C CNN
F 1 "+5P" H 10415 4748 50  0000 C CNN
F 2 "" H 10400 4575 50  0001 C CNN
F 3 "" H 10400 4575 50  0001 C CNN
	1    10400 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 662E9905
P 1150 10075
F 0 "#PWR04" H 1150 9825 50  0001 C CNN
F 1 "GND" H 1155 9902 50  0000 C CNN
F 2 "" H 1150 10075 50  0001 C CNN
F 3 "" H 1150 10075 50  0001 C CNN
	1    1150 10075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 662E9DE7
P 1875 10200
F 0 "#PWR06" H 1875 9950 50  0001 C CNN
F 1 "GND" H 1880 10027 50  0000 C CNN
F 2 "" H 1875 10200 50  0001 C CNN
F 3 "" H 1875 10200 50  0001 C CNN
	1    1875 10200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 662EA297
P 2675 10200
F 0 "#PWR011" H 2675 9950 50  0001 C CNN
F 1 "GND" H 2680 10027 50  0000 C CNN
F 2 "" H 2675 10200 50  0001 C CNN
F 3 "" H 2675 10200 50  0001 C CNN
	1    2675 10200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 662EA573
P 3425 9800
F 0 "#PWR013" H 3425 9550 50  0001 C CNN
F 1 "GND" H 3430 9627 50  0000 C CNN
F 2 "" H 3425 9800 50  0001 C CNN
F 3 "" H 3425 9800 50  0001 C CNN
	1    3425 9800
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR03
U 1 1 662EB2B5
P 1150 9275
F 0 "#PWR03" H 1150 9125 50  0001 C CNN
F 1 "+5P" H 1165 9448 50  0000 C CNN
F 2 "" H 1150 9275 50  0001 C CNN
F 3 "" H 1150 9275 50  0001 C CNN
	1    1150 9275
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR05
U 1 1 662EB75F
P 1875 9200
F 0 "#PWR05" H 1875 9050 50  0001 C CNN
F 1 "+5P" H 1890 9373 50  0000 C CNN
F 2 "" H 1875 9200 50  0001 C CNN
F 3 "" H 1875 9200 50  0001 C CNN
	1    1875 9200
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR010
U 1 1 662EBB67
P 2675 9200
F 0 "#PWR010" H 2675 9050 50  0001 C CNN
F 1 "+5P" H 2690 9373 50  0000 C CNN
F 2 "" H 2675 9200 50  0001 C CNN
F 3 "" H 2675 9200 50  0001 C CNN
	1    2675 9200
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR012
U 1 1 662EBE9E
P 3425 9400
F 0 "#PWR012" H 3425 9250 50  0001 C CNN
F 1 "+5P" H 3440 9573 50  0000 C CNN
F 2 "" H 3425 9400 50  0001 C CNN
F 3 "" H 3425 9400 50  0001 C CNN
	1    3425 9400
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:MAX232I U7
U 1 1 66308DB1
P 13925 5950
F 0 "U7" H 13925 7331 50  0000 C CNN
F 1 "MAX232I" H 13925 7240 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 13975 4900 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 13925 6050 50  0001 C CNN
	1    13925 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 663467EB
P 14950 5200
F 0 "C12" H 15065 5246 50  0000 L CNN
F 1 "1µ" H 15065 5155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 14988 5050 50  0001 C CNN
F 3 "~" H 14950 5200 50  0001 C CNN
	1    14950 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	14725 5050 14950 5050
Wire Wire Line
	14725 5350 14950 5350
$Comp
L Device:C C9
U 1 1 6636D821
P 12925 5200
F 0 "C9" H 13040 5246 50  0000 L CNN
F 1 "1µ" H 13040 5155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 12963 5050 50  0001 C CNN
F 3 "~" H 12925 5200 50  0001 C CNN
	1    12925 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	13125 5050 12925 5050
Wire Wire Line
	13125 5350 12925 5350
$Comp
L Device:C C15
U 1 1 66393DD6
P 15350 5300
F 0 "C15" H 15465 5346 50  0000 L CNN
F 1 "1µ" H 15465 5255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 15388 5150 50  0001 C CNN
F 3 "~" H 15350 5300 50  0001 C CNN
	1    15350 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 66394386
P 15200 5750
F 0 "C14" V 14948 5750 50  0000 C CNN
F 1 "1µ" V 15039 5750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 15238 5600 50  0001 C CNN
F 3 "~" H 15200 5750 50  0001 C CNN
	1    15200 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	14725 5550 15025 5550
Wire Wire Line
	15025 5550 15025 5450
Wire Wire Line
	15025 5450 15350 5450
Wire Wire Line
	14725 5850 15050 5850
Wire Wire Line
	15050 5850 15050 5750
$Comp
L power:GND #PWR041
U 1 1 663E238D
P 13925 7150
F 0 "#PWR041" H 13925 6900 50  0001 C CNN
F 1 "GND" H 13930 6977 50  0000 C CNN
F 2 "" H 13925 7150 50  0001 C CNN
F 3 "" H 13925 7150 50  0001 C CNN
	1    13925 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 663E2881
P 15350 5750
F 0 "#PWR047" H 15350 5500 50  0001 C CNN
F 1 "GND" H 15355 5577 50  0000 C CNN
F 2 "" H 15350 5750 50  0001 C CNN
F 3 "" H 15350 5750 50  0001 C CNN
	1    15350 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR046
U 1 1 663E3925
P 15350 5150
F 0 "#PWR046" H 15350 5000 50  0001 C CNN
F 1 "+5P" H 15365 5323 50  0000 C CNN
F 2 "" H 15350 5150 50  0001 C CNN
F 3 "" H 15350 5150 50  0001 C CNN
	1    15350 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR040
U 1 1 663E3D88
P 13925 4750
F 0 "#PWR040" H 13925 4600 50  0001 C CNN
F 1 "+5P" H 13940 4923 50  0000 C CNN
F 2 "" H 13925 4750 50  0001 C CNN
F 3 "" H 13925 4750 50  0001 C CNN
	1    13925 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 663E404D
P 12575 5175
F 0 "C8" H 12690 5221 50  0000 L CNN
F 1 "1µ" H 12690 5130 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 12613 5025 50  0001 C CNN
F 3 "~" H 12575 5175 50  0001 C CNN
	1    12575 5175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR037
U 1 1 663E487F
P 12575 5325
F 0 "#PWR037" H 12575 5075 50  0001 C CNN
F 1 "GND" H 12580 5152 50  0000 C CNN
F 2 "" H 12575 5325 50  0001 C CNN
F 3 "" H 12575 5325 50  0001 C CNN
	1    12575 5325
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR036
U 1 1 663E4C9D
P 12575 5025
F 0 "#PWR036" H 12575 4875 50  0001 C CNN
F 1 "+5P" H 12590 5198 50  0000 C CNN
F 2 "" H 12575 5025 50  0001 C CNN
F 3 "" H 12575 5025 50  0001 C CNN
	1    12575 5025
	1    0    0    -1  
$EndComp
$Comp
L Interface_UART:MAX232I U6
U 1 1 663F95E7
P 13550 8475
F 0 "U6" H 13550 9856 50  0000 C CNN
F 1 "MAX232I" H 13550 9765 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 13600 7425 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 13550 8575 50  0001 C CNN
	1    13550 8475
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 663FA1D7
P 14575 7725
F 0 "C10" H 14690 7771 50  0000 L CNN
F 1 "1µ" H 14690 7680 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 14613 7575 50  0001 C CNN
F 3 "~" H 14575 7725 50  0001 C CNN
	1    14575 7725
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 7575 14575 7575
Wire Wire Line
	14350 7875 14575 7875
$Comp
L Device:C C7
U 1 1 663FA1E3
P 12550 7725
F 0 "C7" H 12665 7771 50  0000 L CNN
F 1 "1µ" H 12665 7680 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 12588 7575 50  0001 C CNN
F 3 "~" H 12550 7725 50  0001 C CNN
	1    12550 7725
	1    0    0    -1  
$EndComp
Wire Wire Line
	12750 7575 12550 7575
Wire Wire Line
	12750 7875 12550 7875
$Comp
L Device:C C13
U 1 1 663FA1EF
P 14975 7825
F 0 "C13" H 15090 7871 50  0000 L CNN
F 1 "1µ" H 15090 7780 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 15013 7675 50  0001 C CNN
F 3 "~" H 14975 7825 50  0001 C CNN
	1    14975 7825
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 663FA1F9
P 14825 8275
F 0 "C11" V 14573 8275 50  0000 C CNN
F 1 "1µ" V 14664 8275 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 14863 8125 50  0001 C CNN
F 3 "~" H 14825 8275 50  0001 C CNN
	1    14825 8275
	0    1    1    0   
$EndComp
Wire Wire Line
	14350 8075 14650 8075
Wire Wire Line
	14650 8075 14650 7975
Wire Wire Line
	14650 7975 14975 7975
Wire Wire Line
	14350 8375 14675 8375
Wire Wire Line
	14675 8375 14675 8275
$Comp
L power:GND #PWR039
U 1 1 663FA208
P 13550 9675
F 0 "#PWR039" H 13550 9425 50  0001 C CNN
F 1 "GND" H 13555 9502 50  0000 C CNN
F 2 "" H 13550 9675 50  0001 C CNN
F 3 "" H 13550 9675 50  0001 C CNN
	1    13550 9675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 663FA212
P 14975 8275
F 0 "#PWR044" H 14975 8025 50  0001 C CNN
F 1 "GND" H 14980 8102 50  0000 C CNN
F 2 "" H 14975 8275 50  0001 C CNN
F 3 "" H 14975 8275 50  0001 C CNN
	1    14975 8275
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR043
U 1 1 663FA21C
P 14975 7675
F 0 "#PWR043" H 14975 7525 50  0001 C CNN
F 1 "+5P" H 14990 7848 50  0000 C CNN
F 2 "" H 14975 7675 50  0001 C CNN
F 3 "" H 14975 7675 50  0001 C CNN
	1    14975 7675
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR038
U 1 1 663FA226
P 13550 7275
F 0 "#PWR038" H 13550 7125 50  0001 C CNN
F 1 "+5P" H 13565 7448 50  0000 C CNN
F 2 "" H 13550 7275 50  0001 C CNN
F 3 "" H 13550 7275 50  0001 C CNN
	1    13550 7275
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 663FA230
P 12200 7700
F 0 "C6" H 12315 7746 50  0000 L CNN
F 1 "1µ" H 12315 7655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 12238 7550 50  0001 C CNN
F 3 "~" H 12200 7700 50  0001 C CNN
	1    12200 7700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 663FA23A
P 12200 7850
F 0 "#PWR035" H 12200 7600 50  0001 C CNN
F 1 "GND" H 12205 7677 50  0000 C CNN
F 2 "" H 12200 7850 50  0001 C CNN
F 3 "" H 12200 7850 50  0001 C CNN
	1    12200 7850
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR034
U 1 1 663FA244
P 12200 7550
F 0 "#PWR034" H 12200 7400 50  0001 C CNN
F 1 "+5P" H 12215 7723 50  0000 C CNN
F 2 "" H 12200 7550 50  0001 C CNN
F 3 "" H 12200 7550 50  0001 C CNN
	1    12200 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	13125 6450 12325 6450
Wire Wire Line
	12325 6450 12325 4825
Wire Wire Line
	12325 4825 10900 4825
Wire Wire Line
	10900 5025 12300 5025
Wire Wire Line
	12300 5025 12300 6050
Wire Wire Line
	12300 6050 13125 6050
Wire Wire Line
	12275 5675 12275 6250
Wire Wire Line
	12275 6250 13125 6250
Wire Wire Line
	10900 5675 12275 5675
Wire Wire Line
	13125 6650 12250 6650
Wire Wire Line
	12250 6650 12250 5575
Wire Wire Line
	12250 5575 10900 5575
Wire Wire Line
	10900 5775 11075 5775
Wire Wire Line
	11075 5775 11075 6875
$Comp
L power:GND #PWR031
U 1 1 66484E5C
P 11075 7075
F 0 "#PWR031" H 11075 6825 50  0001 C CNN
F 1 "GND" H 11080 6902 50  0000 C CNN
F 2 "" H 11075 7075 50  0001 C CNN
F 3 "" H 11075 7075 50  0001 C CNN
	1    11075 7075
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 5925 12225 5925
Wire Wire Line
	12225 5925 12225 7075
Wire Wire Line
	12225 7075 12375 7075
Wire Wire Line
	12375 7075 12375 8975
Wire Wire Line
	12375 8975 12750 8975
Wire Wire Line
	12750 9175 12075 9175
Wire Wire Line
	10900 6675 12075 6675
Wire Wire Line
	12075 6675 12075 9175
Wire Wire Line
	10900 6875 11075 6875
Connection ~ 11075 6875
Wire Wire Line
	11075 6875 11075 7075
Wire Wire Line
	10900 6775 12050 6775
Wire Wire Line
	12050 6775 12050 8775
Wire Wire Line
	12050 8775 12750 8775
Wire Wire Line
	10900 6125 12100 6125
Wire Wire Line
	12100 6125 12100 8575
Wire Wire Line
	12100 8575 12750 8575
Wire Wire Line
	14725 6050 14825 6050
Wire Wire Line
	14825 6050 14825 4350
Wire Wire Line
	14825 4350 13475 4350
Wire Wire Line
	13475 4350 13475 3025
Wire Wire Line
	13475 3025 14175 3025
Wire Wire Line
	14175 3225 13500 3225
Wire Wire Line
	13500 3225 13500 4325
Wire Wire Line
	13500 4325 14850 4325
Wire Wire Line
	14850 4325 14850 6450
Wire Wire Line
	14850 6450 14725 6450
Wire Wire Line
	14175 3425 13525 3425
Wire Wire Line
	13525 3425 13525 4300
Wire Wire Line
	13525 4300 14800 4300
Wire Wire Line
	14800 4300 14800 6250
Wire Wire Line
	14800 6250 14725 6250
Wire Wire Line
	14725 6650 14775 6650
Wire Wire Line
	14775 6650 14775 4275
Wire Wire Line
	14775 4275 13550 4275
Wire Wire Line
	13550 4275 13550 3625
Wire Wire Line
	13550 3625 14175 3625
Wire Wire Line
	15750 8575 14350 8575
Wire Wire Line
	14350 8975 15775 8975
Wire Wire Line
	15775 8975 15775 4200
Wire Wire Line
	15800 8775 14350 8775
Wire Wire Line
	14350 9175 15825 9175
Wire Wire Line
	15825 9175 15825 4250
Wire Wire Line
	13975 4125 13975 3825
Wire Wire Line
	13975 3825 14175 3825
$Comp
L Connector:DB9_Female J3
U 1 1 66666D7E
P 14475 3425
F 0 "J3" H 14393 2733 50  0000 C CNN
F 1 "Dual_V24" H 14393 2824 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 14475 3425 50  0001 C CNN
F 3 " ~" H 14475 3425 50  0001 C CNN
	1    14475 3425
	1    0    0    -1  
$EndComp
Wire Wire Line
	14175 3725 14125 3725
Wire Wire Line
	14125 3725 14125 4250
Wire Wire Line
	14125 4250 15825 4250
Wire Wire Line
	15800 4225 14100 4225
Wire Wire Line
	14100 4225 14100 3525
Wire Wire Line
	14100 3525 14175 3525
Wire Wire Line
	15800 4225 15800 8775
Wire Wire Line
	15775 4200 14075 4200
Wire Wire Line
	14075 4200 14075 3325
Wire Wire Line
	14075 3325 14175 3325
Wire Wire Line
	15750 4175 14050 4175
Wire Wire Line
	14050 4175 14050 3125
Wire Wire Line
	14050 3125 14175 3125
Wire Wire Line
	15750 4175 15750 8575
$Comp
L power:GND #PWR042
U 1 1 66720448
P 13975 4125
F 0 "#PWR042" H 13975 3875 50  0001 C CNN
F 1 "GND" H 13980 3952 50  0000 C CNN
F 2 "" H 13975 4125 50  0001 C CNN
F 3 "" H 13975 4125 50  0001 C CNN
	1    13975 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	10975 2000 10975 1025
Wire Wire Line
	10975 1025 7200 1025
Wire Wire Line
	7200 1025 7200 1250
Connection ~ 10975 2000
Wire Wire Line
	10975 2000 10850 2000
Wire Wire Line
	6200 1025 6200 1250
Wire Wire Line
	6200 1250 7200 1250
$Comp
L power:+5P #PWR024
U 1 1 668C9A85
P 5900 625
F 0 "#PWR024" H 5900 475 50  0001 C CNN
F 1 "+5P" H 5915 798 50  0000 C CNN
F 2 "" H 5900 625 50  0001 C CNN
F 3 "" H 5900 625 50  0001 C CNN
	1    5900 625 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 668C9FA7
P 12200 4200
F 0 "#PWR033" H 12200 3950 50  0001 C CNN
F 1 "GND" H 12205 4027 50  0000 C CNN
F 2 "" H 12200 4200 50  0001 C CNN
F 3 "" H 12200 4200 50  0001 C CNN
	1    12200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 2850 11175 2850
Wire Wire Line
	11175 2850 11175 2775
Wire Wire Line
	10850 2950 11200 2950
Wire Wire Line
	11200 2950 11200 2800
Wire Wire Line
	10850 3050 11225 3050
Wire Wire Line
	10850 3150 11250 3150
Wire Wire Line
	11250 3150 11250 2725
Wire Wire Line
	9900 2250 9550 2250
Wire Wire Line
	9550 2250 9550 2450
Wire Wire Line
	9550 2450 9900 2450
Wire Wire Line
	9550 2250 9125 2250
Wire Wire Line
	9125 2250 9125 7400
Wire Wire Line
	9125 7400 11175 7400
Wire Wire Line
	11175 7400 11175 8525
Wire Wire Line
	11175 8525 11025 8525
Connection ~ 9550 2250
Wire Wire Line
	11025 8025 11200 8025
Wire Wire Line
	11200 8025 11200 5125
Wire Wire Line
	11200 5125 10900 5125
Wire Wire Line
	10900 4925 11200 4925
Wire Wire Line
	11200 4925 11200 5125
Connection ~ 11200 5125
Wire Wire Line
	10900 6025 11225 6025
Wire Wire Line
	11225 6025 11225 8325
Wire Wire Line
	11025 8325 11225 8325
$Comp
L Device:C C1
U 1 1 66C905C9
P 4000 9575
F 0 "C1" H 4115 9621 50  0000 L CNN
F 1 "100n" H 4115 9530 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4038 9425 50  0001 C CNN
F 3 "~" H 4000 9575 50  0001 C CNN
	1    4000 9575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 66C90937
P 4000 9725
F 0 "#PWR015" H 4000 9475 50  0001 C CNN
F 1 "GND" H 4005 9552 50  0000 C CNN
F 2 "" H 4000 9725 50  0001 C CNN
F 3 "" H 4000 9725 50  0001 C CNN
	1    4000 9725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR014
U 1 1 66C90DEF
P 4000 9425
F 0 "#PWR014" H 4000 9275 50  0001 C CNN
F 1 "+5P" H 4015 9598 50  0000 C CNN
F 2 "" H 4000 9425 50  0001 C CNN
F 3 "" H 4000 9425 50  0001 C CNN
	1    4000 9425
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 66CBEBC3
P 4425 9575
F 0 "C2" H 4540 9621 50  0000 L CNN
F 1 "100n" H 4540 9530 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4463 9425 50  0001 C CNN
F 3 "~" H 4425 9575 50  0001 C CNN
	1    4425 9575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 66CBEBC9
P 4425 9725
F 0 "#PWR017" H 4425 9475 50  0001 C CNN
F 1 "GND" H 4430 9552 50  0000 C CNN
F 2 "" H 4425 9725 50  0001 C CNN
F 3 "" H 4425 9725 50  0001 C CNN
	1    4425 9725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR016
U 1 1 66CBEBCF
P 4425 9425
F 0 "#PWR016" H 4425 9275 50  0001 C CNN
F 1 "+5P" H 4440 9598 50  0000 C CNN
F 2 "" H 4425 9425 50  0001 C CNN
F 3 "" H 4425 9425 50  0001 C CNN
	1    4425 9425
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 66CEA046
P 4800 9575
F 0 "C3" H 4915 9621 50  0000 L CNN
F 1 "100n" H 4915 9530 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4838 9425 50  0001 C CNN
F 3 "~" H 4800 9575 50  0001 C CNN
	1    4800 9575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 66CEA04C
P 4800 9725
F 0 "#PWR019" H 4800 9475 50  0001 C CNN
F 1 "GND" H 4805 9552 50  0000 C CNN
F 2 "" H 4800 9725 50  0001 C CNN
F 3 "" H 4800 9725 50  0001 C CNN
	1    4800 9725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR018
U 1 1 66CEA052
P 4800 9425
F 0 "#PWR018" H 4800 9275 50  0001 C CNN
F 1 "+5P" H 4815 9598 50  0000 C CNN
F 2 "" H 4800 9425 50  0001 C CNN
F 3 "" H 4800 9425 50  0001 C CNN
	1    4800 9425
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 66D15439
P 5150 9575
F 0 "C4" H 5265 9621 50  0000 L CNN
F 1 "100n" H 5265 9530 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5188 9425 50  0001 C CNN
F 3 "~" H 5150 9575 50  0001 C CNN
	1    5150 9575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 66D1543F
P 5150 9725
F 0 "#PWR021" H 5150 9475 50  0001 C CNN
F 1 "GND" H 5155 9552 50  0000 C CNN
F 2 "" H 5150 9725 50  0001 C CNN
F 3 "" H 5150 9725 50  0001 C CNN
	1    5150 9725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR020
U 1 1 66D15445
P 5150 9425
F 0 "#PWR020" H 5150 9275 50  0001 C CNN
F 1 "+5P" H 5165 9598 50  0000 C CNN
F 2 "" H 5150 9425 50  0001 C CNN
F 3 "" H 5150 9425 50  0001 C CNN
	1    5150 9425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 66D422CC
P 5575 9725
F 0 "#PWR023" H 5575 9475 50  0001 C CNN
F 1 "GND" H 5580 9552 50  0000 C CNN
F 2 "" H 5575 9725 50  0001 C CNN
F 3 "" H 5575 9725 50  0001 C CNN
	1    5575 9725
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR022
U 1 1 66D422D2
P 5575 9425
F 0 "#PWR022" H 5575 9275 50  0001 C CNN
F 1 "+5P" H 5590 9598 50  0000 C CNN
F 2 "" H 5575 9425 50  0001 C CNN
F 3 "" H 5575 9425 50  0001 C CNN
	1    5575 9425
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 66D6E219
P 5575 9575
F 0 "C5" H 5693 9621 50  0000 L CNN
F 1 "560µ" H 5693 9530 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5613 9425 50  0001 C CNN
F 3 "~" H 5575 9575 50  0001 C CNN
	1    5575 9575
	1    0    0    -1  
$EndComp
Text GLabel 2250 3300 2    50   Input ~ 0
~BI
Text GLabel 8450 1875 0    50   Input ~ 0
~BI
Wire Wire Line
	8450 1875 8600 1875
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 66229150
P 8800 1875
F 0 "J1" H 8880 1867 50  0000 L CNN
F 1 "Conn_01x02" H 8880 1776 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8800 1875 50  0001 C CNN
F 3 "~" H 8800 1875 50  0001 C CNN
	1    8800 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1975 8600 2250
Wire Wire Line
	8600 2250 9125 2250
Connection ~ 9125 2250
Wire Wire Line
	6300 1225 6300 1025
Wire Wire Line
	5075 1225 6300 1225
$Comp
L Device:R_Network07 RN2
U 1 1 662B7DB8
P 11675 850
F 0 "RN2" H 12063 896 50  0000 L CNN
F 1 "3K9" H 12063 805 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 11950 850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 11675 850 50  0001 C CNN
	1    11675 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR032
U 1 1 662B8FC2
P 11375 650
F 0 "#PWR032" H 11375 500 50  0001 C CNN
F 1 "+5P" H 11390 823 50  0000 C CNN
F 2 "" H 11375 650 50  0001 C CNN
F 3 "" H 11375 650 50  0001 C CNN
	1    11375 650 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1400 11375 1400
Wire Wire Line
	11375 1400 11375 1050
Wire Wire Line
	10850 1500 11475 1500
Wire Wire Line
	11475 1500 11475 1050
Connection ~ 11475 1500
Wire Wire Line
	10850 1600 11575 1600
Wire Wire Line
	11575 1600 11575 1050
Wire Wire Line
	10850 1700 11675 1700
Wire Wire Line
	11675 1700 11675 1050
Connection ~ 11675 1700
Wire Wire Line
	10850 1800 11775 1800
Wire Wire Line
	11775 1800 11775 1050
Wire Wire Line
	10850 1900 11875 1900
Wire Wire Line
	11875 1900 11875 1050
$Comp
L power:GND #PWR045
U 1 1 6655C5D2
P 15125 3300
F 0 "#PWR045" H 15125 3050 50  0001 C CNN
F 1 "GND" H 15130 3127 50  0000 C CNN
F 2 "" H 15125 3300 50  0001 C CNN
F 3 "" H 15125 3300 50  0001 C CNN
	1    15125 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR048
U 1 1 6655C8ED
P 15475 1800
F 0 "#PWR048" H 15475 1650 50  0001 C CNN
F 1 "+5P" H 15490 1973 50  0000 C CNN
F 2 "" H 15475 1800 50  0001 C CNN
F 3 "" H 15475 1800 50  0001 C CNN
	1    15475 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Male J4
U 1 1 660A862F
P 15550 2650
F 0 "J4" H 15730 2696 50  0000 L CNN
F 1 "Joy" H 15730 2605 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 15550 2650 50  0001 C CNN
F 3 " ~" H 15550 2650 50  0001 C CNN
	1    15550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	15250 3050 14875 3050
Wire Wire Line
	15250 2850 14900 2850
Wire Wire Line
	14900 2850 14900 1500
Wire Wire Line
	11475 1500 14900 1500
Wire Wire Line
	11575 1600 14925 1600
Wire Wire Line
	14925 1600 14925 2650
Wire Wire Line
	14925 2650 15250 2650
Connection ~ 11575 1600
Wire Wire Line
	14950 1700 14950 2450
Wire Wire Line
	14950 2450 15250 2450
Wire Wire Line
	11675 1700 14950 1700
Wire Wire Line
	11375 1400 14875 1400
Wire Wire Line
	14875 1400 14875 3050
Connection ~ 11375 1400
Wire Wire Line
	11775 1800 14850 1800
Wire Wire Line
	14850 1800 14850 2950
Wire Wire Line
	14850 2950 15250 2950
Connection ~ 11775 1800
Wire Wire Line
	15475 1800 14975 1800
Wire Wire Line
	14975 1800 14975 2750
Wire Wire Line
	14975 2750 15250 2750
Wire Wire Line
	11875 1900 14800 1900
Wire Wire Line
	14800 1900 14800 2350
Wire Wire Line
	14800 2350 15250 2350
Connection ~ 11875 1900
Wire Wire Line
	15250 2550 15125 2550
Wire Wire Line
	15125 2550 15125 3300
$Comp
L Connector:DB15_Female_HighDensity J2
U 1 1 6638136F
P 12625 3675
F 0 "J2" H 12625 4542 50  0000 C CNN
F 1 "LPT" H 12625 4451 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-15-HD_Female_Horizontal_P2.29x1.98mm_EdgePinOffset3.03mm_Housed_MountingHolesOffset4.94mm" H 11675 4075 50  0001 C CNN
F 3 " ~" H 11675 4075 50  0001 C CNN
	1    12625 3675
	1    0    0    -1  
$EndComp
Wire Wire Line
	12325 3275 11725 3275
Wire Wire Line
	11725 3275 11725 2100
Wire Wire Line
	11725 2100 10850 2100
Wire Wire Line
	12325 3475 11700 3475
Wire Wire Line
	11700 3475 11700 2450
Wire Wire Line
	11675 2550 11675 3675
Wire Wire Line
	11675 3675 12325 3675
Wire Wire Line
	11650 2650 11650 3875
Wire Wire Line
	11650 3875 12325 3875
Wire Wire Line
	11625 2750 11625 4075
Wire Wire Line
	11625 4075 12325 4075
Wire Wire Line
	12325 3975 12200 3975
Wire Wire Line
	12200 3975 12200 4200
Wire Wire Line
	12325 3175 12200 3175
Wire Wire Line
	12200 3175 12200 3375
Connection ~ 12200 3975
Wire Wire Line
	12325 3375 12200 3375
Connection ~ 12200 3375
Wire Wire Line
	12200 3375 12200 3575
Connection ~ 12200 3575
Wire Wire Line
	12200 3575 12200 3775
Wire Wire Line
	12325 3775 12200 3775
Connection ~ 12200 3775
Wire Wire Line
	12200 3775 12200 3975
Wire Wire Line
	12200 3575 12325 3575
Wire Wire Line
	12925 3275 13000 3275
Wire Wire Line
	13000 3275 13000 2775
Wire Wire Line
	13000 2775 11175 2775
Wire Wire Line
	12975 2800 12975 3475
Wire Wire Line
	12975 3475 12925 3475
Wire Wire Line
	11200 2800 12975 2800
Wire Wire Line
	11225 2825 12950 2825
Wire Wire Line
	12950 2825 12950 3675
Wire Wire Line
	12950 3675 12925 3675
Wire Wire Line
	11225 2825 11225 3050
Wire Wire Line
	10850 2750 11625 2750
Wire Wire Line
	12925 3875 13025 3875
Wire Wire Line
	13025 3875 13025 2725
Wire Wire Line
	13025 2725 11250 2725
Wire Wire Line
	10850 2650 11650 2650
Wire Wire Line
	10850 2550 11675 2550
Wire Wire Line
	10850 2450 11700 2450
Wire Wire Line
	12925 4075 13050 4075
Wire Wire Line
	13050 4075 13050 2000
Wire Wire Line
	10975 2000 13050 2000
$EndSCHEMATC
