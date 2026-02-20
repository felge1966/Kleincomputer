#ifndef AC1_ZCOM_H_
#define AC1_ZCOM_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"

//globale Variable
extern uint8_t fc_com;  //Flowcontrol Datei speichern
extern uint32_t bcnt_sd; //Bitzähler speichern
extern uint8_t sres_buf[32];
extern bool resp_ready;

void start_zcom_op(char x);

void fc_zcom_initial();
uint8_t char_from_zcom(uint8_t c);
uint8_t char_to_zcom();

void sd_card_check();
bool sd_card_detected();

//void print_to_file(uint8_t c);


#endif