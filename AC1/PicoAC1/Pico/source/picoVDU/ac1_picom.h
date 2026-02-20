#ifndef _AC1_PICOM_H_
#define _AC1_PICOM_H_

#include <stdio.h>
#include <stdlib.h>

extern uint8_t fc_picom;

void picom_slave_init();
int get_cnt_picom_char();
uint8_t get_next_picom_char(bool *b);
bool is_picom_ready();


#endif