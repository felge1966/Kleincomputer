#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "time.h"
#include "hw_config.h"
#include "sd_card.h"
#include "ff.h"
#include "diskio.h"

#include "ac1_interface.h"
#include "ac1_config.h"
#include "ac1_sdcard.h"


bool sd_blocked = false;  //SD-Zugriff aus verschiedenen Kernen verriegeln
bool detected = false; //SD-Kartenstatus

uint8_t file_buf[0x10020]; // Z80 max Speicher + 32 Bytes Header, (Tx)
uint32_t ix_file_buf;

uint8_t nbuf[SZ_NBUF];     //Puffer Zeichenkette v. ZCOM
uint8_t fname[SZ_NBUF];
uint8_t ixbuf;
static char pathname[SZ_NBUF];

uint16_t arg1, arg2, arg3; // AC1 - Argumente
uint8_t ftype;             //Filetyp Header, Info

bool resp_ready = false;  //Response bereit zu Übertragung

// --------------------------------------------------------------------------------


uint8_t load_file(uint8_t *fn, uint32_t *plen) {
  FRESULT fr;
  FATFS fs;
  FIL fil;
  int res = 0;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;
  if (detected) {    
    sd_card_t *pSD = sd_get_by_num(0);          
    fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
    if (fr == FR_OK) {
      fr = f_chdir(sd_get_pathname());
      if (fr == FR_OK) {    
        fr = f_open(&fil, fname, FA_READ); // Open file for reading 
        if (fr == FR_OK) {
          f_read(&fil, file_buf, 0xffff, (UINT*)plen);
          //Formatprüfung - magic Bytes, s. Formatbeschreibung
          if ((file_buf[13] != 0xd3) || (file_buf[14] != 0xd3) || (file_buf[15] != 0xd3)) res = 7;
          if (&plen == 0) res = 6; 
          f_close(&fil);
          f_unmount(pSD->pcName);
        } else res = 3;   //Error Open File
      } else res = 14;    //Error ChDir
    } else res = 2;       //Error Mount SD-Card
  } else res = 1;         //Error No SD-Card detected    
  sd_blocked = false;
  return res;
}

// Search a directory for objects and display it  http://elm-chan.org/fsw/ff/doc/findfirst.html
// typ: 0 - Liste alle Einträge
// typ: 1 - nur Dateien
// typ: 2 - nur Verzeichnisse
int find_file (uint8_t *fnx, uint8_t typ) {
  int res = 0;
  FRESULT fr;     // Return value
  DIR dj;         // Directory object
  FILINFO fno;    // File information 
  uint32_t ix = 0;
 
  while(sd_blocked) {  sleep_ms(10); }

  sd_blocked = true;  
  file_buf[0] = 0x00;
  bzero(file_buf, sizeof(file_buf));
  int n = 1;
  if (detected) {
    sd_card_t *pSD = sd_get_by_num(0);          
    fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
    if (fr == FR_OK) {
      //Directories immer auf Root-Ebene anzeigen, Dateien im aktuellen Verzeichnis
      if (typ != 2) fr = f_chdir(sd_get_pathname());
      if (fr == FR_OK) {
        fr = f_findfirst(&dj, &fno, "", fnx); 

        while (fr == FR_OK && fno.fname[0]) {         // Repeat while an item is found
          if (((typ == 0) ||                                          //Dateien und Verzeichniss
              ((typ == 1) && ((fno.fattrib & AM_DIR) != AM_DIR)) ||   //Dateien
              ((typ == 2) && ((fno.fattrib & AM_DIR) == AM_DIR))) &&  //Verzeichnisse
              (fno.fname[0] != '.') &&
              (strcmp(fno.fname, "System Volume Information") != 0 )) { //keine versteckten Dateien/Verzeichnisse listen ) {
            ix = strlen(file_buf);
            //Active Path markieren, case insensitive
            char c = ' ';
            if (((fno.fattrib & AM_DIR) == AM_DIR) && (strcasecmp(sd_get_pathname(), fno.fname) == 0)) c = '*';

            sprintf(&file_buf[ix], "%.2d:%c%s ", n++, c, fno.fname);    // Print the object name
            ix += strlen(fno.fname)+4;
            while (ix % 21 != 0) {
              file_buf[ix++] = ' ';
              if(ix % 63 == 0) {
                file_buf[--ix] = 0x0d;
                ix++;
                break;
              } 
              file_buf[ix] = 0x00;
            }
          }
          fr = f_findnext(&dj, &fno);                 // Search for next item 
        }
        if (ix % 63 != 0){  //Cursor immer am Zeilenanf. der nächsten Zeile
          file_buf[ix++] = 0x0d;  //ggf CR einfügen
          file_buf[ix] = 0x00;
        }

        f_closedir(&dj);
        f_unmount(pSD->pcName);
      } else res = 14;  //Dir nicht gefunden
    }
  } else res = 1; //No SD-Card
  resp_ready = true;
  sd_blocked = false;
gpio_put(DEBUG_IO, 0); 
  return res;
}


//Datei auf SD-Karte speichern
//Dateiname in fname
uint8_t save_file(uint8_t *fbuf, uint8_t *fn, uint32_t flen, bool save_hdr) {
  int res = 0;
  FRESULT fr;
  FATFS fs;
  FIL fil;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;

  if (detected) {
    sd_card_t *pSD = sd_get_by_num(0);          
    fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
    if (fr == FR_OK) {  
      fr = f_chdir(sd_get_pathname());
      if (fr == FR_OK) {
        //Test ob File bereits existiert
        fr = f_open(&fil, fn, FA_READ);
        if (fr == FR_OK) {
          f_close(&fil);
          char buf[48];
          //akt Zeitstempel
          time_t utc; 
          time(&utc);
          //Datum / Zeit in UTC
          struct tm ti = *gmtime(&utc);

          //Umbenennen und in AC1BIN verschieben
          //Datei wird mit aktueller Schreibweise gespeichert (Groß-/Kleinbuchstaben)
          sprintf(buf, "/%s/%s.%.02d%.02d%.02d%.02d%.02d%.02d", 
                        AC1BIN_NAME, fname,
                        ti.tm_year-100, ti.tm_mon+1, ti.tm_mday, ti.tm_hour, ti.tm_min, ti.tm_sec);
          fr = f_rename(fn, buf);  
        }
        fr = f_open(&fil, fn, FA_WRITE | FA_CREATE_ALWAYS); // Open file for writing 
        if (fr == FR_OK) {
          //Headerzeile auf SD_Card schreiben arg1, arg2, arg3, nbuf[26] = 32 Zeichen 
          //Werte aus globalen Var holen, (ist so nicht sauber !!!)
          UINT m, n;
          if (save_hdr) {
            f_write(&fil, &arg1, 2, &m);
            f_write(&fil, &arg2, 2, &n); m +=n; 
            f_write(&fil, &arg3, 2, &n); m +=n;
            for (int i=0; i<26; i++)  //nbuf mit Spaces auffüllen
              if (nbuf[i] == 0) nbuf[i] = ' ';
            f_write(&fil, nbuf, 26, &n); m +=n;
          } else m = 32;

          if (m == 32) {
            //DateiInhalt speichern
            f_write(&fil, fbuf, flen, &n); m += n;
            if (n!= flen) res = 5;       //Fehler beim Daten schreiben
            f_close(&fil);
            f_unmount(pSD->pcName);
          } else res = 4;             //Fehler - Header schreiben
        } else res = 3;               //Fehler - Öffnen der Datei
      } else res = 14;                //Fehler - ChDir           
    } else res = 2;                   //Fehler - mounten der SD-Card
  } else res = 1;                     //Fehler - keine Karte erkannt
  sd_blocked = false;
  return res;    
} 

//Prüfen, ob Verzeichnis vorhanden
//wenn nicht -> versuchen anzulegen
int change_dir(char *pn, bool force) {
  int res = 0;
  FRESULT fr;
  FATFS fs;
  FIL fil;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;
  
  if (detected) {
    sd_card_t *pSD = sd_get_by_num(0);          
    fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
    if (fr == FR_OK) {    
      fr = f_chdir (pn);
      if (fr == FR_INVALID_NAME) res = 10;
      if (fr == FR_NO_PATH) { //neu anlegen
        if (force) {
          fr = f_mkdir (pn);
          if (fr == FR_OK) res = 11;  //Ok -> created ...       
          else res = 10;  //konnte nicht angelegt werden 
          //    unzulässiges Zeichen im Dateinamen
          //    Datei mit gleichem Namen bereits vorhanden
        } else {
          res = 15; //no path    
        }
      }
    } else res = 2; //Dateisystem lässt sich nicht mounten
  } else res = 1;   //keine SD-Carte erkannt (Polling)
  sd_blocked = false;
  return res;
}

// ---------------------------------------------------------------------------

//Test, ob SD-Card gesteckt ist
//ggf (Re-)Initialisierung
//ca. 5ms !!!
void sd_card_check() {
  bool res = false;
  FATFS fs;
  sd_card_t *pSD = sd_get_by_num(0);    

  while(sd_blocked) sleep_ms(10); 
  sd_blocked = true;     
  FRESULT fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
  if (fr != RES_OK) {
    sd_deinit_driver();     //Init-Flag rücksetzen
    sd_init_driver();
  } else {
    fr = f_chdir(AC1BIN_NAME);
    if (fr == FR_NO_PATH) {
      f_mkdir(AC1BIN_NAME);
    }
    f_unmount(pSD->pcName);
    res = true;
  }
  detected = res;
  //Anzeige in Statuszeile
  if (res) cfg_set_pathname(pathname);
  else cfg_set_pathname("** no SD-Card **");
  sd_blocked = false;
}

bool is_sd_card_detected() {
  return detected;
}

// --------------------------------------------------------------------------------

uint8_t load_cfg(cfg_data_t* cfg_data) {
  FRESULT fr;
  FATFS fs;
  FIL fil;
  int res = 0;
  UINT len;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;

  sd_card_t *pSD = sd_get_by_num(0);          
  fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
  if (fr == FR_OK) {    
    fr = f_open(&fil, FN_CONFIG, FA_READ); // Open file for reading 
    if (fr == FR_OK) {
      f_read(&fil, cfg_data, sizeof(cfg_data_t), &len);
      if (len != sizeof(cfg_data_t)) res = 3; 
      f_close(&fil);
      f_unmount(pSD->pcName);
    } else res = 2;   //Error Open File
  } else res = 1;     //Error Mount SD-Card
  sd_blocked = false;
  return res;
}


uint8_t save_cfg(cfg_data_t cfg_data) {
  int res = 0;
  FRESULT fr;
  FATFS fs;
  FIL fil;
  UINT n;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;

  sd_card_t *pSD = sd_get_by_num(0);          
  fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
  if (fr == FR_OK) {  
    fr = f_open(&fil, FN_CONFIG, FA_WRITE | FA_CREATE_ALWAYS); // Open file for writing 
    if (fr == FR_OK) {
      //Daten speichern
      f_write(&fil, &cfg_data, sizeof(cfg_data_t), &n); 
      f_close(&fil);
      if (n != sizeof(cfg_data_t)) res = 3;
      f_unmount(pSD->pcName);
    } else res = 2;             //Fehler - Header schreiben
  } else res = 1;               //Fehler - Öffnen der Datei         
  sd_blocked = false; 
  return res;    
}

 //---------------------------------------------------------------------------

 void sd_set_pathname(char *pn) {
  if (!is_sd_card_detected()) {
    sprintf(pathname, "/");
    cfg_set_pathname("** no SD-Card **");
  } else {
    if(strlen(pn) > MAX_FILE_NAME_LEN) pn[MAX_FILE_NAME_LEN] = 0;         //Namen auf 16 Zeichen kürzen
    strcpy(pathname, pn);
    cfg_set_pathname(pathname);
  }
}

//Rückgabe Zeiger auf aktuellen Pahtnamen
char* sd_get_pathname() {
  return pathname;
}
 
// ---------------------------------------------------------------------------------------------

//Laden einer alternativen Scancode-Tabelle
//Root-Verzeichnis ".scan2ascii"
uint8_t load_scancode(uint8_t* pkbs) {
  FRESULT fr;
  FATFS fs;
  FIL fil;
  int res = 0;
  UINT len;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;

  sd_card_t *pSD = sd_get_by_num(0);          
  fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
  if (fr == FR_OK) {    
    fr = f_open(&fil, FN_KEYSCAN, FA_READ); // Open file for reading 
    if (fr == FR_OK) {
      f_read(&fil, pkbs, USB_KEY_CNT*4, &len);
      if (len != USB_KEY_CNT*4) res = 3; 
      f_close(&fil);
      f_unmount(pSD->pcName);
    } else res = 2;   //Error Open File
  } else res = 1;     //Error Mount SD-Card
  sd_blocked = false;
  return res;
}

//Speichern der aktuell verwendeten ScanCodeToAscii-Tabelle, als Backup zur weiteren Bearbeitung
uint8_t save_scancode(uint8_t *pkbs) {
  int res = 0;
  FRESULT fr;
  FATFS fs;
  FIL fil;
  UINT n;

  while(sd_blocked) sleep_ms(10);
  sd_blocked = true;

  sd_card_t *pSD = sd_get_by_num(0);          
  fr = f_mount(&pSD->fatfs, pSD->pcName, 1);
  if (fr == FR_OK) {  
    fr = f_open(&fil, FN_KEYSCAN_BK, FA_WRITE | FA_CREATE_ALWAYS); // Open file for writing 
    if (fr == FR_OK) {
      //Daten speichern
      f_write(&fil, pkbs, USB_KEY_CNT * 4, &n); 
      f_close(&fil);
      if (n != USB_KEY_CNT * 4) res = 3;
      f_unmount(pSD->pcName);
    } else res = 2;             //Fehler - Header schreiben
  } else res = 1;               //Fehler - Öffnen der Datei         
  sd_blocked = false; 
  return res; 
}

