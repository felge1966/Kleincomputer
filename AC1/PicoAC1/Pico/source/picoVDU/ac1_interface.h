#ifndef _AC1_INTERFACE_H_
#define _AC1_INTERFACE_H_

/*
 * feste GPIO-Zuordnung f. VGA-Ausgang
 *  - GPIO 16 ---> VGA Hsync
 *  - GPIO 17 ---> VGA Vsync
 *  - GPIO 18 ---> VGA Red
 *  - GPIO 19 ---> VGA Green
 *  - GPIO 20 ---> VGA Blue
 *  - RP2040 GND ---> VGA GND
*/

#define LED_PIN     PICO_DEFAULT_LED_PIN    //GPIO 25
#define DEBUG_PIN1  28                     

//Anzahl Zeichen im BWS
#define BWS_SIZE    2048

/* --> PicoMEM
//Systemtakt
//feste Zuordnung !!! GPIO21 -> andere mögl GPIO[23,24,25] sind am Pico nicht verfügbat
#define Z80_CLK_OUT 21      //fix - Ausgang Systemtakt z. Z80
#define Z80_CLK_DIV 24      //Teiler USB-Systemtakt (48MHz) 24 -> 2MHz / 12 -> 4MHz
*/

//Zuordnung der Adressbits "1 << GPIOx"
#define ADR00       (1<<0)
#define ADR01       (1<<1)
#define ADR02       (1<<2)
#define ADR03       (1<<3)
#define ADR04       (1<<4)
#define ADR05       (1<<5)
#define ADR06       (1<<6)
#define ADR07       (1<<7)
#define ADR08       (1<<8)
#define ADR09       (1<<9)
#define ADR10       (1<<10)

//Zuordnung der Datenbits
#define DAT0        (1<<0)
#define DAT1        (1<<1)
#define DAT2        (1<<2)
#define DAT3        (1<<3)
#define DAT4        (1<<4)
#define DAT5        (1<<5)
#define DAT6        (1<<6)
#define DAT7        (1<<7)


//GPIO f. Adress- Daten- Multiplexer 74xx03
#define MUX_ADRS        11
#define MUX_DATS        12

//Trigger f. BWS - Adressen & Daten vom Z80-Bus lesen
#define BWS_TRIG        13
#define BWS_TRIG_ACTIVE 0    //0: low-active | 1: high-active
    
// picom-Schnittstelle Slave (I2C - Master:pico_IO --> Slave:picoVDU)
#define PICOM_CLK          15
#define PICOM_DATA         14
#define I2C_SLAVE_ADDRESS  0x17
#define I2C_BAUDRATE       100000 // 100 kHz
#define PICOM_I2C_IF       i2c1   //Zuordnung GPIO14/15  


#endif
