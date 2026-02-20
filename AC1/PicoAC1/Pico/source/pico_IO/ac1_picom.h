#ifndef _AC1_PICOM_H_
#define _AC1_PICOM_H_

#include <stdlib.h>
#include <stdio.h>

void picom_master_init();
int picom_write_command(uint8_t command, uint8_t *buf, int len);

#endif