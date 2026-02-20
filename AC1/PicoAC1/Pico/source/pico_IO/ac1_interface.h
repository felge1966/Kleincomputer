#ifndef AC1_INTERFACE_H
#define AC1_INTERFACE_H

//Debug
#define ONBOARD_LED     25
#define DEBUG_IO        28      //Messausgang

//Systemtakt
//feste Zuordnung GPIO21 -> andere mögl GPIO[23,24,25] sind am Pico nicht verfügbat
#define Z80_CLK_OUT     21      //fix - Ausgang Systemtakt z. Z80
#define Z80_CLK_DIV_2MHZ 12     //Teiler USB-Systemtakt (48MHz) -> 74xx74 2:1 ==> 12-> 2MHz / 6 -> 4MHz
#define Z80_CLK_DIV_4MHZ 6
#define Z80_CLK_DIV_6MHZ 4
#define Z80_CLK_DIV_8MHZ 3

//Serielle Kommunikation Z80-PIO
#define Z80_PIO_CLK      9      //via Levelshifter an PIO-B PB5
#define Z80_PIO_DATA     8      //via Levelshifter an PIO-B PB4

//Z80-Reset
#define Z80_RESET       20      //CPU + CTC, L-active
#define Z80_RESET_INV   19      //Gate Sonderschaltung PIO-Res, H-active

//I2C - RTC
#define RTC_CLK         27
#define RTC_DATA        26
#define RTC_I2C_IF      i2c1	//Identifier for I2C HW Block 1

//I2C - PICOM (Master)
#define PICOM_CLK       17
#define PICOM_DATA      16
#define PICOM_I2C_IF    i2c0
#define PICOM_ADDRESS   0x17
#define PICOM_BAUDRATE  100000 // 100 kHz

//Umschaltung EPROM-Bänke
#define EPROM_A12       15
#define EPROM_A13       14

//Tastatur - IF z. Z80-PIO
#define TD0             0
#define TD1             1
#define TD2             2
#define TD3             3
#define TD4             4
#define TD5             5
#define TD6             6
#define TAST            7

#define TD_MASK         1<<TD0 | 1<<TD1 | 1<<TD2 | 1<< TD3 | 1<<TD4 | 1<<TD5 | 1<<TD6 | 1<<TAST

#define USB_KEY_CNT     0x68

#define AC1BIN_NAME     ".ac1bin"
#define FN_CONFIG       ".config"   //Filename im Root-Verz. der SD-Karte
#define MAX_FILE_NAME_LEN 16

#define FN_KEYSCAN      ".scan2ascii"
#define FN_KEYSCAN_BK   ".scan2ascii.bk"

//Übernahme aus vga_graphics.h
enum colors_e {BLACK=0, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE};

#endif
