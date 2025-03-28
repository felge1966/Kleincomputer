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
P 2300 2900
F 0 "#PWR07" H 2300 2650 50  0001 C CNN
F 1 "GND" H 2400 2800 50  0000 C CNN
F 2 "" H 2300 2900 50  0001 C CNN
F 3 "" H 2300 2900 50  0001 C CNN
	1    2300 2900
	0    -1   -1   0   
$EndComp
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
Wire Wire Line
	875  2800 950  2800
Text GLabel 875  2800 0    50   Input ~ 0
~RESET
Text GLabel 2250 3300 2    50   Input ~ 0
~BI
$Comp
L 74xx:74LS138 U5
U 1 1 6625BECB
P 5225 3575
F 0 "U5" H 5225 4356 50  0000 C CNN
F 1 "74LS138" H 5225 4265 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5225 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5225 3575 50  0001 C CNN
	1    5225 3575
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS540 U4
U 1 1 6625DAF3
P 1500 5650
F 0 "U4" H 1500 6631 50  0000 C CNN
F 1 "74LS540" H 1500 6540 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1500 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS540" H 1500 5650 50  0001 C CNN
	1    1500 5650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U1
U 1 1 6625EA19
P 6475 5200
F 0 "U1" H 6475 5681 50  0000 C CNN
F 1 "74LS74" H 6475 5590 50  0000 C CNN
F 2 "" H 6475 5200 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6475 5200 50  0001 C CNN
	1    6475 5200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U1
U 2 1 6625ECBD
P 6475 6200
F 0 "U1" H 6475 6681 50  0000 C CNN
F 1 "74LS74" H 6475 6590 50  0000 C CNN
F 2 "" H 6475 6200 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6475 6200 50  0001 C CNN
	2    6475 6200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U1
U 3 1 66262298
P 1500 10250
F 0 "U1" H 1730 10296 50  0000 L CNN
F 1 "74LS74" H 1730 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1500 10250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1500 10250 50  0001 C CNN
	3    1500 10250
	1    0    0    -1  
$EndComp
$Comp
L Zilog_Z80_Peripherals:SIO2-DIP-40 IC1
U 1 1 66263843
P 10375 1900
F 0 "IC1" H 10675 2281 50  0000 C CNN
F 1 "SIO2-DIP-40" H 10675 2190 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 10425 3800 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0183.pdf" H 9575 750 50  0001 L CNN
F 4 "Z80 CMOS SIO/2 Z84C42 Zilog" H 10425 3600 50  0001 L CNN "Description"
F 5 "4.06" H 10775 3450 50  0001 L CNN "Height"
F 6 "Zilog" H 10775 3350 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 10425 3300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 10425 3200 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 10425 3100 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 10425 3000 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 10425 2900 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 10425 2800 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 10425 2700 50  0001 L CNN "Allied Price/Stock"
	1    10375 1900
	1    0    0    -1  
$EndComp
$Comp
L Zilog_Z80_Peripherals:CTC-DIP-28 IC2
U 1 1 66265C7A
P 13250 1900
F 0 "IC2" H 13650 2281 50  0000 C CNN
F 1 "CTC-DIP-28" H 13650 2190 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 14700 2900 50  0001 L CNN
F 3 "http://www.zilog.com/docs/z80/ps0181.pdf" H 14700 2800 50  0001 L CNN
F 4 "Z8430 Zilog CTC" H 14700 2700 50  0001 L CNN "Description"
F 5 "5.21" H 14700 2600 50  0001 L CNN "Height"
F 6 "Zilog" H 14700 2500 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C3010PEG" H 14700 2400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C3010PEG" H 14700 2300 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C3010PEG" H 14700 2200 50  0001 L CNN "Mouser Price/Stock"
	1    13250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 66269A77
P 5700 8650
F 0 "C2" H 5818 8696 50  0000 L CNN
F 1 "560µ" H 5818 8605 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 5738 8500 50  0001 C CNN
F 3 "~" H 5700 8650 50  0001 C CNN
	1    5700 8650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6626A9D7
P 3500 5900
F 0 "R1" H 3570 5946 50  0000 L CNN
F 1 "620" H 3570 5855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3430 5900 50  0001 C CNN
F 3 "~" H 3500 5900 50  0001 C CNN
	1    3500 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 6626B37F
P 6950 4850
F 0 "D1" H 6943 5067 50  0000 C CNN
F 1 "LED" H 6943 4976 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 6950 4850 50  0001 C CNN
F 3 "~" H 6950 4850 50  0001 C CNN
	1    6950 4850
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS74 U2
U 1 1 6626BC95
P 7875 7650
F 0 "U2" H 7875 8131 50  0000 C CNN
F 1 "74LS74" H 7875 8040 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7875 7650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7875 7650 50  0001 C CNN
	1    7875 7650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U2
U 2 1 6626BFC1
P 8475 9525
F 0 "U2" H 8475 10006 50  0000 C CNN
F 1 "74LS74" H 8475 9915 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8475 9525 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8475 9525 50  0001 C CNN
	2    8475 9525
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U2
U 3 1 6626E251
P 2425 10275
F 0 "U2" H 2655 10321 50  0000 L CNN
F 1 "74LS74" H 2655 10230 50  0000 L CNN
F 2 "" H 2425 10275 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2425 10275 50  0001 C CNN
	3    2425 10275
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Female J1
U 1 1 662754A8
P 15075 6025
F 0 "J1" H 15255 6071 50  0000 L CNN
F 1 "SER1" H 15255 5980 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 15075 6025 50  0001 C CNN
F 3 " ~" H 15075 6025 50  0001 C CNN
	1    15075 6025
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Female J2
U 1 1 66277748
P 15075 7600
F 0 "J2" H 15255 7646 50  0000 L CNN
F 1 "SER2" H 15255 7555 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset7.70mm_Housed_MountingHolesOffset9.12mm" H 15075 7600 50  0001 C CNN
F 3 " ~" H 15075 7600 50  0001 C CNN
	1    15075 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C9
U 1 1 66278E6A
P 11925 4925
F 0 "C9" H 12043 4971 50  0000 L CNN
F 1 "1µ" H 12043 4880 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 11963 4775 50  0001 C CNN
F 3 "~" H 11925 4925 50  0001 C CNN
	1    11925 4925
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C10
U 1 1 662791BE
P 13675 6650
F 0 "C10" H 13793 6696 50  0000 L CNN
F 1 "1µ" H 13793 6605 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 13713 6500 50  0001 C CNN
F 3 "~" H 13675 6650 50  0001 C CNN
	1    13675 6650
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS00 U3
U 5 1 6628025F
P 3150 10250
F 0 "U3" H 3380 10296 50  0000 L CNN
F 1 "74LS00" H 3380 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3150 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3150 10250 50  0001 C CNN
	5    3150 10250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U3
U 2 1 66281615
P 7575 9500
F 0 "U3" H 7575 9825 50  0000 C CNN
F 1 "74LS00" H 7575 9734 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7575 9500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7575 9500 50  0001 C CNN
	2    7575 9500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS03 U12
U 5 1 6628BCFA
P 3875 10250
F 0 "U12" H 4105 10296 50  0000 L CNN
F 1 "74LS03" H 4105 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3875 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 3875 10250 50  0001 C CNN
	5    3875 10250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS03 U12
U 1 1 6628E70F
P 4400 6225
F 0 "U12" H 4400 6550 50  0000 C CNN
F 1 "74LS03" H 4400 6459 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4400 6225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 4400 6225 50  0001 C CNN
	1    4400 6225
	1    0    0    -1  
$EndComp
Text GLabel 10175 1950 0    50   Input ~ 0
DB0
Text GLabel 10175 2150 0    50   Input ~ 0
DB2
Text GLabel 10175 2350 0    50   Input ~ 0
DB4
Text GLabel 10175 2550 0    50   Input ~ 0
DB6
Text GLabel 10175 2650 0    50   Input ~ 0
DB7
Text GLabel 10175 2450 0    50   Input ~ 0
DB5
Text GLabel 10175 2250 0    50   Input ~ 0
DB3
Text GLabel 10175 2050 0    50   Input ~ 0
DB1
Text GLabel 13050 1950 0    50   Input ~ 0
DB0
Text GLabel 13050 2150 0    50   Input ~ 0
DB2
Text GLabel 13050 2350 0    50   Input ~ 0
DB4
Text GLabel 13050 2550 0    50   Input ~ 0
DB6
Text GLabel 13050 2650 0    50   Input ~ 0
DB7
Text GLabel 13050 2450 0    50   Input ~ 0
DB5
Text GLabel 13050 2250 0    50   Input ~ 0
DB3
Text GLabel 13050 2050 0    50   Input ~ 0
DB1
$Comp
L 74xx:74LS540 U13
U 1 1 6629F1EB
P 4500 1750
F 0 "U13" H 4500 2731 50  0000 C CNN
F 1 "74LS540" H 4500 2640 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4500 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS540" H 4500 1750 50  0001 C CNN
	1    4500 1750
	1    0    0    -1  
$EndComp
Text GLabel 4000 1250 0    50   Input ~ 0
AB0
Text GLabel 4000 1450 0    50   Input ~ 0
AB1
Wire Wire Line
	5000 1250 5125 1250
Wire Wire Line
	5000 1350 5400 1350
Wire Wire Line
	5000 1450 5100 1450
Wire Wire Line
	5000 1550 5400 1550
Wire Wire Line
	4000 1350 3675 1350
Wire Wire Line
	3675 1350 3675 600 
Wire Wire Line
	3675 600  5125 600 
Wire Wire Line
	5125 600  5125 1250
Connection ~ 5125 1250
Wire Wire Line
	4000 1550 3650 1550
Wire Wire Line
	3650 1550 3650 625 
Wire Wire Line
	3650 625  5100 625 
Wire Wire Line
	5100 625  5100 1450
Connection ~ 5100 1450
Text GLabel 5400 1350 2    50   Input ~ 0
N20
Text GLabel 5400 1550 2    50   Input ~ 0
N21
Text GLabel 10175 3900 0    50   Input ~ 0
N20
Text GLabel 13050 2900 0    50   Input ~ 0
N20
Text GLabel 10175 4000 0    50   Input ~ 0
N21
Text GLabel 13050 3000 0    50   Input ~ 0
N21
$Comp
L power:GND #PWR0101
U 1 1 662B047C
P 10675 4250
F 0 "#PWR0101" H 10675 4000 50  0001 C CNN
F 1 "GND" H 10680 4077 50  0000 C CNN
F 2 "" H 10675 4250 50  0001 C CNN
F 3 "" H 10675 4250 50  0001 C CNN
	1    10675 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 662B0955
P 13650 3900
F 0 "#PWR0102" H 13650 3650 50  0001 C CNN
F 1 "GND" H 13655 3727 50  0000 C CNN
F 2 "" H 13650 3900 50  0001 C CNN
F 3 "" H 13650 3900 50  0001 C CNN
	1    13650 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0103
U 1 1 662B15AF
P 10675 1700
F 0 "#PWR0103" H 10675 1550 50  0001 C CNN
F 1 "+5P" H 10690 1873 50  0000 C CNN
F 2 "" H 10675 1700 50  0001 C CNN
F 3 "" H 10675 1700 50  0001 C CNN
	1    10675 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0104
U 1 1 662B1A70
P 13650 1700
F 0 "#PWR0104" H 13650 1550 50  0001 C CNN
F 1 "+5P" H 13665 1873 50  0000 C CNN
F 2 "" H 13650 1700 50  0001 C CNN
F 3 "" H 13650 1700 50  0001 C CNN
	1    13650 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0105
U 1 1 662B1EEB
P 12850 4275
F 0 "#PWR0105" H 12850 4125 50  0001 C CNN
F 1 "+5P" H 12865 4448 50  0000 C CNN
F 2 "" H 12850 4275 50  0001 C CNN
F 3 "" H 12850 4275 50  0001 C CNN
	1    12850 4275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 662B2320
P 11975 6500
F 0 "#PWR0106" H 11975 6250 50  0001 C CNN
F 1 "GND" H 11980 6327 50  0000 C CNN
F 2 "" H 11975 6500 50  0001 C CNN
F 3 "" H 11975 6500 50  0001 C CNN
	1    11975 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 662B271F
P 14775 6425
F 0 "#PWR0107" H 14775 6175 50  0001 C CNN
F 1 "GND" H 14780 6252 50  0000 C CNN
F 2 "" H 14775 6425 50  0001 C CNN
F 3 "" H 14775 6425 50  0001 C CNN
	1    14775 6425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 662B29B6
P 14775 8000
F 0 "#PWR0108" H 14775 7750 50  0001 C CNN
F 1 "GND" H 14780 7827 50  0000 C CNN
F 2 "" H 14775 8000 50  0001 C CNN
F 3 "" H 14775 8000 50  0001 C CNN
	1    14775 8000
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0110
U 1 1 662B323B
P 12000 4775
F 0 "#PWR0110" H 12000 4625 50  0001 C CNN
F 1 "+5P" H 12015 4948 50  0000 C CNN
F 2 "" H 12000 4775 50  0001 C CNN
F 3 "" H 12000 4775 50  0001 C CNN
	1    12000 4775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 662B376D
P 1500 6450
F 0 "#PWR0111" H 1500 6200 50  0001 C CNN
F 1 "GND" H 1505 6277 50  0000 C CNN
F 2 "" H 1500 6450 50  0001 C CNN
F 3 "" H 1500 6450 50  0001 C CNN
	1    1500 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0112
U 1 1 662B3B75
P 1500 4850
F 0 "#PWR0112" H 1500 4700 50  0001 C CNN
F 1 "+5P" H 1515 5023 50  0000 C CNN
F 2 "" H 1500 4850 50  0001 C CNN
F 3 "" H 1500 4850 50  0001 C CNN
	1    1500 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0113
U 1 1 662B40B0
P 1500 9850
F 0 "#PWR0113" H 1500 9700 50  0001 C CNN
F 1 "+5P" H 1515 10023 50  0000 C CNN
F 2 "" H 1500 9850 50  0001 C CNN
F 3 "" H 1500 9850 50  0001 C CNN
	1    1500 9850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 662B4553
P 1500 10650
F 0 "#PWR0114" H 1500 10400 50  0001 C CNN
F 1 "GND" H 1505 10477 50  0000 C CNN
F 2 "" H 1500 10650 50  0001 C CNN
F 3 "" H 1500 10650 50  0001 C CNN
	1    1500 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 662B494D
P 3075 8700
F 0 "C12" H 3190 8746 50  0000 L CNN
F 1 "22nF" H 3190 8655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 3113 8550 50  0001 C CNN
F 3 "~" H 3075 8700 50  0001 C CNN
	1    3075 8700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 662B6888
P 2425 10675
F 0 "#PWR0115" H 2425 10425 50  0001 C CNN
F 1 "GND" H 2430 10502 50  0000 C CNN
F 2 "" H 2425 10675 50  0001 C CNN
F 3 "" H 2425 10675 50  0001 C CNN
	1    2425 10675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 662B6AE7
P 3150 10750
F 0 "#PWR0116" H 3150 10500 50  0001 C CNN
F 1 "GND" H 3155 10577 50  0000 C CNN
F 2 "" H 3150 10750 50  0001 C CNN
F 3 "" H 3150 10750 50  0001 C CNN
	1    3150 10750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 662B6F61
P 3875 10750
F 0 "#PWR0117" H 3875 10500 50  0001 C CNN
F 1 "GND" H 3880 10577 50  0000 C CNN
F 2 "" H 3875 10750 50  0001 C CNN
F 3 "" H 3875 10750 50  0001 C CNN
	1    3875 10750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 662B72E9
P 3075 8850
F 0 "#PWR0118" H 3075 8600 50  0001 C CNN
F 1 "GND" H 3080 8677 50  0000 C CNN
F 2 "" H 3075 8850 50  0001 C CNN
F 3 "" H 3075 8850 50  0001 C CNN
	1    3075 8850
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0119
U 1 1 662B92F6
P 2425 9875
F 0 "#PWR0119" H 2425 9725 50  0001 C CNN
F 1 "+5P" H 2440 10048 50  0000 C CNN
F 2 "" H 2425 9875 50  0001 C CNN
F 3 "" H 2425 9875 50  0001 C CNN
	1    2425 9875
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0120
U 1 1 662B9768
P 3150 9750
F 0 "#PWR0120" H 3150 9600 50  0001 C CNN
F 1 "+5P" H 3165 9923 50  0000 C CNN
F 2 "" H 3150 9750 50  0001 C CNN
F 3 "" H 3150 9750 50  0001 C CNN
	1    3150 9750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0121
U 1 1 662B9A0C
P 3875 9750
F 0 "#PWR0121" H 3875 9600 50  0001 C CNN
F 1 "+5P" H 3890 9923 50  0000 C CNN
F 2 "" H 3875 9750 50  0001 C CNN
F 3 "" H 3875 9750 50  0001 C CNN
	1    3875 9750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0122
U 1 1 662B9D06
P 3075 8550
F 0 "#PWR0122" H 3075 8400 50  0001 C CNN
F 1 "+5P" H 3090 8723 50  0000 C CNN
F 2 "" H 3075 8550 50  0001 C CNN
F 3 "" H 3075 8550 50  0001 C CNN
	1    3075 8550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 662BE3C2
P 5225 4275
F 0 "#PWR0123" H 5225 4025 50  0001 C CNN
F 1 "GND" H 5230 4102 50  0000 C CNN
F 2 "" H 5225 4275 50  0001 C CNN
F 3 "" H 5225 4275 50  0001 C CNN
	1    5225 4275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 662BE803
P 950 6400
F 0 "#PWR0124" H 950 6150 50  0001 C CNN
F 1 "GND" H 955 6227 50  0000 C CNN
F 2 "" H 950 6400 50  0001 C CNN
F 3 "" H 950 6400 50  0001 C CNN
	1    950  6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0125
U 1 1 662C0B06
P 5225 2975
F 0 "#PWR0125" H 5225 2825 50  0001 C CNN
F 1 "+5P" H 5240 3148 50  0000 C CNN
F 2 "" H 5225 2975 50  0001 C CNN
F 3 "" H 5225 2975 50  0001 C CNN
	1    5225 2975
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 662C13E1
P 4500 2550
F 0 "#PWR0126" H 4500 2300 50  0001 C CNN
F 1 "GND" H 4505 2377 50  0000 C CNN
F 2 "" H 4500 2550 50  0001 C CNN
F 3 "" H 4500 2550 50  0001 C CNN
	1    4500 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 662C1744
P 3975 2350
F 0 "#PWR0127" H 3975 2100 50  0001 C CNN
F 1 "GND" H 3980 2177 50  0000 C CNN
F 2 "" H 3975 2350 50  0001 C CNN
F 3 "" H 3975 2350 50  0001 C CNN
	1    3975 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0128
U 1 1 662C1BFE
P 4500 950
F 0 "#PWR0128" H 4500 800 50  0001 C CNN
F 1 "+5P" H 4515 1123 50  0000 C CNN
F 2 "" H 4500 950 50  0001 C CNN
F 3 "" H 4500 950 50  0001 C CNN
	1    4500 950 
	1    0    0    -1  
$EndComp
Text GLabel 4000 1650 0    50   Input ~ 0
AB4
Wire Wire Line
	5275 1650 5275 2550
Wire Wire Line
	5275 2550 4700 2550
Wire Wire Line
	4700 2550 4700 2825
Wire Wire Line
	4700 2825 4250 2825
Wire Wire Line
	4250 2825 4250 3775
Wire Wire Line
	4250 3775 4725 3775
Wire Wire Line
	5000 1650 5275 1650
Text GLabel 4725 3375 0    50   Input ~ 0
AB3
Text GLabel 4725 3475 0    50   Input ~ 0
AB7
Text GLabel 4725 3275 0    50   Input ~ 0
AB2
Text GLabel 4725 3875 0    50   Input ~ 0
AB5
Text GLabel 4725 3975 0    50   Input ~ 0
AB4
$Comp
L 74xx:74LS10 U8
U 4 1 662C7F87
P 775 10250
F 0 "U8" H 1005 10296 50  0000 L CNN
F 1 "74LS10" H 1005 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 775 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 775 10250 50  0001 C CNN
	4    775  10250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 662CB9AF
P 775 10750
F 0 "#PWR0129" H 775 10500 50  0001 C CNN
F 1 "GND" H 780 10577 50  0000 C CNN
F 2 "" H 775 10750 50  0001 C CNN
F 3 "" H 775 10750 50  0001 C CNN
	1    775  10750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0130
U 1 1 662CBD6D
P 775 9750
F 0 "#PWR0130" H 775 9600 50  0001 C CNN
F 1 "+5P" H 790 9923 50  0000 C CNN
F 2 "" H 775 9750 50  0001 C CNN
F 3 "" H 775 9750 50  0001 C CNN
	1    775  9750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U8
U 1 1 662CCE13
P 6725 2050
F 0 "U8" H 6725 2375 50  0000 C CNN
F 1 "74LS10" H 6725 2284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6725 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 6725 2050 50  0001 C CNN
	1    6725 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5725 3675 5975 3675
Wire Wire Line
	5975 3675 5975 2800
Wire Wire Line
	5975 2800 3625 2800
Wire Wire Line
	3625 2800 3625 1750
Wire Wire Line
	3625 1750 4000 1750
Wire Wire Line
	5725 3575 5950 3575
Wire Wire Line
	5950 3575 5950 2775
Wire Wire Line
	5950 2775 3650 2775
Wire Wire Line
	3650 2775 3650 1850
Wire Wire Line
	3650 1850 4000 1850
Wire Wire Line
	3975 2350 3975 2250
Wire Wire Line
	3975 2150 4000 2150
Wire Wire Line
	4000 2250 3975 2250
Connection ~ 3975 2250
Wire Wire Line
	3975 2250 3975 2150
Wire Wire Line
	5725 3475 5925 3475
Wire Wire Line
	5925 3475 5925 2750
Wire Wire Line
	5925 2750 3675 2750
Wire Wire Line
	3675 2750 3675 1950
Wire Wire Line
	3675 1950 4000 1950
$Comp
L 74xx:74LS00 U3
U 1 1 662E1CF3
P 6650 1100
F 0 "U3" H 6650 1425 50  0000 C CNN
F 1 "74LS00" H 6650 1334 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6650 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6650 1100 50  0001 C CNN
	1    6650 1100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS20 U10
U 3 1 662EACC3
P 4625 10250
F 0 "U10" H 4855 10296 50  0000 L CNN
F 1 "74LS20" H 4855 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4625 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 4625 10250 50  0001 C CNN
	3    4625 10250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 662EBC83
P 4625 10750
F 0 "#PWR0131" H 4625 10500 50  0001 C CNN
F 1 "GND" H 4630 10577 50  0000 C CNN
F 2 "" H 4625 10750 50  0001 C CNN
F 3 "" H 4625 10750 50  0001 C CNN
	1    4625 10750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0132
U 1 1 662EBF15
P 4625 9750
F 0 "#PWR0132" H 4625 9600 50  0001 C CNN
F 1 "+5P" H 4640 9923 50  0000 C CNN
F 2 "" H 4625 9750 50  0001 C CNN
F 3 "" H 4625 9750 50  0001 C CNN
	1    4625 9750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS20 U10
U 1 1 662EC356
P 7675 1250
F 0 "U10" H 7675 1625 50  0000 C CNN
F 1 "74LS20" H 7675 1534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7675 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 7675 1250 50  0001 C CNN
	1    7675 1250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS20 U10
U 2 1 662EEC71
P 2475 5300
F 0 "U10" H 2475 5675 50  0000 C CNN
F 1 "74LS20" H 2475 5584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2475 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS20" H 2475 5300 50  0001 C CNN
	2    2475 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1100 7375 1100
Wire Wire Line
	7375 1400 7300 1400
Wire Wire Line
	7300 1400 7300 1300
Wire Wire Line
	7300 1300 7375 1300
Wire Wire Line
	5925 2750 5925 1200
Wire Wire Line
	5925 1200 6350 1200
Connection ~ 5925 2750
Wire Wire Line
	5950 2775 5950 1000
Wire Wire Line
	5950 1000 6350 1000
Connection ~ 5950 2775
Wire Wire Line
	5900 1250 5900 1950
Wire Wire Line
	5900 1950 6425 1950
Wire Wire Line
	5125 1250 5900 1250
Wire Wire Line
	5875 1450 5875 2150
Wire Wire Line
	5875 2150 6425 2150
Wire Wire Line
	5100 1450 5875 1450
Wire Wire Line
	5000 1750 5850 1750
Wire Wire Line
	5850 1750 5850 2050
Wire Wire Line
	5850 2050 6425 2050
Text GLabel 1000 5150 0    50   Input ~ 0
AB8
Text GLabel 1000 5250 0    50   Input ~ 0
AB9
Text GLabel 1000 5350 0    39   Input ~ 0
~MAD
Text GLabel 1000 5450 0    39   Input ~ 0
~IORQ
Text GLabel 1000 5550 0    39   Input ~ 0
~WR
Text GLabel 1000 5650 0    39   Input ~ 0
~RD
Text GLabel 1000 5750 0    50   Input ~ 0
TAKT
Text GLabel 1000 5850 0    50   Input ~ 0
~M1
Wire Wire Line
	950  6400 950  6150
Wire Wire Line
	950  6050 1000 6050
Wire Wire Line
	1000 6150 950  6150
Connection ~ 950  6150
Wire Wire Line
	950  6150 950  6050
$Comp
L 74xx:74LS540 U9
U 1 1 66332FCA
P 1500 7700
F 0 "U9" H 1500 8681 50  0000 C CNN
F 1 "74LS540" H 1500 8590 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1500 7700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS540" H 1500 7700 50  0001 C CNN
	1    1500 7700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 66333BAA
P 1500 8500
F 0 "#PWR0133" H 1500 8250 50  0001 C CNN
F 1 "GND" H 1505 8327 50  0000 C CNN
F 2 "" H 1500 8500 50  0001 C CNN
F 3 "" H 1500 8500 50  0001 C CNN
	1    1500 8500
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0134
U 1 1 66333BB4
P 1500 6900
F 0 "#PWR0134" H 1500 6750 50  0001 C CNN
F 1 "+5P" H 1515 7073 50  0000 C CNN
F 2 "" H 1500 6900 50  0001 C CNN
F 3 "" H 1500 6900 50  0001 C CNN
	1    1500 6900
	1    0    0    -1  
$EndComp
Text GLabel 1000 7200 0    50   Input ~ 0
~RESET
Wire Wire Line
	1000 7300 650  7300
Wire Wire Line
	650  7300 650  6650
Wire Wire Line
	650  6650 2075 6650
Wire Wire Line
	2575 2725 5975 2725
Wire Wire Line
	5975 2725 5975 2250
Wire Wire Line
	5975 2250 7125 2250
Wire Wire Line
	7125 2250 7125 2050
Wire Wire Line
	7125 2050 7025 2050
$Comp
L 74xx:74LS00 U3
U 4 1 66340529
P 4400 5675
F 0 "U3" H 4400 6000 50  0000 C CNN
F 1 "74LS00" H 4400 5909 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4400 5675 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4400 5675 50  0001 C CNN
	4    4400 5675
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS03 U12
U 2 1 6635809F
P 4400 6775
F 0 "U12" H 4400 7100 50  0000 C CNN
F 1 "74LS03" H 4400 7009 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4400 6775 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS03" H 4400 6775 50  0001 C CNN
	2    4400 6775
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6675 4000 6675
Wire Wire Line
	4000 6675 4000 6325
Wire Wire Line
	4000 6325 4100 6325
Wire Wire Line
	4100 5575 4000 5575
Wire Wire Line
	4000 5575 4000 6325
Connection ~ 4000 6325
$Comp
L 74xx:74LS08 U11
U 5 1 66368758
P 5350 10250
F 0 "U11" H 5580 10296 50  0000 L CNN
F 1 "74LS08" H 5580 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5350 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5350 10250 50  0001 C CNN
	5    5350 10250
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0135
U 1 1 6636F7D0
P 5350 9750
F 0 "#PWR0135" H 5350 9600 50  0001 C CNN
F 1 "+5P" H 5365 9923 50  0000 C CNN
F 2 "" H 5350 9750 50  0001 C CNN
F 3 "" H 5350 9750 50  0001 C CNN
	1    5350 9750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 6636FB82
P 5350 10750
F 0 "#PWR0136" H 5350 10500 50  0001 C CNN
F 1 "GND" H 5355 10577 50  0000 C CNN
F 2 "" H 5350 10750 50  0001 C CNN
F 3 "" H 5350 10750 50  0001 C CNN
	1    5350 10750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U11
U 1 1 6636FE1C
P 2850 6350
F 0 "U11" H 2850 6675 50  0000 C CNN
F 1 "74LS08" H 2850 6584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2850 6350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2850 6350 50  0001 C CNN
	1    2850 6350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U11
U 4 1 66374A61
P 2850 6875
F 0 "U11" H 2850 7200 50  0000 C CNN
F 1 "74LS08" H 2850 7109 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2850 6875 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2850 6875 50  0001 C CNN
	4    2850 6875
	1    0    0    -1  
$EndComp
Wire Wire Line
	2425 6775 2425 6450
Wire Wire Line
	2425 6450 2550 6450
Wire Wire Line
	2425 6775 2550 6775
Wire Wire Line
	2075 6650 2075 4600
Wire Wire Line
	2075 4600 2575 4600
Wire Wire Line
	2575 4600 2575 2725
Wire Wire Line
	2000 5150 2175 5150
Wire Wire Line
	2000 5250 2175 5250
Wire Wire Line
	2000 5350 2175 5350
Wire Wire Line
	2775 5300 2825 5300
Wire Wire Line
	2825 5300 2825 5500
Wire Wire Line
	2825 5500 2100 5500
Wire Wire Line
	2100 5500 2100 6675
Wire Wire Line
	2100 6675 675  6675
Wire Wire Line
	675  6675 675  7400
Wire Wire Line
	675  7400 1000 7400
Wire Wire Line
	2000 7400 2425 7400
Wire Wire Line
	2425 7400 2425 6775
Connection ~ 2425 6775
Wire Wire Line
	2000 5550 2125 5550
Wire Wire Line
	2125 5550 2125 6250
Wire Wire Line
	2125 6250 2550 6250
Wire Wire Line
	2000 5650 2150 5650
Wire Wire Line
	2150 5650 2150 6975
Wire Wire Line
	2150 6975 2550 6975
Wire Wire Line
	4100 6875 3925 6875
Wire Wire Line
	3925 6875 3925 6125
Wire Wire Line
	3925 6125 4100 6125
Connection ~ 3925 6875
Wire Wire Line
	3150 6350 3850 6350
Wire Wire Line
	3850 6350 3850 5775
Wire Wire Line
	3850 5775 4100 5775
Wire Wire Line
	2000 7300 2400 7300
Wire Wire Line
	2400 7300 2400 5575
Wire Wire Line
	2400 5575 4000 5575
Connection ~ 4000 5575
Wire Wire Line
	3150 6875 3925 6875
Wire Wire Line
	4700 5675 5700 5675
Wire Wire Line
	5700 5675 5700 5200
Wire Wire Line
	5700 5200 6175 5200
$Comp
L Device:R R2
U 1 1 6645CA4A
P 4975 6225
F 0 "R2" V 4768 6225 50  0000 C CNN
F 1 "100R" V 4859 6225 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4905 6225 50  0001 C CNN
F 3 "~" H 4975 6225 50  0001 C CNN
	1    4975 6225
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 6225 4775 6225
Wire Wire Line
	6175 5100 5725 5100
Wire Wire Line
	5725 5100 5725 6225
Wire Wire Line
	5725 6225 5125 6225
$Comp
L Device:C C11
U 1 1 6646F75F
P 5925 6900
F 0 "C11" H 6040 6946 50  0000 L CNN
F 1 "100n" H 6040 6855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 5963 6750 50  0001 C CNN
F 3 "~" H 5925 6900 50  0001 C CNN
	1    5925 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6646FC68
P 5925 4475
F 0 "R3" H 5855 4429 50  0000 R CNN
F 1 "2K2" H 5855 4520 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5855 4475 50  0001 C CNN
F 3 "~" H 5925 4475 50  0001 C CNN
	1    5925 4475
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 6647864C
P 5925 7050
F 0 "#PWR0137" H 5925 6800 50  0001 C CNN
F 1 "GND" H 5930 6877 50  0000 C CNN
F 2 "" H 5925 7050 50  0001 C CNN
F 3 "" H 5925 7050 50  0001 C CNN
	1    5925 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0138
U 1 1 66478C01
P 5925 4325
F 0 "#PWR0138" H 5925 4175 50  0001 C CNN
F 1 "+5P" H 5940 4498 50  0000 C CNN
F 2 "" H 5925 4325 50  0001 C CNN
F 3 "" H 5925 4325 50  0001 C CNN
	1    5925 4325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6475 5900 6100 5900
Wire Wire Line
	6100 5900 6100 4900
Wire Wire Line
	6100 4900 6475 4900
Wire Wire Line
	6475 4900 6475 4650
Connection ~ 6475 4900
$Comp
L Device:R R4
U 1 1 6648C02D
P 6475 4500
F 0 "R4" H 6405 4454 50  0000 R CNN
F 1 "2K2" H 6405 4545 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6405 4500 50  0001 C CNN
F 3 "~" H 6475 4500 50  0001 C CNN
	1    6475 4500
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0139
U 1 1 6648CF2B
P 6475 4350
F 0 "#PWR0139" H 6475 4200 50  0001 C CNN
F 1 "+5P" H 6490 4523 50  0000 C CNN
F 2 "" H 6475 4350 50  0001 C CNN
F 3 "" H 6475 4350 50  0001 C CNN
	1    6475 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5925 6750 5925 6675
Wire Wire Line
	6475 5500 6475 5625
Wire Wire Line
	6475 5625 5925 5625
Connection ~ 5925 5625
Wire Wire Line
	5925 5625 5925 4625
Wire Wire Line
	6475 6500 6475 6675
Wire Wire Line
	6475 6675 5925 6675
Connection ~ 5925 6675
Wire Wire Line
	5925 6675 5925 5625
Text GLabel 4700 6775 2    50   Input ~ 0
DB4
Wire Wire Line
	14250 1950 14375 1950
Wire Wire Line
	14375 1950 14375 2250
Wire Wire Line
	14375 2250 14250 2250
$Comp
L Device:R R6
U 1 1 6622A935
P 6950 4475
F 0 "R6" H 6880 4429 50  0000 R CNN
F 1 "390R" H 6880 4520 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 4475 50  0001 C CNN
F 3 "~" H 6950 4475 50  0001 C CNN
	1    6950 4475
	-1   0    0    1   
$EndComp
$Comp
L power:+5P #PWR0140
U 1 1 6622A93B
P 6950 4325
F 0 "#PWR0140" H 6950 4175 50  0001 C CNN
F 1 "+5P" H 6965 4498 50  0000 C CNN
F 2 "" H 6950 4325 50  0001 C CNN
F 3 "" H 6950 4325 50  0001 C CNN
	1    6950 4325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6775 5300 6950 5300
Wire Wire Line
	6950 5300 6950 5000
Wire Wire Line
	6950 4700 6950 4625
Wire Wire Line
	6775 5100 6875 5100
Wire Wire Line
	6875 5100 6875 3725
Wire Wire Line
	7200 1200 7375 1200
$Comp
L 74xx:74LS10 U8
U 2 1 6626D11E
P 7750 3175
F 0 "U8" H 7750 3500 50  0000 C CNN
F 1 "74LS10" H 7750 3409 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7750 3175 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 7750 3175 50  0001 C CNN
	2    7750 3175
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U8
U 3 1 6626E884
P 7750 3725
F 0 "U8" H 7750 4050 50  0000 C CNN
F 1 "74LS10" H 7750 3959 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7750 3725 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 7750 3725 50  0001 C CNN
	3    7750 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3175 7450 3175
Wire Wire Line
	7450 3725 7200 3725
Connection ~ 7200 3175
Wire Wire Line
	6875 3725 7200 3725
Connection ~ 7200 3725
Wire Wire Line
	7200 1200 7200 3175
Wire Wire Line
	7200 3175 7200 3725
Wire Wire Line
	7450 3825 7275 3825
Wire Wire Line
	7275 3825 7275 3075
Wire Wire Line
	7275 3075 7450 3075
$Comp
L 74xx:74LS08 U11
U 2 1 662C6B3E
P 3650 4925
F 0 "U11" H 3650 5250 50  0000 C CNN
F 1 "74LS08" H 3650 5159 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3650 4925 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3650 4925 50  0001 C CNN
	2    3650 4925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4925 6050 4925
Wire Wire Line
	6050 4925 6050 3825
Wire Wire Line
	6050 3825 7275 3825
Connection ~ 7275 3825
Text GLabel 3350 4825 0    50   Input ~ 0
MEI
$Comp
L Device:R R5
U 1 1 662EC0EB
P 3150 5025
F 0 "R5" H 3080 4979 50  0000 R CNN
F 1 "2K2" H 3080 5070 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3080 5025 50  0001 C CNN
F 3 "~" H 3150 5025 50  0001 C CNN
	1    3150 5025
	0    1    1    0   
$EndComp
$Comp
L power:+5P #PWR0141
U 1 1 662EC0F1
P 3000 5025
F 0 "#PWR0141" H 3000 4875 50  0001 C CNN
F 1 "+5P" H 3015 5198 50  0000 C CNN
F 2 "" H 3000 5025 50  0001 C CNN
F 3 "" H 3000 5025 50  0001 C CNN
	1    3000 5025
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 5025 3300 5025
Wire Wire Line
	5000 1850 5825 1850
Wire Wire Line
	5825 1850 5825 2300
Wire Wire Line
	5825 2300 7175 2300
Wire Wire Line
	7175 2300 7175 3275
Wire Wire Line
	7175 3275 7450 3275
Wire Wire Line
	5000 1950 5800 1950
Wire Wire Line
	5800 1950 5800 2325
Wire Wire Line
	5800 2325 7150 2325
Wire Wire Line
	7150 2325 7150 3625
Wire Wire Line
	7150 3625 7450 3625
Wire Wire Line
	8050 3175 9850 3175
Wire Wire Line
	9850 3175 9850 4500
Wire Wire Line
	9850 4500 11475 4500
Wire Wire Line
	12600 4150 12600 2800
Wire Wire Line
	12600 2800 13050 2800
Wire Wire Line
	11475 4150 12600 4150
Wire Wire Line
	8050 3725 8050 3200
Wire Wire Line
	8050 3200 9900 3200
Wire Wire Line
	9900 3200 9900 2800
Wire Wire Line
	9900 2800 10175 2800
$Comp
L 74xx:74LS00 U3
U 3 1 6635F377
P 7700 5350
F 0 "U3" H 7700 5675 50  0000 C CNN
F 1 "74LS00" H 7700 5584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7700 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7700 5350 50  0001 C CNN
	3    7700 5350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U15
U 2 1 66360408
P 8375 5775
F 0 "U15" H 8375 6100 50  0000 C CNN
F 1 "74LS08" H 8375 6009 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8375 5775 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8375 5775 50  0001 C CNN
	2    8375 5775
	1    0    0    -1  
$EndComp
Wire Wire Line
	6775 6100 7000 6100
Wire Wire Line
	7000 6100 7000 5250
Wire Wire Line
	7000 5250 7400 5250
$Comp
L 74xx:74LS00 U14
U 2 1 663AC3E5
P 3600 7775
F 0 "U14" H 3600 8100 50  0000 C CNN
F 1 "74LS00" H 3600 8009 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3600 7775 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3600 7775 50  0001 C CNN
	2    3600 7775
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5850 2175 5850
Wire Wire Line
	2175 5850 2175 7025
Wire Wire Line
	2175 7025 2575 7025
Wire Wire Line
	2575 7025 2575 7875
Wire Wire Line
	2575 7875 3300 7875
Wire Wire Line
	2575 7875 2575 8850
Wire Wire Line
	2575 8850 700  8850
Wire Wire Line
	700  8850 700  7600
Wire Wire Line
	700  7600 1000 7600
Connection ~ 2575 7875
Text GLabel 2000 7600 2    50   Input ~ 0
N15
Wire Wire Line
	8025 5350 8025 5675
Wire Wire Line
	8025 5675 8075 5675
Wire Wire Line
	8025 5350 8000 5350
Text GLabel 8675 5775 2    50   Input ~ 0
N25
Text GLabel 8175 7550 2    50   Input ~ 0
N33
$Comp
L power:+5P #PWR0142
U 1 1 6642D58C
P 7400 6925
F 0 "#PWR0142" H 7400 6775 50  0001 C CNN
F 1 "+5P" H 7415 7098 50  0000 C CNN
F 2 "" H 7400 6925 50  0001 C CNN
F 3 "" H 7400 6925 50  0001 C CNN
	1    7400 6925
	1    0    0    -1  
$EndComp
Wire Wire Line
	8175 7750 8300 7750
Wire Wire Line
	8300 7750 8300 8075
Wire Wire Line
	8300 8075 7450 8075
Wire Wire Line
	7450 8075 7450 7550
Wire Wire Line
	7450 7550 7575 7550
Wire Wire Line
	7875 7950 7875 8150
Wire Wire Line
	7875 8150 7400 8150
Wire Wire Line
	7400 8150 7400 7150
Wire Wire Line
	7875 7150 7400 7150
Connection ~ 7400 7150
Wire Wire Line
	7400 7150 7400 6925
Wire Wire Line
	7875 7150 7875 7350
$Comp
L power:+5P #PWR0143
U 1 1 665B2861
P 11925 4775
F 0 "#PWR0143" H 11925 4625 50  0001 C CNN
F 1 "+5P" H 11940 4948 50  0000 C CNN
F 2 "" H 11925 4775 50  0001 C CNN
F 3 "" H 11925 4775 50  0001 C CNN
	1    11925 4775
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 665CB172
P 13675 6800
F 0 "#PWR0144" H 13675 6550 50  0001 C CNN
F 1 "GND" H 13680 6627 50  0000 C CNN
F 2 "" H 13675 6800 50  0001 C CNN
F 3 "" H 13675 6800 50  0001 C CNN
	1    13675 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C21
U 1 1 6670637E
P 12225 6475
F 0 "C21" H 12343 6521 50  0000 L CNN
F 1 "1µ" H 12343 6430 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 12263 6325 50  0001 C CNN
F 3 "~" H 12225 6475 50  0001 C CNN
	1    12225 6475
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14200 7800 14775 7800
Wire Wire Line
	14275 7700 14775 7700
Wire Wire Line
	11475 4500 11475 4150
Wire Wire Line
	11475 3350 11475 3150
Wire Wire Line
	11475 3150 11175 3150
Wire Wire Line
	11175 3350 11475 3350
Wire Wire Line
	11175 2250 11400 2250
Wire Wire Line
	11400 2250 11400 2050
Wire Wire Line
	12625 2050 12625 1425
Wire Wire Line
	12625 1425 14350 1425
Wire Wire Line
	14350 1425 14350 2050
Wire Wire Line
	14350 2050 14250 2050
Wire Wire Line
	11175 2050 11400 2050
Connection ~ 11400 2050
Wire Wire Line
	11400 2050 12625 2050
Wire Wire Line
	11475 3150 11475 2075
Wire Wire Line
	11475 2075 12650 2075
Wire Wire Line
	12650 2075 12650 1450
Wire Wire Line
	12650 1450 14325 1450
Wire Wire Line
	14325 1450 14325 2350
Wire Wire Line
	14325 2350 14250 2350
Connection ~ 11475 3150
Wire Wire Line
	2000 7200 2375 7200
Wire Wire Line
	2375 7200 2375 8825
Wire Wire Line
	2375 8825 725  8825
Wire Wire Line
	725  8825 725  7700
Wire Wire Line
	725  7700 1000 7700
Text GLabel 2000 7700 2    50   Input ~ 0
N16
Text GLabel 14250 3050 2    50   Input ~ 0
N16
Text GLabel 10175 2900 0    50   Input ~ 0
N16
Text GLabel 10175 3000 0    50   Input ~ 0
N15
Text GLabel 13050 3100 0    50   Input ~ 0
N15
Text GLabel 13050 3200 0    50   Input ~ 0
N25
Text GLabel 10175 3100 0    50   Input ~ 0
N25
Text GLabel 10175 3200 0    50   Input ~ 0
N12
Text GLabel 13050 3300 0    50   Input ~ 0
N12
Text GLabel 2250 3100 2    50   Input ~ 0
~INT
Text GLabel 2250 2800 2    50   Input ~ 0
~BUSRQ
Text GLabel 2250 3000 2    50   Input ~ 0
~HALT
Text GLabel 950  3100 0    50   Input ~ 0
~NMI
Text GLabel 950  2300 0    50   Input ~ 0
~WAIT
Text GLabel 2250 2300 2    50   Input ~ 0
~RFSH
Text GLabel 10175 3550 0    50   Input ~ 0
~INT
Text GLabel 13050 3650 0    50   Input ~ 0
~INT
Text GLabel 10175 3650 0    50   Input ~ 0
IEI
Text GLabel 9250 5200 0    50   Input ~ 0
IEI
Text GLabel 10550 5500 2    50   Input ~ 0
IEO
$Comp
L 74xx:74LS08 U11
U 3 1 66A84E2A
P 9550 5100
F 0 "U11" H 9550 5425 50  0000 C CNN
F 1 "74LS08" H 9550 5334 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9550 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 9550 5100 50  0001 C CNN
	3    9550 5100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U15
U 5 1 66A886EA
P 6075 10250
F 0 "U15" H 6075 10575 50  0000 C CNN
F 1 "74LS08" H 6075 10484 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6075 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6075 10250 50  0001 C CNN
	5    6075 10250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0147
U 1 1 66AB1387
P 6075 10750
F 0 "#PWR0147" H 6075 10500 50  0001 C CNN
F 1 "GND" H 6080 10577 50  0000 C CNN
F 2 "" H 6075 10750 50  0001 C CNN
F 3 "" H 6075 10750 50  0001 C CNN
	1    6075 10750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0148
U 1 1 66AD4AF9
P 6075 9750
F 0 "#PWR0148" H 6075 9600 50  0001 C CNN
F 1 "+5P" H 6090 9923 50  0000 C CNN
F 2 "" H 6075 9750 50  0001 C CNN
F 3 "" H 6075 9750 50  0001 C CNN
	1    6075 9750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U14
U 5 1 66AF8F8A
P 6625 10250
F 0 "U14" H 6855 10296 50  0000 L CNN
F 1 "74LS00" H 6855 10205 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6625 10250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6625 10250 50  0001 C CNN
	5    6625 10250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0149
U 1 1 66AFA3B4
P 6625 10750
F 0 "#PWR0149" H 6625 10500 50  0001 C CNN
F 1 "GND" H 6630 10577 50  0000 C CNN
F 2 "" H 6625 10750 50  0001 C CNN
F 3 "" H 6625 10750 50  0001 C CNN
	1    6625 10750
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0150
U 1 1 66AFA3BE
P 6625 9750
F 0 "#PWR0150" H 6625 9600 50  0001 C CNN
F 1 "+5P" H 6640 9923 50  0000 C CNN
F 2 "" H 6625 9750 50  0001 C CNN
F 3 "" H 6625 9750 50  0001 C CNN
	1    6625 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 66B1F756
P 3650 8700
F 0 "C15" H 3765 8746 50  0000 L CNN
F 1 "22nF" H 3765 8655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 3688 8550 50  0001 C CNN
F 3 "~" H 3650 8700 50  0001 C CNN
	1    3650 8700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0151
U 1 1 66B20BAE
P 3650 8850
F 0 "#PWR0151" H 3650 8600 50  0001 C CNN
F 1 "GND" H 3655 8677 50  0000 C CNN
F 2 "" H 3650 8850 50  0001 C CNN
F 3 "" H 3650 8850 50  0001 C CNN
	1    3650 8850
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0152
U 1 1 66B20BB8
P 3650 8550
F 0 "#PWR0152" H 3650 8400 50  0001 C CNN
F 1 "+5P" H 3665 8723 50  0000 C CNN
F 2 "" H 3650 8550 50  0001 C CNN
F 3 "" H 3650 8550 50  0001 C CNN
	1    3650 8550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 66B479ED
P 4050 8675
F 0 "C16" H 4165 8721 50  0000 L CNN
F 1 "22nF" H 4165 8630 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4088 8525 50  0001 C CNN
F 3 "~" H 4050 8675 50  0001 C CNN
	1    4050 8675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 66B479F3
P 4050 8825
F 0 "#PWR0153" H 4050 8575 50  0001 C CNN
F 1 "GND" H 4055 8652 50  0000 C CNN
F 2 "" H 4050 8825 50  0001 C CNN
F 3 "" H 4050 8825 50  0001 C CNN
	1    4050 8825
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0154
U 1 1 66B479F9
P 4050 8525
F 0 "#PWR0154" H 4050 8375 50  0001 C CNN
F 1 "+5P" H 4065 8698 50  0000 C CNN
F 2 "" H 4050 8525 50  0001 C CNN
F 3 "" H 4050 8525 50  0001 C CNN
	1    4050 8525
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 66B6B04B
P 4450 8675
F 0 "C18" H 4565 8721 50  0000 L CNN
F 1 "22nF" H 4565 8630 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4488 8525 50  0001 C CNN
F 3 "~" H 4450 8675 50  0001 C CNN
	1    4450 8675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0155
U 1 1 66B6B051
P 4450 8825
F 0 "#PWR0155" H 4450 8575 50  0001 C CNN
F 1 "GND" H 4455 8652 50  0000 C CNN
F 2 "" H 4450 8825 50  0001 C CNN
F 3 "" H 4450 8825 50  0001 C CNN
	1    4450 8825
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0156
U 1 1 66B6B057
P 4450 8525
F 0 "#PWR0156" H 4450 8375 50  0001 C CNN
F 1 "+5P" H 4465 8698 50  0000 C CNN
F 2 "" H 4450 8525 50  0001 C CNN
F 3 "" H 4450 8525 50  0001 C CNN
	1    4450 8525
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 66B8EC01
P 4825 8650
F 0 "C19" H 4940 8696 50  0000 L CNN
F 1 "22nF" H 4940 8605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4863 8500 50  0001 C CNN
F 3 "~" H 4825 8650 50  0001 C CNN
	1    4825 8650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 66B8EC07
P 4825 8800
F 0 "#PWR0157" H 4825 8550 50  0001 C CNN
F 1 "GND" H 4830 8627 50  0000 C CNN
F 2 "" H 4825 8800 50  0001 C CNN
F 3 "" H 4825 8800 50  0001 C CNN
	1    4825 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0158
U 1 1 66B8EC0D
P 4825 8500
F 0 "#PWR0158" H 4825 8350 50  0001 C CNN
F 1 "+5P" H 4840 8673 50  0000 C CNN
F 2 "" H 4825 8500 50  0001 C CNN
F 3 "" H 4825 8500 50  0001 C CNN
	1    4825 8500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 66BB2B14
P 5250 8650
F 0 "C20" H 5365 8696 50  0000 L CNN
F 1 "22nF" H 5365 8605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 5288 8500 50  0001 C CNN
F 3 "~" H 5250 8650 50  0001 C CNN
	1    5250 8650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0159
U 1 1 66BB2B1A
P 5250 8800
F 0 "#PWR0159" H 5250 8550 50  0001 C CNN
F 1 "GND" H 5255 8627 50  0000 C CNN
F 2 "" H 5250 8800 50  0001 C CNN
F 3 "" H 5250 8800 50  0001 C CNN
	1    5250 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0160
U 1 1 66BB2B20
P 5250 8500
F 0 "#PWR0160" H 5250 8350 50  0001 C CNN
F 1 "+5P" H 5265 8673 50  0000 C CNN
F 2 "" H 5250 8500 50  0001 C CNN
F 3 "" H 5250 8500 50  0001 C CNN
	1    5250 8500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 66BD6DF3
P 1125 9375
F 0 "C1" H 1240 9421 50  0000 L CNN
F 1 "22nF" H 1240 9330 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 1163 9225 50  0001 C CNN
F 3 "~" H 1125 9375 50  0001 C CNN
	1    1125 9375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 66BD6DF9
P 1125 9525
F 0 "#PWR0161" H 1125 9275 50  0001 C CNN
F 1 "GND" H 1130 9352 50  0000 C CNN
F 2 "" H 1125 9525 50  0001 C CNN
F 3 "" H 1125 9525 50  0001 C CNN
	1    1125 9525
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0162
U 1 1 66BD6DFF
P 1125 9225
F 0 "#PWR0162" H 1125 9075 50  0001 C CNN
F 1 "+5P" H 1140 9398 50  0000 C CNN
F 2 "" H 1125 9225 50  0001 C CNN
F 3 "" H 1125 9225 50  0001 C CNN
	1    1125 9225
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 66BFA526
P 1925 9375
F 0 "C4" H 2040 9421 50  0000 L CNN
F 1 "22nF" H 2040 9330 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 1963 9225 50  0001 C CNN
F 3 "~" H 1925 9375 50  0001 C CNN
	1    1925 9375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 66BFA52C
P 1925 9525
F 0 "#PWR0163" H 1925 9275 50  0001 C CNN
F 1 "GND" H 1930 9352 50  0000 C CNN
F 2 "" H 1925 9525 50  0001 C CNN
F 3 "" H 1925 9525 50  0001 C CNN
	1    1925 9525
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0164
U 1 1 66BFA532
P 1925 9225
F 0 "#PWR0164" H 1925 9075 50  0001 C CNN
F 1 "+5P" H 1940 9398 50  0000 C CNN
F 2 "" H 1925 9225 50  0001 C CNN
F 3 "" H 1925 9225 50  0001 C CNN
	1    1925 9225
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 66C1DB1D
P 2800 9375
F 0 "C13" H 2915 9421 50  0000 L CNN
F 1 "22nF" H 2915 9330 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 2838 9225 50  0001 C CNN
F 3 "~" H 2800 9375 50  0001 C CNN
	1    2800 9375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 66C1DB23
P 2800 9525
F 0 "#PWR0165" H 2800 9275 50  0001 C CNN
F 1 "GND" H 2805 9352 50  0000 C CNN
F 2 "" H 2800 9525 50  0001 C CNN
F 3 "" H 2800 9525 50  0001 C CNN
	1    2800 9525
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0166
U 1 1 66C1DB29
P 2800 9225
F 0 "#PWR0166" H 2800 9075 50  0001 C CNN
F 1 "+5P" H 2815 9398 50  0000 C CNN
F 2 "" H 2800 9225 50  0001 C CNN
F 3 "" H 2800 9225 50  0001 C CNN
	1    2800 9225
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 66C4132B
P 3475 9425
F 0 "C14" H 3590 9471 50  0000 L CNN
F 1 "22nF" H 3590 9380 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 3513 9275 50  0001 C CNN
F 3 "~" H 3475 9425 50  0001 C CNN
	1    3475 9425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0167
U 1 1 66C41331
P 3475 9575
F 0 "#PWR0167" H 3475 9325 50  0001 C CNN
F 1 "GND" H 3480 9402 50  0000 C CNN
F 2 "" H 3475 9575 50  0001 C CNN
F 3 "" H 3475 9575 50  0001 C CNN
	1    3475 9575
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0168
U 1 1 66C41337
P 3475 9275
F 0 "#PWR0168" H 3475 9125 50  0001 C CNN
F 1 "+5P" H 3490 9448 50  0000 C CNN
F 2 "" H 3475 9275 50  0001 C CNN
F 3 "" H 3475 9275 50  0001 C CNN
	1    3475 9275
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 66C64785
P 4250 9450
F 0 "C17" H 4365 9496 50  0000 L CNN
F 1 "22nF" H 4365 9405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4288 9300 50  0001 C CNN
F 3 "~" H 4250 9450 50  0001 C CNN
	1    4250 9450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0169
U 1 1 66C6478B
P 4250 9600
F 0 "#PWR0169" H 4250 9350 50  0001 C CNN
F 1 "GND" H 4255 9427 50  0000 C CNN
F 2 "" H 4250 9600 50  0001 C CNN
F 3 "" H 4250 9600 50  0001 C CNN
	1    4250 9600
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0170
U 1 1 66C64791
P 4250 9300
F 0 "#PWR0170" H 4250 9150 50  0001 C CNN
F 1 "+5P" H 4265 9473 50  0000 C CNN
F 2 "" H 4250 9300 50  0001 C CNN
F 3 "" H 4250 9300 50  0001 C CNN
	1    4250 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9175 3750 9175 5000
Wire Wire Line
	9175 5000 9250 5000
Wire Wire Line
	9175 3750 10175 3750
Wire Wire Line
	9850 5100 9900 5100
Wire Wire Line
	11550 5100 11550 3450
Wire Wire Line
	11550 3450 13050 3450
$Comp
L 74xx:74LS08 U15
U 4 1 66D1B9F7
P 10250 5500
F 0 "U15" H 10250 5825 50  0000 C CNN
F 1 "74LS08" H 10250 5734 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10250 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10250 5500 50  0001 C CNN
	4    10250 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 5100 9900 5600
Wire Wire Line
	9900 5600 9950 5600
Connection ~ 9900 5100
Wire Wire Line
	9900 5100 11550 5100
Wire Wire Line
	9950 5400 9825 5400
Wire Wire Line
	9825 5400 9825 5125
Wire Wire Line
	9825 5125 11575 5125
Wire Wire Line
	11575 5125 11575 3550
Wire Wire Line
	11575 3550 13050 3550
$Comp
L power:GND #PWR0171
U 1 1 66E04480
P 5700 8800
F 0 "#PWR0171" H 5700 8550 50  0001 C CNN
F 1 "GND" H 5705 8627 50  0000 C CNN
F 2 "" H 5700 8800 50  0001 C CNN
F 3 "" H 5700 8800 50  0001 C CNN
	1    5700 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5P #PWR0172
U 1 1 66E04681
P 5700 8500
F 0 "#PWR0172" H 5700 8350 50  0001 C CNN
F 1 "+5P" H 5715 8673 50  0000 C CNN
F 2 "" H 5700 8500 50  0001 C CNN
F 3 "" H 5700 8500 50  0001 C CNN
	1    5700 8500
	1    0    0    -1  
$EndComp
Text GLabel 2000 7800 2    50   Input ~ 0
N13
$Comp
L power:+5P #PWR0173
U 1 1 66E5700B
P 3500 5750
F 0 "#PWR0173" H 3500 5600 50  0001 C CNN
F 1 "+5P" H 3515 5923 50  0000 C CNN
F 2 "" H 3500 5750 50  0001 C CNN
F 3 "" H 3500 5750 50  0001 C CNN
	1    3500 5750
	1    0    0    -1  
$EndComp
Text GLabel 3500 6050 3    50   Input ~ 0
N13
Text GLabel 14250 3250 2    50   Input ~ 0
N13
Text GLabel 10175 3400 0    50   Input ~ 0
N13
Wire Wire Line
	7300 1400 6925 1400
Connection ~ 7300 1400
Text GLabel 6925 1400 0    50   Input ~ 0
N09
$Comp
L 74xx:74LS08 U15
U 1 1 66E84F55
P 8275 1350
F 0 "U15" H 8275 1675 50  0000 C CNN
F 1 "74LS08" H 8275 1584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8275 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8275 1350 50  0001 C CNN
	1    8275 1350
	1    0    0    -1  
$EndComp
Text GLabel 7975 1450 0    50   Input ~ 0
MEI
Text GLabel 8575 1350 2    50   Input ~ 0
MEO
Text GLabel 6175 6100 0    50   Input ~ 0
N09
Text GLabel 7400 5450 0    50   Input ~ 0
N09
Wire Wire Line
	2000 5450 2050 5450
Text GLabel 2575 5725 2    50   Input ~ 0
N09
Wire Wire Line
	2050 5450 2050 5725
Wire Wire Line
	2050 5725 2575 5725
Connection ~ 2050 5450
Wire Wire Line
	2050 5450 2175 5450
Text GLabel 2175 5750 2    50   Input ~ 0
N24
Text GLabel 1000 7800 0    50   Input ~ 0
N24
Wire Wire Line
	2000 5750 2175 5750
Text GLabel 3300 7675 0    50   Input ~ 0
N09
Text GLabel 6175 6200 0    50   Input ~ 0
N24
Text GLabel 7300 7650 0    50   Input ~ 0
N24
Wire Wire Line
	7575 7650 7300 7650
Text GLabel 3900 7775 2    50   Input ~ 0
N14
Text GLabel 8075 5875 0    50   Input ~ 0
N14
Wire Wire Line
	4775 6225 4775 6400
Wire Wire Line
	4775 6400 4950 6400
Connection ~ 4775 6225
Wire Wire Line
	4775 6225 4825 6225
Text GLabel 4950 6400 2    50   Input ~ 0
DB0
Text GLabel 14375 1950 2    50   Input ~ 0
N33
$Comp
L Connector_Generic:Conn_01x04 J7
U 1 1 662725FB
P 15550 3775
F 0 "J7" H 15630 3767 50  0000 L CNN
F 1 "TXD1" H 15630 3676 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15550 3775 50  0001 C CNN
F 3 "~" H 15550 3775 50  0001 C CNN
	1    15550 3775
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J8
U 1 1 66298460
P 15550 4175
F 0 "J8" H 15630 4167 50  0000 L CNN
F 1 "RxD1" H 15630 4076 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15550 4175 50  0001 C CNN
F 3 "~" H 15550 4175 50  0001 C CNN
	1    15550 4175
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J9
U 1 1 66298B0B
P 15550 4575
F 0 "J9" H 15630 4567 50  0000 L CNN
F 1 "CTS1" H 15630 4476 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15550 4575 50  0001 C CNN
F 3 "~" H 15550 4575 50  0001 C CNN
	1    15550 4575
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J10
U 1 1 66298F59
P 15550 4975
F 0 "J10" H 15630 4967 50  0000 L CNN
F 1 "DTR1" H 15630 4876 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15550 4975 50  0001 C CNN
F 3 "~" H 15550 4975 50  0001 C CNN
	1    15550 4975
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 662DA735
P 15525 8425
F 0 "J3" H 15605 8417 50  0000 L CNN
F 1 "TXD2" H 15605 8326 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15525 8425 50  0001 C CNN
F 3 "~" H 15525 8425 50  0001 C CNN
	1    15525 8425
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 662DBEED
P 15525 8825
F 0 "J4" H 15605 8817 50  0000 L CNN
F 1 "RxD2" H 15605 8726 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15525 8825 50  0001 C CNN
F 3 "~" H 15525 8825 50  0001 C CNN
	1    15525 8825
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J5
U 1 1 662DBEF7
P 15525 9225
F 0 "J5" H 15605 9217 50  0000 L CNN
F 1 "CTS2" H 15605 9126 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15525 9225 50  0001 C CNN
F 3 "~" H 15525 9225 50  0001 C CNN
	1    15525 9225
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 662DBF01
P 15525 9625
F 0 "J6" H 15605 9617 50  0000 L CNN
F 1 "DTR2" H 15605 9526 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15525 9625 50  0001 C CNN
F 3 "~" H 15525 9625 50  0001 C CNN
	1    15525 9625
	1    0    0    -1  
$EndComp
Wire Wire Line
	14525 3875 15350 3875
Wire Wire Line
	14575 5825 14575 4275
Wire Wire Line
	14575 4275 15350 4275
Wire Wire Line
	14575 5825 14775 5825
Wire Wire Line
	14600 6125 14600 4675
Wire Wire Line
	14600 4675 15350 4675
Wire Wire Line
	14600 6125 14775 6125
Wire Wire Line
	14625 6225 14625 5075
Wire Wire Line
	14625 5075 15350 5075
Wire Wire Line
	14625 6225 14775 6225
Wire Wire Line
	14275 9325 15325 9325
Wire Wire Line
	14275 7700 14275 9325
Wire Wire Line
	14200 9725 15325 9725
Wire Wire Line
	14200 7800 14200 9725
Wire Wire Line
	15325 8925 14300 8925
Wire Wire Line
	14300 8925 14300 7400
Wire Wire Line
	14300 7400 14775 7400
Wire Wire Line
	14225 7600 14225 8525
Wire Wire Line
	14225 8525 15325 8525
Wire Wire Line
	14225 7600 14775 7600
Wire Wire Line
	8475 9825 8075 9825
Wire Wire Line
	8075 9825 8075 9425
Wire Wire Line
	8075 9425 8175 9425
Wire Wire Line
	8475 9225 8075 9225
Wire Wire Line
	8075 9225 8075 9425
Connection ~ 8075 9425
$Comp
L power:+5P #PWR0109
U 1 1 66D232CB
P 8075 9225
F 0 "#PWR0109" H 8075 9075 50  0001 C CNN
F 1 "+5P" H 8090 9398 50  0000 C CNN
F 2 "" H 8075 9225 50  0001 C CNN
F 3 "" H 8075 9225 50  0001 C CNN
	1    8075 9225
	1    0    0    -1  
$EndComp
Connection ~ 8075 9225
Wire Wire Line
	7275 9400 7275 9600
$Comp
L power:GND #PWR0145
U 1 1 66D8DC95
P 7275 9600
F 0 "#PWR0145" H 7275 9350 50  0001 C CNN
F 1 "GND" H 7280 9427 50  0000 C CNN
F 2 "" H 7275 9600 50  0001 C CNN
F 3 "" H 7275 9600 50  0001 C CNN
	1    7275 9600
	1    0    0    -1  
$EndComp
Connection ~ 7275 9600
$Comp
L SamacSys_Parts:MAX238CWG+ IC3
U 1 1 6635976C
P 12250 5125
F 0 "IC3" H 12850 5390 50  0000 C CNN
F 1 "MAX238CWG+" H 12850 5299 50  0000 C CNN
F 2 "SOIC127P1032X265-24N" H 13300 5225 50  0001 L CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/MAX220-MAX249.pdf" H 13300 5125 50  0001 L CNN
F 4 "MAX238CWG+, Line Transceiver, EIA/TIA-232-E, RS-232, V.24, V.28 4-TX 4-RX 4-TRX, 5 V, 24-Pin SOIC W" H 13300 5025 50  0001 L CNN "Description"
F 5 "2.65" H 13300 4925 50  0001 L CNN "Height"
F 6 "Analog Devices" H 13300 4825 50  0001 L CNN "Manufacturer_Name"
F 7 "MAX238CWG+" H 13300 4725 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "700-MAX238CWG" H 13300 4625 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Analog-Devices-Maxim-Integrated/MAX238CWG%2b?qs=1THa7WoU59HhhWkUvGyQ5g%3D%3D" H 13300 4525 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 13300 4425 50  0001 L CNN "Arrow Part Number"
F 11 "" H 13300 4325 50  0001 L CNN "Arrow Price/Stock"
	1    12250 5125
	1    0    0    -1  
$EndComp
Wire Wire Line
	11925 6125 12250 6125
Wire Wire Line
	11925 5075 11925 6125
Wire Wire Line
	13450 6025 13675 6025
Wire Wire Line
	13675 6025 13675 6500
Wire Wire Line
	12000 4775 12000 5925
Wire Wire Line
	12000 5925 12250 5925
Wire Wire Line
	12250 6025 12075 6025
Wire Wire Line
	12075 6025 12075 6475
Wire Wire Line
	12375 6475 12375 6275
Wire Wire Line
	12375 6275 12250 6275
Wire Wire Line
	12250 6275 12250 6225
Wire Wire Line
	11975 6500 11975 5825
Wire Wire Line
	11975 5825 12250 5825
$Comp
L Device:CP C3
U 1 1 6674FE64
P 13575 6350
F 0 "C3" H 13693 6396 50  0000 L CNN
F 1 "1µ" H 13693 6305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 13613 6200 50  0001 C CNN
F 3 "~" H 13575 6350 50  0001 C CNN
	1    13575 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	13575 6500 13450 6500
Wire Wire Line
	13450 6500 13450 6225
Wire Wire Line
	13450 6125 13575 6125
Wire Wire Line
	13575 6125 13575 6200
Text GLabel 11175 2150 2    50   Input ~ 0
TXDA
Text GLabel 11175 1950 2    50   Input ~ 0
RXDA
Text GLabel 11175 2700 2    50   Input ~ 0
CTSA
Text GLabel 11175 2800 2    50   Input ~ 0
DTRA
Text GLabel 11175 3050 2    50   Input ~ 0
RXDB
Text GLabel 11175 3250 2    50   Input ~ 0
TXDB
Text GLabel 11175 3800 2    50   Input ~ 0
CTSB
Text GLabel 11175 3900 2    50   Input ~ 0
DTRB
Text GLabel 15350 3775 0    50   Input ~ 0
TXDA
Text GLabel 15350 4175 0    50   Input ~ 0
RXDA
Text GLabel 15350 4575 0    50   Input ~ 0
CTSA
Text GLabel 15350 4975 0    50   Input ~ 0
DTRA
Text GLabel 15325 8425 0    50   Input ~ 0
TXDB
Text GLabel 15325 8825 0    50   Input ~ 0
RXDB
Text GLabel 15325 9225 0    50   Input ~ 0
CTSB
Text GLabel 15325 9625 0    50   Input ~ 0
DTRB
Wire Wire Line
	15350 3675 14250 3675
Wire Wire Line
	14250 3675 14250 4575
Wire Wire Line
	14250 4575 12150 4575
Wire Wire Line
	12150 4575 12150 5525
Wire Wire Line
	12150 5525 12250 5525
Wire Wire Line
	12175 4600 14275 4600
Wire Wire Line
	14275 4600 14275 3975
Wire Wire Line
	14275 3975 15350 3975
Wire Wire Line
	15350 4075 14300 4075
Wire Wire Line
	14300 4075 14300 4550
Wire Wire Line
	14300 4550 12125 4550
Wire Wire Line
	12125 4550 12125 5625
Wire Wire Line
	12125 5625 12250 5625
Wire Wire Line
	12250 5725 12100 5725
Wire Wire Line
	12100 5725 12100 4525
Wire Wire Line
	12100 4525 14325 4525
Wire Wire Line
	14325 4525 14325 4375
Wire Wire Line
	14325 4375 15350 4375
Wire Wire Line
	12175 4600 12175 5225
Wire Wire Line
	12175 5225 12250 5225
Wire Wire Line
	12250 5425 12075 5425
Wire Wire Line
	12075 5425 12075 4475
Wire Wire Line
	12075 4475 15350 4475
Wire Wire Line
	15350 4775 14550 4775
Wire Wire Line
	14550 4775 14550 4500
Wire Wire Line
	14550 4500 12050 4500
Wire Wire Line
	12050 4500 12050 5325
Wire Wire Line
	12050 5325 12250 5325
Wire Wire Line
	12200 5125 12200 4625
Wire Wire Line
	12200 4625 14325 4625
Wire Wire Line
	14325 4625 14325 5175
Wire Wire Line
	14325 5175 15350 5175
Wire Wire Line
	13450 5725 14550 5725
Wire Wire Line
	14550 5725 14550 4875
Wire Wire Line
	14550 4875 15350 4875
Wire Wire Line
	14525 6025 14775 6025
Wire Wire Line
	14525 3875 14525 6025
Wire Wire Line
	12200 5125 12250 5125
Wire Wire Line
	13450 5625 14500 5625
Wire Wire Line
	14500 8325 15325 8325
Wire Wire Line
	14500 5625 14500 8325
Wire Wire Line
	15325 8625 14475 8625
Wire Wire Line
	14475 8625 14475 5125
Wire Wire Line
	14475 5125 13450 5125
Wire Wire Line
	13450 5425 14450 5425
Wire Wire Line
	14450 5425 14450 9525
Wire Wire Line
	14450 9525 15325 9525
Wire Wire Line
	15325 9825 14425 9825
Wire Wire Line
	14425 9825 14425 5525
Wire Wire Line
	14425 5525 13450 5525
Wire Wire Line
	13450 5325 14400 5325
Wire Wire Line
	14400 5325 14400 8725
Wire Wire Line
	14400 8725 15325 8725
Wire Wire Line
	15325 9025 14375 9025
Wire Wire Line
	14375 9025 14375 5225
Wire Wire Line
	14375 5225 13450 5225
Wire Wire Line
	13450 5825 14350 5825
Wire Wire Line
	14350 5825 14350 9125
Wire Wire Line
	14350 9125 15325 9125
Wire Wire Line
	15325 9425 14250 9425
Wire Wire Line
	14250 9425 14250 5925
Wire Wire Line
	14250 5925 13450 5925
$EndSCHEMATC
