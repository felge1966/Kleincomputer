#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "time.h"

#include "vga_graphics.h"
#include "ac1_statusline.h"
#include "ac1_zg_6x8.h"


uint8_t sl_frame_color = YELLOW;
uint8_t sl_text_color = WHITE;
uint8_t sl_bk_color = BLACK;

static const uint16_t sl_top_frame = 460;
static const uint16_t sl_height_frame = 16;
static const uint16_t sl_x0 = 5;
static const uint16_t sl_y0 = sl_top_frame + 4;

static const uint16_t *font = ac1_font_6x8;
static const uint8_t zg_px_per_line = 6;
static const uint8_t zg_lines_per_char = 8;  



//Statuszeile 106 Zeichen
static char sl_mask[] = 
" Monitor:    Clk:  MHz    Kbd:           ZG:       Dir:                   Prn:                         ";
//Ausgabepos    mon clk kbd zg  dir prn time
uint8_t pos[] = {9,  17, 30, 44, 55, 78, 99};
const uint8_t xofs = 7;
uint16_t tlx[]= {11*6+xofs, 24*6+xofs, 39*6+xofs, 49*6+xofs, 72*6+xofs, 97*6+xofs};

char str_mon[]   = "  ";
char str_clk[]   = "  ";
char str_kbd[]   = "        ";
char str_zg[]    = "    ";
char str_dir[]   = "                 ";
char str_prn[]   = "                 ";
char str_time[]  = "      ";

// --------------------------------------------------------------------------------

static void sl_draw_char(uint8_t n, char c){
  char i;           
  char j;           
  short x, y;         

  //Pixelposition des Zeichens im VGA-Fenster
  x = n * zg_px_per_line + sl_x0;
  y = sl_y0;
  for (i=0; i < zg_lines_per_char; i++) {
    uint16_t pxline = font[(c * zg_lines_per_char ) + i];  //Pixelzeile aus ZG
    for ( j = 0; j < zg_px_per_line; j++) {      //Pixel je Zeile des Zeichens
      if (pxline & 0x1) {
        drawPixel(x+j, y+i, sl_text_color);
      } else {
        drawPixel(x+j, y+i, sl_bk_color);
      }
      pxline >>= 1;
    }
  }
}

static void sl_draw_str(uint8_t n, char *buf){
  int i = 0;
  while (buf[i]) { 
    sl_draw_char(n++, buf[i]);
    i++;
  }
}

// ------------------------------------------------------------------------

void sl_draw_mon (uint8_t x) {  //num 1..4
  uint8_t y = (x & 3) + 1;
  sprintf(str_mon, "%d", y);
  sl_draw_str(pos[0], str_mon);  
}

void sl_draw_clk (uint8_t x) {  //num 2/4/6/8/XX
  sprintf(str_clk, "%d", x);
  sl_draw_str(pos[1], str_clk);  
}

void sl_draw_kbd (uint8_t x) {  //Bitmuster Bit: 0-CL | 1: NL | 2-SL
  sprintf(str_kbd, "        ");
  if ((x & 1) != 0) 
  {str_kbd[0] = 'N';  str_kbd[1] = 'L';} 
  if ((x & 2) != 0) 
  {str_kbd[3] = 'C';  str_kbd[4] = 'L';}
  if ((x & 4) != 0) 
  {str_kbd[6] = 'S';  str_kbd[7] = 'L';}
  sl_draw_str(pos[2], str_kbd);  
}

void sl_draw_scancode(uint8_t x) {
  sprintf(str_kbd, "%.2X", x);
  sl_draw_str(pos[2], str_kbd);
}

void sl_draw_zg (uint8_t x) {   //num 0: AC1 | 1:SCCH
  if (x==0) sprintf(str_zg, " AC1 ");
  else sprintf(str_zg, "SCCH");
  sl_draw_str(pos[3], str_zg);
}

void sl_draw_dir(char *c) {  //Zeichenkette max 16 Zeichen + 0x00
  sl_draw_str(pos[4], "                ");
  sprintf(str_dir, "%s", c);
  sl_draw_str(pos[4], str_dir);
}

void sl_draw_prn(char *c) {  //Zeichenkette max 16 Zeichen + 0x00
  sl_draw_str(pos[5], "                  ");
  sprintf(str_prn, "%s", c);
  sl_draw_str(pos[5], str_prn);
}

void sl_draw_time(uint64_t utime) {
  struct tm ti = *localtime(&utime);
  sprintf(str_time,"%.02d:%.02d", ti.tm_hour, ti.tm_min);
  sl_draw_str(pos[6], str_time);
}

void sl_draw_all() {
  drawRect(2,sl_top_frame,636,16, sl_frame_color);
  sl_draw_str(0, sl_mask);
  drawVLine(tlx[0], sl_top_frame, sl_height_frame-1, sl_frame_color);
  drawVLine(tlx[1], sl_top_frame, sl_height_frame-1, sl_frame_color);
  drawVLine(tlx[2], sl_top_frame, sl_height_frame-1, sl_frame_color);
  drawVLine(tlx[3], sl_top_frame, sl_height_frame-1, sl_frame_color);
  drawVLine(tlx[4], sl_top_frame, sl_height_frame-1, sl_frame_color);
  drawVLine(tlx[5], sl_top_frame, sl_height_frame-1, sl_frame_color);
  sl_draw_str(pos[0], str_mon);
  sl_draw_str(pos[1], str_clk); 
  sl_draw_str(pos[2], str_kbd); 
  sl_draw_str(pos[3], str_zg);
  sl_draw_str(pos[4], str_dir);
  sl_draw_str(pos[5], str_prn);
  sl_draw_str(pos[6], str_time);
}


void sl_init() {
  setenv("TZ", "CET-1CEST,M3.5.0,M10.5.0/3", 1);
  tzset();
}