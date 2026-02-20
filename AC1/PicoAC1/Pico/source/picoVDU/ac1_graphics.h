#ifndef _AC1_GRAPHICS_H_
#define _AC1_GRAPHICS_H_

#include <stdio.h>
#include <stdlib.h>

#include "ac1_interface.h"

extern uint16_t bws_buffer[BWS_SIZE];

void draw_frame();
void ac1_init_zg(uint8_t zg_mode);
void ac1_vdu_init(uint8_t zg_mode);
void ac1_chr_to_bws(uint16_t adr, char c);
void ac1_bws_to_vga_px();
void ac1_set_colors(enum colors c, enum colors bgc, enum colors frc);
void ac1_refresh_bws();


#endif