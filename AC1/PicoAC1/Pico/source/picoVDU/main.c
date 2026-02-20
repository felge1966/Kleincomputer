/**
 * RESOURCES USED
 *  - PIO state machines 0, 1, and 2 on PIO instance 0
 *  - DMA channels 0, 1, 2, and 3
 *  - 153.6 kBytes of RAM (for pixel color data)
 *
 *    VGA-Ressources: Hunter Adams (vha3@cornell.edu)
 */

#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/dma.h"
#include "pico/multicore.h"
#include "hardware/clocks.h"

#include "vga_graphics.h"
#include "ac1_graphics.h"
#include "ac1_interface.h"
#include "ac1_picom.h"
#include "ac1_statusline.h"

// -------------------------------------------------------------------------------

void run_core1() {

  // Init AC1-interface & BWS
  ac1_vdu_init(1);  //ARG = Zeichengenerator nach Start

  //Endlosschleife 
  while (1) {
    //bws-flag-polling, 1x komplett
    ac1_bws_to_vga_px();

    //Kommandos vom picoIO verarbeiten
    if (is_picom_ready()) { //komplettes Kommando empfangen 
      bool b;
      enum colors cc, bgc, frc;
      uint8_t zg, n;
      short x, y, w, h;
      uint64_t t;
      char c;
      char color;
      uint8_t buf[64];

      //1. Zeichen Kommandozeichen
      //weitere Zeichen nach festgelegtem Schema
      uint8_t k = get_next_picom_char(&b);
      switch (k) {  //Kommando auswerten
        case 1:  //Zeichen- Hintergrund- und Framefarbe des AC1-Monitors
          cc = get_next_picom_char(&b);
          bgc = get_next_picom_char(&b);
          frc = get_next_picom_char(&b);
          ac1_set_colors(cc, bgc, frc);
          ac1_refresh_bws();
          draw_frame();
          break;
        case 2:  //Auswahl Zeichengenerator
          fillRect(0, 0, 640, 480, BLACK) ;
          zg = get_next_picom_char(&b);
          ac1_init_zg(zg);  
          ac1_refresh_bws();
          sl_draw_zg(zg<4 ? 0:1);
          break; 

        // Statuszeile -------------------------------------
        case 21:  //Monitorvariante
          x = get_next_picom_char(&b);
          sl_draw_mon(x);
          break;
        case 22:  //Taktfrequenz
          x = get_next_picom_char(&b);
          sl_draw_clk(x);
          break;          
        case 23:  //Feststelltasten
          x = get_next_picom_char(&b);
          sl_draw_kbd(x);
          break;
        case 24:  //aktuelles Verzeichnis
          n = 0;
          do {
            x = get_next_picom_char(&b);
            buf[n++] = x;
          } while (x !=0);
          sl_draw_dir(buf);
          break;
        case 25:  //Zeit
          t = get_next_picom_char(&b);
          t |= get_next_picom_char(&b) << 8;
          t |= get_next_picom_char(&b) << 16;
          t |= get_next_picom_char(&b) << 24;
          sl_draw_time(t);
          break;  
        case 26:  //Printdatei
          n = 0;
          do {
            x = get_next_picom_char(&b);
            buf[n++] = x;
          } while (x !=0);
          sl_draw_prn(buf);
          break;         

        case 101:
          x = get_next_picom_char(&b);
          sl_draw_scancode(x);
          break;

        //Grafik-Ausgaben ----------------------------------   
        case 121:  //Set Cursor
          x = get_next_picom_char(&b) | (get_next_picom_char(&b) << 8);
          y = get_next_picom_char(&b) | (get_next_picom_char(&b) << 8);
          setCursor(x,y);
          break;
        case 122:  //Writestring bis 0x00
          for (int i=0; i<sizeof(buf); i++) {  
            c = get_next_picom_char(&b);
            buf[i] = c;
            if (c==0) break;
          }
          writeString(buf);
          break;
        case 123:  //Textfarbe
          c = get_next_picom_char(&b);
          setTextColor(c);
          break;
        case 124:  //Gefülltes Rechteck 
          x = get_next_picom_char(&b) | (get_next_picom_char(&b) << 8);
          y = get_next_picom_char(&b) | (get_next_picom_char(&b) << 8);
          w = get_next_picom_char(&b) | (get_next_picom_char(&b) << 8);
          h = get_next_picom_char(&b) | (get_next_picom_char(&b) << 8);
          color = get_next_picom_char(&b);
          fillRect(x, y, w, h, color) ;
          break;
      }
    }   
  }
}


//Polling des /BWS-Triggers in Core0
//Core0 bekommt keine anderen Aufgaben !!!
void __time_critical_func(vdusel_loop)() {  
  uint32_t ax, cx;
  while(true) {      
//  gpio_put(DEBUG_PIN1, 0);    //Debug-Marke
//  gpio_put(DEBUG_PIN1, 1); 

    if (gpio_get(BWS_TRIG) == BWS_TRIG_ACTIVE) {  // Triggersignal aktiv
      gpio_put(DEBUG_PIN1, 0);
      //Adress-Daten wurden am Ende des vorherg. Zyklus durchgemuxt
      ax = gpio_get_all();                //Adressbus lesen
      gpio_put(MUX_ADRS, 0);              //Adr-Mux aus

      gpio_put(MUX_DATS, 1);              //Daten-Mux ein
      gpio_put(DEBUG_PIN1, 1);       
      //Durchschaltverzögerung der 03-Muxer kompensieren
      __asm volatile ("nop\n");           
      __asm volatile ("nop\n");
      __asm volatile ("nop\n");
//    __asm volatile ("nop\n");   //ggf zusätzliche Verzögerung
//    __asm volatile ("nop\n");
      gpio_put(DEBUG_PIN1, 0);
      cx = gpio_get_all();        //Datenbus lesen
        
//    gpio_put(DEBUG_PIN1, 1);    //Debug-Marke
//    gpio_put(DEBUG_PIN1, 0);
      gpio_put(MUX_DATS, 0);
        
      //ax = ~ax;   //Adressbus bitweise negieren, nicht erf. wg. 03er
      ax &= 0x07FF;

      cx = ~cx;  //Datenbus bitweise negieren, wg. 74xx03    
      cx &= 0x00FF;
      
      //Zeichen in BWS-Puffer schreiben
      bws_buffer[ax & (BWS_SIZE-1)] = 0x8000 | cx;

      gpio_put(MUX_ADRS, 1);  //Adress-Mux für nächsten Zyklus durchschalten
      gpio_put(DEBUG_PIN1, 1); 
  
      //Warten bis VDUSEL inaktiv wird
      while (gpio_get(BWS_TRIG) == BWS_TRIG_ACTIVE) {} ;
    }  
  }   //while
}

// ---------------------------------------------------------------------------

int main() {

  gpio_init(DEBUG_PIN1);
  gpio_set_dir(DEBUG_PIN1, GPIO_OUT);
  gpio_put(DEBUG_PIN1, 1);

  // Initialize stdio
  stdio_init_all();

  // Initialize the VGA screen
  initVGA() ;

  picom_slave_init();

  //Auslagerng in Core1
  //Endlosschleife - Durchsuchen des BWS nach gesetzen Flag und ggf pixelweise Übernahme in VGA-Puffer
  multicore_launch_core1(run_core1);

  setTextColor(7);
  setTextSize(1);
  
  sl_init();

  vdusel_loop();  //infinity loop in RAM

}   
