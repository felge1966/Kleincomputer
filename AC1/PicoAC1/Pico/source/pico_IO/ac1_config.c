#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"

#include "pico/multicore.h"
#include "hardware/sync.h"
#include "hardware/clocks.h"
#include "tusb.h"

#include "sd_card.h"
#include "ff.h"
#include "diskio.h"
#include "hw_config.h"

#include "ac1_interface.h"
#include "ac1_config.h"
#include "ac1_picom.h"
#include "ac1_printfile.h"
#include "ac1_sdcard.h"




//Default-Einstellungen, keine .config oder keine SD-Karte
cfg_data_t cfg_data_def = {
    .version = 0,
    .monitor = 0,       //Mon V3.1 + monX Erw.
    .clk = 0,           //2MHz
    .zg = 1,            //AC1 9x12
    .kbd = 0,           //keine Feststelltaste
    .cco = WHITE,       //Zeichenfarbe weiß
    .bkco = BLACK,      //Hintergrundfarbe schwarz
    .fco = YELLOW,      //Rahmenfarbe gelb
    .prncnt = 1,        //fortl. Druck-Nummer
    .resA = 0,          //Reserve f. weitere Funktionen
    .resB = 0
};

cfg_data_t cfg_data;

uint8_t disp_frq;

bool changed_mon = false;
bool changed_clk = false;
bool changed_kbd = false;
bool changed_zg  = false;
bool changed_prn = false;
bool changed_col = false;
bool changed_cnt = false;
bool changed_pname = false;
bool changed_prnname = false;

bool is_sd = true;

static char pname[SZ_NBUF]; 
static char prnname[SZ_NBUF];
//----------------------------------------------------------------------------------

//Zyklische Prüfung aus Core0
//picom-Schnittstelle nur aus Core0 bedienen !
void cfg_check() {
  bool b = false;

  if (changed_mon) {
    picom_write_command(21, &cfg_data.monitor, 1); 
    b = true;
    changed_mon = false;  
  }
  if (changed_zg) {
    picom_write_command(2, &cfg_data.zg, 1);
    b = true;
    changed_zg = false;
  }
  if (changed_clk) {
    picom_write_command(22, &disp_frq, 1);  
    b = true;
    changed_clk = false;
  }
  if (changed_kbd) {
    picom_write_command(23, &cfg_data.kbd, 1);
    b = true;
    changed_kbd = false;
  }
  if (changed_col) {
    picom_write_command(1, &cfg_data.cco, 3);
    b = true;
    changed_col = false;
  }
  if (changed_cnt) {
    b = true;
    changed_cnt = false;
  }
  if (changed_pname) {
    picom_write_command(24, pname, strlen(pname)+1);
    changed_pname = false;
  }
  if (changed_prnname) {
    picom_write_command(26, prnname, strlen(prnname)+1);
    changed_prnname = false;
  }

  if (b) save_cfg(cfg_data);
}

void cfg_init() {
  
  if (load_cfg(&cfg_data) != 0) cfg_data = cfg_data_def;
  cfg_set_clk(cfg_data.clk);
  cfg_set_monitor(cfg_data.monitor);
  sprintf(pname, "/");
  changed_pname = true;
  prnname[0] = 0;

  picom_write_command(21, &cfg_data.monitor, 1);
  picom_write_command(22, &disp_frq, 1);
  picom_write_command(23, &cfg_data.kbd, 1);
  picom_write_command(2, &cfg_data.zg, 1);
  picom_write_command(24, pname, strlen(pname)+1);
  picom_write_command(1, &cfg_data.cco, 3);
}

//Monitor-Variante 0..3 , EPRORM A12/A13
void cfg_set_monitor (uint8_t x) {
  gpio_put(EPROM_A12, x & 1);
  gpio_put(EPROM_A13, (x>>1) & 1);
  changed_mon = (cfg_data.monitor != x);
  cfg_data.monitor = x;  
}


//Zeichengeneratot 0..2 AC1 / 3..5 SCCH
void cfg_set_zg(uint8_t x) {
  changed_zg = (cfg_data.zg != x);
  cfg_data.zg = x;
}

//Taktfrequenz 0..3
void cfg_set_clk(uint8_t x) { // 0: 2MHz | 1: 4MHz | 2: 6MHz | 3: 8MHz | ???
  uint8_t f;  
  x &= 3;
  uint8_t div = Z80_CLK_DIV_2MHZ;
  switch (x) {
    case 0: div = Z80_CLK_DIV_2MHZ; f = 2; break; 
    case 1: div = Z80_CLK_DIV_4MHZ; f = 4; break; 
    case 2: div = Z80_CLK_DIV_6MHZ; f = 6; break; 
    case 3: div = Z80_CLK_DIV_8MHZ; f = 8; break; 
  } 
  clock_gpio_init(Z80_CLK_OUT, CLOCKS_CLK_GPOUT1_CTRL_AUXSRC_VALUE_CLK_USB, div);  
  disp_frq = f;  
  changed_clk = (cfg_data.clk != x);
  cfg_data.clk = x;
}

void cfg_set_kbd(uint8_t x) {
  changed_kbd =(cfg_data.kbd != x);
  cfg_data.kbd = x;
}

uint8_t cfg_get_kbd() {
  return cfg_data.kbd;
}

void cfg_set_colors(uint8_t cco, uint8_t bkco, uint8_t fco) {
  changed_col =  ((cfg_data.cco != cco) || (cfg_data.bkco != bkco) || (cfg_data.fco != fco));
  cfg_data.cco = cco;
  cfg_data.bkco = bkco;  
  cfg_data.fco = fco;
}

//lfd Druckdatei-Nummer
void cfg_set_prn_nr(uint16_t xx) {
  cfg_data.prncnt = xx;
  changed_cnt = true;
}

uint16_t cfg_get_prn_nr() {
  return cfg_data.prncnt;
}

//Verzeichnisname nur zur Anzeige
void cfg_set_pathname(char* pn) {
  if (strcmp(pname, pn) != 0) {
    strcpy(pname, pn);
    changed_pname = true;
  }
}

//Druckdateiname nur zur Anzeige
void cfg_set_prnname(char* pn) {
  if (strcmp(prnname, pn) != 0) {
    strcpy(prnname, pn);
    changed_prnname = true;
  }
}
//-----------------------------------------------------------------------------
