/*
 * Based on pico-examples
 *
 */

#include "pico/stdlib.h"
#include "bsp/board.h"
#include "tusb.h"

#include "ac1_interface.h"
#include "ac1_usb_scan_to_ascii.h"
#include "ac1_picom.h"
#include "ac1_config.h"
#include "ac1_printfile.h"
#include "ac1_sdcard.h"


#define MAX_REPORT  4

//static uint8_t const keycode2ascii[USB_KEY_CNT][4] =  { USB_CODE_TO_AC1 };

// Each HID instance can has multiple reports
static struct
{
  uint8_t report_count;
  tuh_hid_report_info_t report_info[MAX_REPORT];
} hid_info[CFG_TUH_HID];

uint8_t kbd_dev_addr = 0xFF;
uint8_t kbd_instance = 0xFF;

uint8_t leds = 0;

#define KBD_BUF_LEN 64
uint8_t kbd_buf[KBD_BUF_LEN];
uint32_t ix_kbd_in = 0;
uint32_t ix_kbd_out = 0;
clock_t ti_last_release = 0;
clock_t ti_last_pressed = 0;

//Entprellen der Locktasten
uint64_t cl_debounce = 0;
uint64_t nl_debounce = 0;
uint64_t sl_debounce = 0;

const uint32_t tidebounce = 100*1000;


//Prototypen
static void process_kbd_report(hid_keyboard_report_t const *report);
//static void process_mouse_report(hid_mouse_report_t const * report);
//static void process_generic_report(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len);

void set_kbd_status(hid_keyboard_led_bm_t status_bit, bool status);
bool get_kbd_status(hid_keyboard_led_bm_t status_bit); 

//Abfrage des KBD-Buffers durch main
//nächstes Zeichen frühestens 50ms nach letzter Freigabe
// Zeichenrückgabe -> ASCII, Bit 7 = 0
// kein Zeichen -> 0x80
uint8_t ac1_get_kbd_char() {
    uint8_t c = 0x80;  
    if ((ix_kbd_in > ix_kbd_out)  && 
        ((time_us_64() > (ti_last_release + 50*1000))) &&   //min Pause nach Freigabe
        ((time_us_64() > (ti_last_pressed + 50*1000))))     //min Zeit Tastendruck
    {
      c = kbd_buf[ix_kbd_out & (KBD_BUF_LEN - 1)];
      ix_kbd_out++;
      if (c == 0xFF) 
        ti_last_release = time_us_64();
      else
        ti_last_pressed = time_us_64();  
    }
    
    return c;
}

//wird durch Hauptprogramm überschrieben - Platzhalter
TU_ATTR_WEAK void ac1_reset() {
  //  printf ("Reset AC1\n");
}

//--------------------------------------------------------------------+
// TinyUSB Callbacks
//--------------------------------------------------------------------+

// Invoked when device with hid interface is mounted
// Report descriptor is also available for use. tuh_hid_parse_report_descriptor()
// can be used to parse common/simple enough descriptor.
// Note: if report descriptor length > CFG_TUH_ENUMERATION_BUFSIZE, it will be skipped
// therefore report_desc = NULL, desc_len = 0
void tuh_hid_mount_cb(uint8_t dev_addr, uint8_t instance, uint8_t const* desc_report, uint16_t desc_len)
{
  kbd_dev_addr = dev_addr;
  kbd_instance = instance;

  gpio_put(ONBOARD_LED, 1);

  printf("HID device address = %d, instance = %d is mounted\r\n", dev_addr, instance);

  // Interface protocol (hid_interface_protocol_enum_t)
  const char* protocol_str[] = { "None", "Keyboard", "Mouse" };
  uint8_t const itf_protocol = tuh_hid_interface_protocol(dev_addr, instance);

  printf("HID Interface Protocol = %s\r\n", protocol_str[itf_protocol]);

  // By default host stack will use activate boot protocol on supported interface.
  // Therefore for this simple example, we only need to parse generic report descriptor (with built-in parser)
  if ( itf_protocol == HID_ITF_PROTOCOL_NONE )
  {
    hid_info[instance].report_count = tuh_hid_parse_report_descriptor(hid_info[instance].report_info, MAX_REPORT, desc_report, desc_len);
    printf("HID has %u reports \r\n", hid_info[instance].report_count);
  }

  // request to receive report
  // tuh_hid_report_received_cb() will be invoked when report is available
  if ( !tuh_hid_receive_report(dev_addr, instance) )
  {
    printf("Error: cannot request to receive report\r\n");
  }

  leds = cfg_get_kbd();
  set_kbd_status(KEYBOARD_LED_NUMLOCK, leds & KEYBOARD_LED_NUMLOCK);
  set_kbd_status(KEYBOARD_LED_CAPSLOCK, leds & KEYBOARD_LED_CAPSLOCK);
  set_kbd_status(KEYBOARD_LED_SCROLLLOCK, leds & KEYBOARD_LED_SCROLLLOCK);

  uint8_t buf[USB_KEY_CNT * 4];
  uint8_t res = load_scancode(buf);
  if (res == 0) memcpy (usb_scan_codes, buf, USB_KEY_CNT * 4);
}

// Invoked when device with hid interface is un-mounted
void tuh_hid_umount_cb(uint8_t dev_addr, uint8_t instance)
{
  kbd_dev_addr = 0xFF;
  kbd_instance = 0xFF;
  
  gpio_put(ONBOARD_LED, 0);

  printf("HID device address = %d, instance = %d is unmounted\r\n", dev_addr, instance);
}

// Invoked when received report from device via interrupt endpoint
void tuh_hid_report_received_cb(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len)
{
  uint8_t const itf_protocol = tuh_hid_interface_protocol(dev_addr, instance);

  switch (itf_protocol)
  {
    case HID_ITF_PROTOCOL_KEYBOARD:
      TU_LOG2("HID receive boot keyboard report\r\n");
      process_kbd_report( (hid_keyboard_report_t const*) report );
    break;

    case HID_ITF_PROTOCOL_MOUSE:
      TU_LOG2("HID receive boot mouse report\r\n");
 //     process_mouse_report( (hid_mouse_report_t const*) report );
    break;

    default:
      // Generic report requires matching ReportID and contents with previous parsed report info
 //     process_generic_report(dev_addr, instance, report, len);
    break;
  }

  // continue to request to receive report
  if ( !tuh_hid_receive_report(dev_addr, instance) )
  {
    printf("Error: cannot request to receive report\r\n");
  }
}

//--------------------------------------------------------------------+
// Keyboard
//--------------------------------------------------------------------+

// look up new key in previous keys
static inline bool find_key_in_report(hid_keyboard_report_t const *report, uint8_t keycode) {
  for(uint8_t i=0; i<6; i++)
      if (report->keycode[i] == keycode)  return true;
    return false;
}


// Ansteuern der 3 KBD-Leds, Status setzen
// KEYBOARD_LED_NUMLOCK /  KEYBOARD_LED_CAPSLOCK / KEYBOARD_LED_SCROLLLOCK
void set_kbd_status(hid_keyboard_led_bm_t status_bit, bool status) {
  leds &= ~status_bit;
  if (status) leds |= status_bit;
  tuh_hid_set_report(kbd_dev_addr, kbd_instance, 0, HID_REPORT_TYPE_OUTPUT, &leds, 1); 
  cfg_set_kbd(leds);  //speichern und in Statuszeile anzeigen 
}

//zentrale Abfrage der Lock-Stati
bool get_kbd_status(hid_keyboard_led_bm_t status_bit) {
  return leds & status_bit;
}


static void process_kbd_report(hid_keyboard_report_t const *report) {
    static hid_keyboard_report_t prev_report = { 0, 0, {0} }; // previous report to check key released
    static uint8_t last_ac1_code;

    uint8_t key_row = 0;
    if (report->modifier & (KEYBOARD_MODIFIER_LEFTSHIFT | KEYBOARD_MODIFIER_RIGHTSHIFT)) key_row |= 0x01;
    if (report->modifier & (KEYBOARD_MODIFIER_LEFTCTRL | KEYBOARD_MODIFIER_RIGHTCTRL)) key_row |= 0x02;
    if (report->modifier & (KEYBOARD_MODIFIER_LEFTALT | KEYBOARD_MODIFIER_RIGHTALT)) key_row |= 0x03;

    uint8_t code = report->keycode[0];


    //Hilfsfunktion f. Kastraturen
    if ((report->modifier == (KEYBOARD_MODIFIER_LEFTCTRL) && (code == HID_KEY_CAPS_LOCK) && time_us_64() > (nl_debounce + tidebounce))) {
        bool scroll_lock = !get_kbd_status(KEYBOARD_LED_SCROLLLOCK);
        set_kbd_status(KEYBOARD_LED_SCROLLLOCK , scroll_lock);
        nl_debounce = time_us_64();
        return;
    }

    //CapsLock toggeln - LED-Anzeige
    if ((code == HID_KEY_CAPS_LOCK) && time_us_64() > (cl_debounce + tidebounce)) {
        bool caps_lock = !get_kbd_status(KEYBOARD_LED_CAPSLOCK);
        set_kbd_status(KEYBOARD_LED_CAPSLOCK , caps_lock);
        cl_debounce = time_us_64();
        return;
    }
    //ScollLock toggeln - LED-Anzeige
    if ((code == HID_KEY_SCROLL_LOCK) && time_us_64() > (sl_debounce + tidebounce)) {
        bool scroll_lock = !get_kbd_status(KEYBOARD_LED_SCROLLLOCK);
        set_kbd_status(KEYBOARD_LED_SCROLLLOCK , scroll_lock);
        sl_debounce = time_us_64();
        return;
    }
    //NumLock toggeln - LED-Anzeige
    if ((code == HID_KEY_NUM_LOCK) && time_us_64() > (nl_debounce + tidebounce)){
        bool num_lock = !get_kbd_status(KEYBOARD_LED_NUMLOCK);
        set_kbd_status(KEYBOARD_LED_NUMLOCK , num_lock);
        nl_debounce = time_us_64();
        return;
    }


    // Affengriff -> Reset Z80
    if ((report->modifier == (KEYBOARD_MODIFIER_LEFTCTRL | KEYBOARD_MODIFIER_LEFTALT )) &&
        ((code == HID_KEY_KEYPAD_DECIMAL) || (code == HID_KEY_DELETE))) {
        ac1_reset();
        return;
    }
    
    //Spezialtasten Alt (links) + xxxx auf PicoEbene
    uint8_t buf[16];
    int x;
    if (report->modifier == KEYBOARD_MODIFIER_LEFTALT) {
      switch (code) {
        case HID_KEY_F5:
          cfg_set_zg(0);
          return;
        case HID_KEY_F6:
          cfg_set_zg(1);
          return;  
        case HID_KEY_F7:
          cfg_set_zg(2);
          return;  
        case HID_KEY_F8:  //frei für CP/M ??
//        cfg_set_zg(3);
          return;  
  
        case HID_KEY_F9:
            cfg_set_clk(0); 
            return;
        case HID_KEY_F10:
            cfg_set_clk(1);  
            return;   
        case HID_KEY_F11:
            cfg_set_clk(2);   
            return; 
        case HID_KEY_F12:
            cfg_set_clk(3);   
            return;          
      }
    } 

    //Zeichengeneratoren SCCH auf AltGr
    if (report->modifier == KEYBOARD_MODIFIER_RIGHTALT) {
      switch (code) {
        case HID_KEY_F5:
          cfg_set_zg(4);
          return;
        case HID_KEY_F6:
          cfg_set_zg(5);
          return;  
        case HID_KEY_F7:
          cfg_set_zg(6);
          return; 
      }
    }

    //Spezialtasten zur EPROM-Umschaltung, doppelter Modifier zur Sicherheit
    if (report->modifier == (KEYBOARD_MODIFIER_LEFTALT | KEYBOARD_MODIFIER_LEFTCTRL) ) {
      switch (code) {
        case HID_KEY_F1: 
          cfg_set_monitor (0); 
          ac1_reset();
          return;
        case HID_KEY_F2:
          cfg_set_monitor (1);
          ac1_reset();
          return;
        case HID_KEY_F3:
          cfg_set_monitor (2);
          ac1_reset();
          return;
        case HID_KEY_F4:
          cfg_set_monitor (3);
          ac1_reset();
          return;   
      }                 
    }

    //Print to File initialisieren bzw abschließen
    if ((report->modifier == (KEYBOARD_MODIFIER_LEFTALT | KEYBOARD_MODIFIER_LEFTCTRL) ) && (code == HID_KEY_P)) {
      set_printfile(!is_printfile()); //Zustand toggeln
      return;
    }

    //speichern der aktuellen Scancodetabelle
    if ((report->modifier == (KEYBOARD_MODIFIER_LEFTGUI | KEYBOARD_MODIFIER_LEFTCTRL)) && (code == 0x2D)) {  //LCtrl+LMenu+'?'
      save_scancode((uint8_t*)usb_scan_codes);
    }

    //Scancode-Test, Anzeige in Statuszeile
    if ((report->modifier == ( KEYBOARD_MODIFIER_LEFTGUI | KEYBOARD_MODIFIER_LEFTSHIFT )) && (code > 0)) {
      picom_write_command(101, &code, 1);
    }

    if (code < USB_KEY_CNT) {
        char ac1_code = usb_scan_codes[code][key_row];
        //CapsLock nur auf Buchstaben anwenden
        if (get_kbd_status(KEYBOARD_LED_CAPSLOCK)) {
          if ((ac1_code >= 'A') && (ac1_code <= 0x5D)) {  //incl SCCH-Umlaute
            ac1_code |= 0x20;
          } else {
            if ((ac1_code >= 'a') && (ac1_code <= 0x7D)) 
              ac1_code &= 0xDF;
          }
        } 

        //Zeichen in Ringpuffer schieben
        if (last_ac1_code != ac1_code) {  

          // !!! z.Zt keine Taste "FE" definiert
          if (ac1_code == 0xFE) { //Tabulator ==> 4 Leerzeichen
            for (int i=0; i<4; i++){
               kbd_buf[ix_kbd_in++ & ((KBD_BUF_LEN-1))] = ' ';  
               kbd_buf[ix_kbd_in++ & ((KBD_BUF_LEN-1))] = 0xFF;   
            }
            ac1_code = 0xFF;
          } else {
            //Codes ohne Spezialbehandlung
            kbd_buf[ix_kbd_in++ & ((KBD_BUF_LEN-1))] = ac1_code;
          }
          last_ac1_code = ac1_code;
        }
    }

    

} 
