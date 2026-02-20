#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "time.h"

#include "ac1_interface.h"
#include "ac1_picom.h"
#include "ac1_sdcard.h"

bool flag = false;
char prn_name[18];

uint8_t prn_buf[0x20000];
uint32_t ix;
uint32_t cnt; //Bytezähler

//Aufruf nur aus Core 0 zulässig
//Druck-Taste
void set_printfile(bool b) {
  if (b) {    //Initialisieren
    //Dateinamen generieren
    cnt = 0;
    sprintf(prn_name, "P%.04d.txt", cfg_get_prn_nr());      
    ix = 0;
    flag = true;  
  } else {    //Druckfile schließen
    if (ix > 0) {
      save_file(prn_buf, prn_name, ix, false);  //ohne Header speichern  
      uint16_t nx = cfg_get_prn_nr();
      cfg_set_prn_nr(++nx);
      ix = 0;
    }
    prn_name[0] = 0;
    flag = false;
  }
  cfg_set_prnname(prn_name);
}

bool is_printfile() {
  return flag;
}

void stop_printfile() {
  flag = false;
}

char* get_printfile_name() {
  return prn_name;
}

//Aufruf aus Core 1
void print_to_file (char x) {
  if (flag) {
    prn_buf[ix] = x;
    if (ix < sizeof(prn_buf)){
      if ((cnt % 100) == 0) {
        char buf[24];
        sprintf(buf, "%s  %0.1fkB", prn_name, cnt/1024.0);
        cfg_set_prnname(buf); //Druckdatei Name und Länge zur Anzeige vormerken
      }
      cnt++;  
      ix++;      
    }
  }    
}