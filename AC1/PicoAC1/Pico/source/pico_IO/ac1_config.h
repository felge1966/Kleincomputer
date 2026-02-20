#ifndef _AC1_CONFIG_H_
#define _AC1_CONFIG_H_

#include <stdlib.h>
#include <stdio.h>


//Datenstruktur zum Speichern der Einstellungen
typedef struct __attribute__((packed)) {
    uint8_t version;    //Versionsnummer des cfg-File = 0
    uint8_t monitor;    //Monitorversion 0..3
    uint8_t clk;        //Taktfrequenz 0..3
    uint8_t kbd;        //Bit 0-NL, 1-CL, 2-SL
    uint8_t zg;         //Zeichengenerator 0..3 5..7
    uint8_t cco;        //Zeichenfarbe 0..7
    uint8_t bkco;       //Hintergrundfarbe
    uint8_t fco;        //Rahmenfarbe
    uint16_t prncnt;    //fortl. Drucknummer
    uint64_t resA;      //Reserve f. weitere Funktionen
    uint64_t resB;  
} cfg_data_t;

//SD-Karte durch einen Prozess auf dem anderen Kern blockiert
//extern bool sd_blocked;

void cfg_check();
void cfg_init();

void cfg_set_monitor (uint8_t x);
void cfg_set_zg(uint8_t x);
void cfg_set_clk(uint8_t x);
void cfg_set_kbd(uint8_t x);
uint8_t cfg_get_kbd();
void cfg_set_colors(uint8_t cco, uint8_t bkco, uint8_t fco);
void cfg_set_prn_nr(uint16_t xx);
uint16_t cfg_get_prn_nr();
void cfg_set_pathname(char* pn);
void cfg_set_prnname(char* pn);


#endif