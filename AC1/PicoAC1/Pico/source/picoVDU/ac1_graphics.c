#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hardware/gpio.h"

#include "vga_graphics.h"
#include "ac1_graphics.h"
//#include "ac1_interface.h"
#include "ac1_statusline.h"

//Zeichengeneratoren
#include "ac1_zg_6x8.h"     //Ur-AC1 Zeichengenerator 256 Zeichen (J.Hannemann)
#include "ac1_zg_9x12.h"
#include "ac1_zg_10x14.h" 
#include "scch_zg_6x8.h"    //SCCH von ac1-info.de
#include "scch_zg_9x12.h"
#include "scch_zg_10x14.h"

enum colors ac1_color = WHITE;
enum colors ac1_bg_color = BLACK;
enum colors ac1_frame_color = BLACK;

static uint8_t zg_current = 1;

//Ausgabebereich im VGA-Fenster zentrieren
uint16_t px_ofs_left = 0; //  128 |  32  |   0   ->  Pixeloffset links
uint16_t px_ofs_top  = 0; //  112 |  48  |  16   ->  Pixeloffset oben       
//Zeichengenerator
uint8_t zg_px_per_line    = 0;     // 6 |  9 | 10
uint8_t zg_lines_per_char = 0;    //  8 | 12 | 14

uint8_t  chars_per_line = 64; //Zeichen je Zeile

// Zwischenspeicher BWS-ASCII
// char - Bit 7..0
// flag - Bit 15: true zeigt an, dass Zeichen in VGA-Puffer übernommen werden muss
uint16_t bws_buffer[BWS_SIZE];

uint16_t *ac1_font_ptr;

void draw_frame() {
  switch (zg_current) {
    case 0: drawRect(128-3, 112-3, 384+6, 256+6, ac1_frame_color); break;
    case 1: drawRect(32-3, 48-3, 576+6, 384+6, ac1_frame_color); break;
  //case 2: drawRect(0, 16-3, 640, 448+6, ac1_frame_color); break;
    case 4: drawRect(128-3, 112-3, 384+6, 256+6, ac1_frame_color); break;
    case 5: drawRect(32-3, 48-3, 576+6, 384+6, ac1_frame_color); break;
  //case 6: drawRect(0, 16-3, 640, 448+6, ac1_frame_color); break;
  }
}


void ac1_init_zg(uint8_t zg_mode) {
  zg_current = zg_mode;
  switch (zg_mode) {
    case 0: //6x8 -> Original ZG des AC1
      px_ofs_left = 128; 
      px_ofs_top  = 112;        
      zg_px_per_line = 6; 
      zg_lines_per_char = 8; 
      ac1_font_ptr = ac1_font_6x8;
      break;
    case 1: //9x12 
      px_ofs_left = 32; 
      px_ofs_top  = 48;        
      zg_px_per_line = 9;  
      zg_lines_per_char = 12; 
      ac1_font_ptr = ac1_font_9x12;
      break; 
    case 2: //10x14
      px_ofs_left = 0; 
      px_ofs_top  = 8;  //16;        
      zg_px_per_line = 10; 
      zg_lines_per_char = 14;
      ac1_font_ptr = ac1_font_10x14;
      break;

    //SCCH . Zeichengeneratoren     
    case 4: //6x8 
      px_ofs_left = 128; 
      px_ofs_top  = 112;        
      zg_px_per_line = 6; 
      zg_lines_per_char = 8; 
      ac1_font_ptr = scch_font_6x8;
      break;
    case 5: //9x12 
      px_ofs_left = 32; 
      px_ofs_top  = 48;        
      zg_px_per_line = 9;  
      zg_lines_per_char = 12; 
      ac1_font_ptr = scch_font_9x12;
      break; 
    case 6: //10x14
      px_ofs_left = 0; 
      px_ofs_top  = 8; //16;        
      zg_px_per_line = 10; 
      zg_lines_per_char = 14;
      ac1_font_ptr = scch_font_10x14;
      break;
  }
  draw_frame();
  sl_draw_all();
}

//BWS-Flags zur Komplet-Aktualisierung
void ac1_refresh_bws() {
  for (int i=0; i<BWS_SIZE; i++)
    bws_buffer[i] |= 0x8000;
}

//Initialisierung picoVDU
//zg_mode ->  1: 6x8 | 2:9x12 | 3: 10x14 
void ac1_vdu_init(uint8_t zg_mode) {
  int i;
  for (i=0; i<BWS_SIZE; i++)
    bws_buffer[i] = 0x8020;   //BWS mit Leerzeichen und geseztem flag füllen

  //onboard-led, ggf für Testzwecke
  gpio_init(LED_PIN);
  gpio_set_dir(LED_PIN, GPIO_OUT);

  //Steuerung Adress- / Datenmultiplexer 74xx03 initialisieren
  gpio_init(MUX_ADRS);
  gpio_set_dir(MUX_ADRS, GPIO_OUT);
  gpio_put(MUX_ADRS, 0);  //MUX sperren
  gpio_init(MUX_DATS);
  gpio_set_dir(MUX_DATS, GPIO_OUT);
  gpio_put(MUX_DATS, 0);

  gpio_init(BWS_TRIG);
  gpio_set_dir(BWS_TRIG, GPIO_IN);
  gpio_pull_up(BWS_TRIG);

  //Adressbits -> GPIO-Input, pullup
  //GPIO sollten nach dem Start bereits Input/pull_dwn sein ??
  uint32_t inp_mask = 
    ADR00 | ADR01 | ADR02 | ADR03 | ADR04 | ADR05 | ADR06 | ADR07 | ADR08 | ADR09 | ADR10 |
    DAT0 | DAT1 | DAT2 | DAT3 | DAT4 | DAT5 | DAT6 | DAT7;

  gpio_init_mask(inp_mask); 
  gpio_set_dir_masked(inp_mask, 0); //Alle IO der Maske als Input

  //Pullup f. alle Adress- / Daten-Pad
  //interne Pullup ca. 47-60k -> zusätzl. externe Pullup erforderlich
  for (uint32_t j=0; j<30; j++) {
    if ((inp_mask & (1<<j)) != 0) 
       gpio_pull_up(j);
  }
  
  ac1_init_zg(zg_mode);

  
  //kompletten BWS in Pixelpuffer schreiben -> Aktalisierungsflag setzen
  //funktioniert nicht nach Kaltstart
  ac1_refresh_bws();  
  
}

//Zeichen in BWS-Buffer schreiben, Flag setzen
void ac1_chr_to_bws(uint16_t adr, char c) {
  bws_buffer[adr & (BWS_SIZE-1)] = 0x8000 | c;
}


// Draw the character "c"
// pos: Zeichenposition im AC1-BWS (0..2047)
static void ac1_drawChar(uint16_t pos, char c) {
  char i;           //Zeilennummer in ZG
  char j;           //Pixelposition einer Zeile im ZG
  short x, y;       //Pixelposition im "BWS" - Pixel TopLeft des Zeichens      
 
  //Pixelposition des Zeichens im VGA-Fenster - TopLeft
  x = (pos % chars_per_line) * zg_px_per_line + px_ofs_left;
  y = (pos / chars_per_line) * zg_lines_per_char + px_ofs_top;

  for (i=0; i < zg_lines_per_char; i++) {          //ZG - Zeilen je Zeichen
    uint16_t pxline = ac1_font_ptr[(c * zg_lines_per_char ) + i];  //Pixelzeile aus ZG
    for ( j = 0; j < zg_px_per_line; j++) {      //Pixel je Zeile des Zeichens
      if (pxline & 0x1) {
          drawPixel(x+j, y+i, ac1_color);
        } else {
          drawPixel(x+j, y+i, ac1_bg_color);
      }
      pxline >>= 1;
    }
  }
}

// gesamten BWS nach gesetztem Flag durchsuchen
// Wenn Bit15 == 1 -> Zeichen in Pixelpuffer schreiben und Flag rücksetzen
void ac1_bws_to_vga_px() {
  for (uint16_t adr=0; adr<BWS_SIZE; adr++) {
    if ((bws_buffer[adr] & 0x8000) != 0) {
      bws_buffer[adr] &= 0x00FF;
      ac1_drawChar(adr, (char)bws_buffer[adr]);
    }
  }
}

//Zeichen- und Hintergrundfarbe des AC1-Monitors setzen
void ac1_set_colors(enum colors c, enum colors bgc, enum colors frc) {
  ac1_color = c;
  ac1_bg_color = bgc;
  ac1_frame_color = frc;
}

