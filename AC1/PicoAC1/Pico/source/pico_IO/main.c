#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"

#include "pico/multicore.h"
#include "hardware/clocks.h"
#include "hardware/pio.h"
#include "time.h"

#include "bsp/board.h"
#include "tusb.h"
#include "sd_card.h"

#include "hardware/rtc.h"
#include "pico/util/datetime.h"

#include "ac1_interface.h"
#include "ac1_zcom.h"
#include "ac1_rtc.h"
#include "ac1_picom.h" 
#include "ac1_config.h"
#include "ac1_printfile.h"
#include "ac1_sdcard.h"

#include "zcom.pio.h" //automatisch im build-Verz. generiert

#define PIO_PIN_BASE Z80_PIO_DATA


uint64_t clk_ts = 0; //Timestamp des letzten CLK-Flankenwechsels (f.Timeout)


// Prototypes
void ac1_reset();

extern uint8_t ac1_get_kbd_char();
extern bool get_kbd_status(hid_keyboard_led_bm_t status_bit);


void run_core1() {

  //Auswahl PIO-Block
  PIO pio = pio1;
  //SM 0 - Eingabekanal
  uint offset = pio_add_program(pio, &clocked_input_program);
  uint sm_in = pio_claim_unused_sm(pio, true);

  //SM 1 - Ausgabekanal
  uint offset_out = pio_add_program(pio, &clocked_output_program);
  uint sm_out = pio_claim_unused_sm(pio, true);


  //Zustimmung den Core1 durch Core0 blockieren zu lassen (f.Flash-Operationen)
  //multicore_lockout_victim_init();

  fc_zcom_initial();
//  sd_card_check();

  uint64_t sd_check_time = 0;
  uint8_t clk = 0;

  while (true) {

    //zyklischer Test, ob eine SD-Karte gesteckt ist
    //gef. Reinitialisierung der SD-Karte    
    if ((fc_com == 0) && (!is_printfile()) && ((time_us_64() - sd_check_time) > 3* 1000 * 1000) || (sd_check_time == 0) && (!sd_blocked)) {
      sd_card_check();
      sd_check_time = time_us_64();
//      cfg_set_pathname(cfg_get_pathname()); //Path-Anzeige zyklisch aktualisieren, ggf. "no SD-Card" erkennen
    }


    if (clk != gpio_get(Z80_PIO_CLK)) {
      clk = gpio_get(Z80_PIO_CLK);
      clk_ts = time_us_64();
    }    
    //ZCOM Timeout 1000ms
    if ((time_us_64() > clk_ts + 1000*1000) && (!is_printfile())) {  
      clk_ts = time_us_64();
      pio_sm_set_enabled(pio, sm_in, false);
      pio_sm_set_enabled(pio, sm_out, false);
      clocked_input_program_init(pio, sm_in, offset, PIO_PIN_BASE);
      pio_sm_set_enabled(pio, sm_in, true);
      fc_zcom_initial();
    }


    //32-Bit Masterkennung auswerten -> 0xC3 0x25 0xA7 0x56
    if ((fc_com < 200) && (pio_sm_get_rx_fifo_level(pio, sm_in) > 0)) {
      uint8_t x = pio_sm_get(pio, sm_in) >> 24;    

      switch (fc_com) {
        case 0: 
          if (x == 0xC3) { 
            fc_com++;
          } else {
            // in Status 0 Zeichen an Printfile, wenn initialisiert
            if (is_printfile()) print_to_file(x);
          }
          break;
        case 1: if (x == 0x25) fc_com++; else fc_com = 0; break;
        case 2: if (x == 0xA7) fc_com++; else fc_com = 0; break;
        case 3: if (x == 0x56) fc_com++; else fc_com = 0; break;
        case 4: 
          resp_ready = false;
          start_zcom_op(x);
          break;
        default:  // < 200 - alle Zeichen an FlowControl durchreichen 
          char_from_zcom(x);
          break;
      }
    }

    //Richtungsumschaltung, Daten an Z80 senden
    if ((fc_com == 200) && (resp_ready)){
      pio_sm_set_enabled(pio, sm_in, false);
      clocked_output_program_init(pio, sm_out, offset_out, PIO_PIN_BASE);
      pio_sm_set_enabled(pio, sm_out, true);
      fc_com = 211;
    }

    //Daten an Z80 senden
    if ((fc_com >= 210) && (fc_com < 255)) {    
      if (pio_sm_get_tx_fifo_level(pio, sm_out) < 8) {
        uint8_t x = char_to_zcom();
        pio_sm_put(pio, sm_out, x); 
      }
    }

    if (fc_com == 255) { 
        sleep_ms (10);  //warten bis letztes Byte rausgeschoben wurde
        if (pio_sm_get_tx_fifo_level(pio, sm_out) == 0) {
          //Richtungsumschaltung, Daten v. Z80 empfangen
          pio_sm_set_enabled(pio, sm_out, false);
          clocked_input_program_init(pio, sm_in, offset, PIO_PIN_BASE);
          pio_sm_set_enabled(pio, sm_in, true);
          fc_com = 0;
        }
    }
  }
}

//-----------------------------------------------------------------------------
// ***** Core 0 *****
int main(void) {

  stdio_init_all();
  board_init();

  //Debug-Ausgang
  gpio_init(DEBUG_IO);
  gpio_set_dir(DEBUG_IO, GPIO_OUT);
  gpio_put(DEBUG_IO, 0);

  // Tastatur in Grundstellung 0x00
  gpio_init_mask(TD_MASK);
  gpio_set_dir_out_masked(TD_MASK);
  gpio_put_masked(TD_MASK, 0);

  //Z80 - Systemtakt an GPIO21
  clock_gpio_init(Z80_CLK_OUT, CLOCKS_CLK_GPOUT1_CTRL_AUXSRC_VALUE_CLK_USB, Z80_CLK_DIV_2MHZ);

  //Z80 - EProm-Block 0 adressieren
  gpio_init(EPROM_A12);
  gpio_set_dir(EPROM_A12, GPIO_OUT);
  gpio_put(EPROM_A12, 0); 
  gpio_init(EPROM_A13);
  gpio_set_dir(EPROM_A13, GPIO_OUT);
  gpio_put(EPROM_A13, 0); 

  //Initialisierung Reset-Pins
  gpio_init(Z80_RESET);
  gpio_set_dir(Z80_RESET, GPIO_OUT);
  gpio_put(Z80_RESET, 0); //Systemreset L-activieren
  gpio_init(Z80_RESET_INV);
  gpio_set_dir(Z80_RESET_INV, GPIO_OUT);
  gpio_put(Z80_RESET_INV, 1); //SpecialReset H-active

  //Echtzeituhr
  datetime_t dtx;
  rtc_init();
  DS3231_init();
  if (ds3231_read_datetime(&dtx))
    rtc_set_datetime(&dtx);
  else
    rtc_set_datetime(&dt_def);     

  // init host stack on configured roothub port
  tuh_init(BOARD_TUH_RHPORT);

  picom_master_init();

  uint64_t kbd_ts = time_us_64();

  //ZCOM in Core 1
  multicore_launch_core1(run_core1);

  sleep_ms(100);
  cfg_init();
  //aktuelle Zeit f. Statuszeile
  time_t utc;
  time(&utc);
  picom_write_command(25, (uint8_t*)&utc, 4);
  
  //cfg_set_colors_again();
  sd_set_pathname("/");

  sleep_ms(100);
  ac1_reset();    //Resetpins freigeben
  sleep_ms(100);

  uint32_t keyup_timer = 0;

  while (1)  {
    if ((time_us_64() - kbd_ts) > 10*1000) {
      kbd_ts = time_us_64();
      tuh_task();   // tinyusb host task
    }
 
    uint8_t ckbd = ac1_get_kbd_char(); 
    if (ckbd != 0x80) {
      uint32_t x = 0; //Grundstellung, alle Tasten freigegeben
      if (ckbd != 0xFF) x = (ckbd | 0x80); 
      gpio_put_masked(TD_MASK, x);
      keyup_timer = 0;
    }
    if ((keyup_timer++ > 3) && (get_kbd_status(KEYBOARD_LED_SCROLLLOCK)!=0)) {
      gpio_put_masked(TD_MASK, 0);
      keyup_timer = 0;
    }

    //Zeit zur vollen Minute -> Statuszeile
    time(&utc);
    if (utc % 60 == 0) picom_write_command(25, (uint8_t*)&utc, 4);

    // prüfen, ob Einstellungen geändert wurden
    // speichern in ".config"
    // per picom an picoVDU senden
    cfg_check();

    sleep_ms(10);
  }
  return 0;
}


//--------------------------------------------------------------------+
// TinyUSB Callbacks (weak)
//--------------------------------------------------------------------+
/*
void tuh_mount_cb(uint8_t dev_addr)
{
  // application set-up
  //printf("A device with address %d is mounted\r\n", dev_addr);
  //gpio_put(25,1);
}

void tuh_umount_cb(uint8_t dev_addr)
{
  // application tear-down
  //printf("A device with address %d is unmounted \r\n", dev_addr);
  //gpio_put(25,0);
}
*/

//weak linked in ac1_usb_kbd.c
//Z80-Systemreset, nach pico-Start und Tastenkombination CRTL+ALT+DEL
//min 3 Taktzustände der CPU
void ac1_reset() {
  gpio_put(Z80_RESET, 0);
  gpio_put(Z80_RESET_INV, 1);
  sleep_us(100);
  gpio_put(Z80_RESET, 1);
  gpio_put(Z80_RESET_INV, 0);
  fc_zcom_initial();
}

