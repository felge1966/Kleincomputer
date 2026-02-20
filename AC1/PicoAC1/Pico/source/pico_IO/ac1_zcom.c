
//#include "sd_card.h"
#include "ff.h"
//#include "diskio.h"
//#include "hw_config.h"
#include "pico/util/datetime.h"
#include "hardware/rtc.h"
#include "time.h"

#include "ac1_zcom.h"
#include "ac1_rtc.h"
#include "ac1_interface.h"
#include "ac1_picom.h"
#include "ac1_config.h"
#include "ac1_help.h"
#include "ac1_printfile.h"
#include "ac1_printfile.h"
#include "ac1_sdcard.h"
#include "ac1_miba.h"


//Antworttyp
enum response_t {   //Informationen zurückliefern
  RP_TEXT = 1,      //Text
  RP_DATA = 2,      //Datei
  RP_CODE = 3       //Fehlercode
};
enum response_t response;

uint8_t csum = 0, csumx;

uint32_t len;
uint32_t ret_code;         //Return-Code 1..4 Bytes  
uint8_t csum_ext;
uint8_t cnt_code;


uint8_t fc_com;           // Flowcontrol ZCOM




// -------------------------------------------------------------------------------

//Antwort auf ZCOM-Schnittstelle bereitstellen
static void response_message(uint8_t n) {
  switch (n) {
    case 0: sprintf(file_buf, " Ok-> %s\r", fname); break;
    case 1: sprintf(file_buf, " Error: no SD-Card detected\r"); break;
    case 2: sprintf(file_buf, " Error: mount SD-Card\r"); break;
    case 3: sprintf(file_buf, " Error: open file-> %s\r", fname); break;
    case 4: sprintf(file_buf, " Error: write header\r"); break;
    case 5: sprintf(file_buf, " Error: write data\r"); break;
    case 6: sprintf(file_buf, " Error: read data\r"); break;
    case 7: sprintf(file_buf, " Error: no AC1 format\r"); break;

    case 10: sprintf(file_buf, " Error: pathname\r"); break;
    case 11: sprintf(file_buf, " Ok-> created path: %s\r", fname); break;
    case 14: sprintf(file_buf, " Error: change path: %s\r", sd_get_pathname()); break;
    case 15: sprintf(file_buf, " Error: no path %s\r", fname); break;
    case 16: sprintf(file_buf, " Error: path already exists\r" ); break;

    case 101: sprintf(file_buf, " Error: CSum Header\r"); break;
    case 102: sprintf(file_buf, " Error: CSum Data\r"); break;
    case 103: sprintf(file_buf, " Error: Data oversize\r"); break;

    case 120: sprintf(file_buf, " No printfile opened\r"); break;
    case 121: sprintf(file_buf, " No content"); break;

    default: sprintf(file_buf, " Error: Unknown\r"); break;
  }
  response = RP_TEXT;
  resp_ready = true;
}


// -------------------------------------------------------------------------------

//picoIO-seitige Grundstellung ZCOM
void fc_zcom_initial() { 
  fc_com = 0;
  bzero(nbuf, sizeof(nbuf));
  ixbuf = 0;
  file_buf[0] = 0;  //alten String löschen
  ix_file_buf = 0;
}


//Zeichen nach Kennbuchstaben empfangen
uint8_t char_from_zcom(uint8_t x) {
  uint8_t res = 0;
  csum += x; // Prüfsumme durch ÜberlaufAddition
  
  switch (fc_com) {  

    // Save File to SD ---------------------------------------------------------
    case 10: arg1 = x; fc_com++; break; // Argumente 1-3
    case 11: arg1 |= x << 8; fc_com++; break;
    case 12: arg2 = x; fc_com++; break;
    case 13: arg2 |= x << 8; fc_com++; break;
    case 14: arg3 = x; fc_com++; break;
    case 15: arg3 |= x << 8; fc_com++; len = (arg2 - arg1) + 1; ixbuf = 0; break;
    case 16: // Header puffern - ID, Typ, Magic Byte, Dateiname
      if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
      if (x == 0){  // Ende-Kz Name + Fileinfo   
        nbuf[42] = 0; //String ZwangsEnde, max Namenlänge 16 Zeichen  
        char *pc = strchr(&nbuf[10], '/');    //Trenner FileName / FileInfo
        if (pc) {
          char finfo[SZ_NBUF];
          *pc = 0;          //Abschluss Dateiname
          pc +=1;
          sprintf(fname, "%s", &nbuf[10]);
          sprintf(finfo, "%s", pc);   //Info puffern
          bzero(&nbuf[10],16);
          sprintf(&nbuf[10], "%s", finfo);
        } else {          //keine Fileinfo, stattdessen Dateiname als Info
          sprintf(fname, "%s", &nbuf[10]);
        } 
        fname[16] = 0;  //Zwangsbegrenzung
        fc_com++;
        csumx = csum;
      }
      break;
    case 17: // Header-Prüfsumme
      if (csumx == x) {
        csum = 0;
        fc_com++;
      }
      else {
        response_message(101); //Error CSum Header
        len += len/256; //verlängert um Blockprüfsummen
        fc_com = 199; //weitere Zeichen laufen ins Leere
      }
      break;
    case 18: // Datei
      file_buf[ix_file_buf++] = x;
      if (((ix_file_buf % 256) == 0) || (len == ix_file_buf)) { // nächstes Byte Blockprüfsumme
        fc_com++;
        csumx = csum;
      }
      break;
    case 19: // Blockprüfsumme
      if (csumx != x) {
        response_message(102);  //Error CSum Data
        len -= ix_file_buf;
        len += len/256; 
        fc_com = 199;
      } else {
        if (len == ix_file_buf) {   // Dateiende
 //         uint64_t tx = time_us_64();        
          res = save_file(file_buf, fname, len, true);    //incl Header  
 //         uint64_t ty = time_us_64() - tx;

          if (res == 0) {
  //          sprintf(file_buf, " Ok -> %s (SD: %.1fms)", fname, ty/1000.0);
            sprintf(file_buf, " Ok -> %s", fname);
            response = RP_TEXT;
            resp_ready = true; 
            fc_com = 200;
          } else {
            response_message(res);
            fc_com = 200;     //Ausgabe Fehlermeldung
          }

        } else {
          fc_com--; // nächster Block
          csum = 0;
        }
      }
      break;
    // ------------------------------------------------------------------
    
    //Datei von SD-Card lesen
    case 30: // Dateinamen puffern   
      if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
      if (x == 0){
        sprintf(fname, "%s", nbuf);
        fc_com++;
        csumx = csum;
      }
      break;
    case 31: // Header-Prüfsumme
      if (csumx == x) {
        csum = 0;
        if (strchr(fname, '*')) { //Wildcard '*' im Dateinamen
          res = find_file(fname, 1);       //nur Dateinamen, file_buf mit Liste füllen        
          if (res != FR_OK) response_message(res);
          response = RP_TEXT;
          fc_com = 200; 
        } else {
          res = load_file(fname, &len); //File lesen
          if (res == 0) {               //laden Ok
            response = RP_DATA;
            resp_ready = true;
            fc_com = 200;     
          } else {
            response_message(res);
            response = RP_TEXT;
            fc_com = 200;     //Ausgabe Fehlermeldung
          }
        }
      } else {                //Error CSum
        response_message(101); //Error CSum Header
        len = 0; //keine weiteren Bytes erwartet
        fc_com = 199;
      }      
      break;
    // --------------------------------------------------------------
    //Directory-Operationen
    case 35:
      if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
      if (x == 0){
        sprintf(fname, "%s", nbuf);
        fc_com++;
        csumx = csum;
      }
      break;
    case 36: 
      if (csumx == x) {         // Header-Prüfsumme
        csum = 0;
        if (strchr(fname, '*')) {     //Wildcard '*' im Dateinamen
          res = find_file(fname, 2);  //nur Dateinamen, file_buf mit Liste füllen
          if (res != 0) response_message(res); //Fehlermeldung
          response = RP_TEXT;
          fc_com = 200;
        } else {                      //Zeichenkette als aktuelles Directory speichern
          res = change_dir(fname, false); //kein neues Verz. erzwingen
          response_message(res);      //laden Ok
          response = RP_TEXT;
          resp_ready = true;
          fc_com = 200;  
          if ((res == 0) || (res == 11))  //gewechselt oder neu angelegt
            sd_set_pathname(fname);   
        }
      } else {                
        response_message(101);  //Error CSum Header
        len = 0;
        fc_com = 199;
      }
      break;
      
    case 37:  //"m" Directory erstellen
      if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
      if (x == 0){
        nbuf[MAX_FILE_NAME_LEN] = 0; //Zwangsbegrenzung
        sprintf(fname, "%s", nbuf);
        fc_com++;
        csumx = csum;
      }
      break;
    case 38:  
      if (csumx == x) {         // Header-Prüfsumme
        csum = 0;
        res = change_dir(fname, true); //neues Verz. erzwingen
        if (res == 0) {
          res = 16;       //path already exists
        } else { 
          if (res == 11)  //gewechselt oder neu angelegt
            //Zeichenkette als aktuelles Directory speichern
            sd_set_pathname(fname);   
        }
        response_message(res);      //laden Ok
        response = RP_TEXT;
        resp_ready = true;
        fc_com = 200; 
      } else {                
        response_message(101);  //Error CSum Header
        len = 0;
        fc_com = 199;
      }
      break;

      // --------------------------------------------------------------
      //Zeitoperationen
      case 40:
        if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
        if (x == 0){
          sprintf(fname, "%s", nbuf);
          fc_com++;
          csumx = csum;
        }
        break;

      case 41:
        if (csumx == x) {
          datetime_t dt;
//          setenv("TZ", "CET-1CEST,M3.5.0/2,M10.5.0/3", 1);
//          tzset();
          int len = strlen(nbuf);
          if (len < 2) {
            struct tm ti; 

            time_t utc; // = mktime(&timeinfo);
            time(&utc);
  /*
            ti = *localtime (&utc);
            //?? localtime gibt UTC als lokale Zeit zurück ???
            //isdst wird aber korrekt gesetzt
            //!!! Zeitumstellung DST erfolgt mit einer Stunde Versatz !!!
            ti.tm_hour += 1 + ti.tm_isdst;
*/
            //Datum / Zeit in UTC
            ti = *gmtime(&utc);

            sprintf(file_buf, 
              " UTC: %.04d-%.02d-%.02d*%.02d:%.02d:%.02d\r", //--> TZ:%d | DST:%d\r", 
              ti.tm_year+1900, ti.tm_mon+1, ti.tm_mday, ti.tm_hour, ti.tm_min, ti.tm_sec); //, _timezone, ti.tm_isdst);

          } else  if (len ==  19) { //gültige Zeichenkettenlänge
            dt.year = atoi(&nbuf[0]);
            dt.month = atoi(&nbuf[5]);
            dt.day = atoi(&nbuf[8]);
            dt.dotw = 0;
            dt.hour = atoi(&nbuf[11]);
            dt.min = atoi(&nbuf[14]);
            dt.sec = atoi(&nbuf[17]);
            if (rtc_set_datetime(&dt)) {
              ds3231_write_datetime(&dt);    
              sprintf(file_buf, "Ok\r");
            } else {
              sprintf(file_buf, "Error: Invalid Date/Time\r");
            }
          } else {
            //Zeichenkette kann nicht durch Leerzeichen unterbrochen sein !
            sprintf(file_buf, "Error: Format UTC-Date/Time -> YYYY-MM-DD*hh:mm:ss\r");
          }
          response = RP_TEXT;
          resp_ready = true;
          fc_com = 200;

        } else {
          response_message(101); //Error CSum Header
          len = 0;
          fc_com = 199;
        }
        break;

        // --------------------------------------------------------------------------

        case 45:    //Farbkommando empfangen
          if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
          if (x == 0){
            fc_com++;
          //  csumx = csum;
          }
          break;
        case 46:  //Farbkommando auswerten
          //optionalen Parameter ergänzen
          if (strlen(nbuf) == 3) strcat(nbuf, ":0");
          if((strlen(nbuf) == 5) &&               //vorgeschriebene Länge und Bereich
             (nbuf[0]>='0') && (nbuf[0]<'8')&&
             (nbuf[2]>='0') && (nbuf[2]<'8')&&
             (nbuf[4]>='0') && (nbuf[4]<'8')&&
             (nbuf[1] == ':') &&
             (nbuf[1] == ':')) { 
            uint8_t c[4];
            //Farb-Kommando an picoVDU
            c[0] = nbuf[0] & 7; //Zeichenfarbe 0..7
            c[1] = nbuf[2] & 7; //Hintergrundfarbe 0..7
            c[2] = nbuf[4] & 7; //Rahmenfarbe
            if (c[0] != c[1]) {
              cfg_set_colors(c[0],c[1], c[2]);
              sprintf(file_buf, " Ok\r");
            } else {
              sprintf(file_buf, " Are you kidding me?\r");
            }
          } else {
            sprintf(file_buf, " Colors: 'c X:Y[:Z]' X=Text : Y=Background : Z=Frame [optional]\r 0:Black    | 1:Red     | 2:Green   | 3:Yellow\r 4:Blue     | 5:Magenta | 6: Cyan   | 7:White\r");
          }
          response = RP_TEXT;
          resp_ready = true;
          fc_com = 200;
          break;

        // Hilfeoperationen -------------------------------------------------------
        case 50:
          if (x == 0) fc_com++;
          break;
        case 51: 
          fc_com++;
          break;
        case 52:   
          sprintf(file_buf, "%s", helpx_txt);
          response = RP_TEXT;
          resp_ready = true;
          fc_com = 200;
          break;

        case 55:
          if (x == 0) fc_com++;
          break;  
        case 56:
          fc_com++;
          break;
        case 57:      
          sprintf(file_buf, "%s", help_txt);
          response = RP_TEXT;
          resp_ready = true;
          fc_com = 200;
          break;
/*
    // extern Save Mon11 --------------------------------------------------
    case 60: arg1 = x; fc_com++; break; // Argumente 1-3
    case 61: arg1 |= x << 8; fc_com++; break;
    case 62: arg2 = x; fc_com++; break;
    case 63: arg2 |= x << 8; fc_com++; break;
    case 64: arg3 = x; fc_com++; break;
    case 65: arg3 |= x << 8; fc_com++; len = (arg2 - arg1) + 1; break;
    case 66: // Header puffern - ID, Typ, Magic Byte, Dateiname
      nbuf[ixbuf++] = x; 
      if (ixbuf == 33){  //17 Systemzellen   
        nbuf[13] = 0;    //Ende Dateiname  
        sprintf(fname, "%s", &nbuf[1]);
        fc_com++;
        csumx = csum;
      }
      break;
    case 67: // Header-Prüfsumme
      if (csumx == x) {
        csum = 0;
        fc_com++;
      }
      else {
        response_message(101); //Error CSum Header
        fc_com = 200; //weitere Zeichen laufen ins Leere
      }
      break;
    case 68: // Datei
      file_buf[ix_file_buf++] = x;
      if (ix_file_buf == sizeof(file_buf)){ //> 64k
        response_message(103);
        fc_com = 199;
        break;
      }
      if (((ix_file_buf % 256) == 0) || (len == ix_file_buf)) { // nächstes Byte Blockprüfsumme
        fc_com++;
        csumx = csum;
      }
      break;
    case 69: // Blockprüfsumme
      if (csumx != x) {
        response_message(102);  //Error CSum Data
        fc_com = 200;
      } else {
        if (len == ix_file_buf) {   // Dateiende  
          //Headerzeile basteln, ohne ARG1-3
          char ftyp = nbuf[15];         //Dateityp
          char finfo[16];
          memcpy(finfo, &nbuf[17], 16); //HeaderInfo puffern
          bzero(nbuf, sizeof(nbuf));
          sprintf(nbuf, "%s%c%c%c%c%s", "V3.1_1", ftyp, 0xD3, 0xD3, 0xD3, finfo);     
          res = save_file(file_buf, fname, len, true);    //incl. Header  
        
          if (res == 0) {
            file_buf[0] = 0,          //0x00 als Response senden
            response = RP_TEXT;
            resp_ready = true;
          } else {
            response_message(res);
          }
          fc_com = 200;
        } else {
          fc_com--; // nächster Block
          csum = 0;
        }
      }
      break;
    // extern Load --------------------------------------------------------------------------------
    case 80: // Dateinamen puffern   
      if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
      if (ixbuf == 12){
        nbuf[12] = 0; //Stringende
        sprintf(fname, "%s", nbuf);
        fc_com++;
        csumx = csum;
      }
      break;
    case 81: // Header-Prüfsumme (Filename)
      if (csumx == x) {
        csum = 0;
        res = load_file(fname, &len); //File lesen
        if (res == 0) {               //laden Ok
          response = RP_DATA;
          resp_ready = true;
          fc_com = 200;     
        } else {
          response_message(res);
          response = RP_TEXT;
          fc_com = 200;     //Ausgabe Fehlermeldung
        }
      } else {                //Error CSum
        response_message(101); //Error CSum Header
        fc_com = 199;
      }      
      break;
 */   

// ----------------------------------------------------------------------------------------------------

    //extern - Daten schreiben
    case 100: arg1 = x; fc_com++; break; // Argumente 1-3
    case 101: arg1 |= x << 8; fc_com++; break;
    case 102: arg2 = x; fc_com++; break;
    case 103: arg2 |= x << 8; fc_com++; break;
    case 104: arg3 = x; fc_com++; break;
    case 105: arg3 |= x << 8; fc_com++; len = (arg2 - arg1) + 1; break;
    case 106: ftype = x; fc_com++; break; //Info Dateityp
    case 107: //Dateiname
      if (x == 0) {                   //Header Ende
        nbuf[MAX_FILE_NAME_LEN] = 0;  //Zwangsende Name
        sprintf(fname, "%s", nbuf);
        csumx = csum; //Daten tranparent in file_buf schreiben
        fc_com++;
      } else {
        nbuf[ixbuf] = x;
        if (ixbuf < sizeof(nbuf)) ixbuf++;
      }
      break;
    case 108:               //Prüfung CSum Header
      ix_file_buf = 0;
      csum_ext = 0;         //Blockprüfsumme init
      if (csumx == x) {
        ret_code = 0;       //Kommando ok
      } else { 
        ret_code = 0x01;    //Bit 0 - Code CSumError Kommando
      }
      fc_com++;
      break;   
    case 109:  
      file_buf[ix_file_buf++] = x;  //Datenbytes empfangen
      csum_ext += x;
      if ((ix_file_buf % 256) == 0) {
        fc_com++;                    //Blockprüfsumme folgt
      } else
      if (len == ix_file_buf) {
        fc_com +=2;                 //Datenende
      }
      break;
    case 110:
      if (csum_ext != x) ret_code |= 0x02;       //Bit 1 - Code CSumError Block
      if (len == ix_file_buf) fc_com++;
      else fc_com--;                 //nächsten Block lesen
      break;
    case 111:
      if (csum_ext != x) {
        ret_code |= 0x04;       //Bit2 - Code CSumError letzter Block
        res = 0xFF;
      } else {                  //Datei speichern
        bzero(nbuf, sizeof(nbuf));
        sprintf(nbuf, "saveex%c%c%c%c%s", ftype, 0xD3, 0xD3, 0xD3, fname);
        res = save_file(file_buf, fname, ix_file_buf, ftype != 0);
      }
      file_buf[0] = ret_code;   //Prüfsumme 0x00: Ok oder ErrorCode
      file_buf[1] = res;        //Fehlercode Save 0x00: Ok
      resp_ready = true;
      cnt_code = 2;             //Anz. der zurückgelieferten Codebytes
      fc_com = 200;
      response = RP_CODE;
      break;  

    //ext Datei von SD-Card lesen --------------------------------------------
    case 120: // Dateinamen puffern   
      if (ixbuf < SZ_NBUF) nbuf[ixbuf++] = x; //ArrayBegrenzung
      if (x == 0){
        sprintf(fname, "%s", nbuf);
        fc_com++;
        csumx = csum;
      }
      break;
    case 121: // Header-Prüfsumme (Dateinemae)
      ret_code = 0;               //CSum Dateiname ok
      res = 0;
      if (csumx == x) {
        csum = 0;
        ret_code = 0;              
        res = load_file(fname, &len); //File lesen
        if (res == 0) {               //laden Ok
          response = RP_DATA;   //Datei wird zurückgeliefert
          resp_ready = true;
          fc_com = 200;     
        } else {                //Fehlercode Dateioperation
          cnt_code = 2;         //2-stelliger Hexcode
          response = RP_CODE;
          resp_ready = true;
          fc_com = 200;         //Rücksendung Fehlercode
        }
      } else {                  //Error CSum
        cnt_code = 2;           //2-stelliger Hexcode
        response = RP_CODE;
        resp_ready = true;
        ret_code |= 1;          
        len = 0;                //keine weiteren Bytes erwartet
        fc_com = 199;
      }     
      //Code nur im Fehlerfall zurückliefern, sonst Datenbytes 
      if (response == RP_CODE) {
        file_buf[0] = ret_code;   //Fehlercode CSum Dateiname 0x00 = Ok
        file_buf[1] = res;        //Fehlercode load file 0x00 = Ok
      }
      break;

 // ---------------------------------------------------------------------------------
 //externe Kommandos, Binaries ausliefern    
    case 130:
      if (x == 'Z') {         //Minibasic wurde angefordert
        len = sizeof(miba_bin);
        memcpy(file_buf, miba_bin, len); //aus Array kopieren
        response = RP_DATA;   //Datei wird zurückgeliefert
        resp_ready = true;
        fc_com = 200;
      }
      break; 
// ----------------------------------------------------------------------------------

    case 199: //Zeichen laufen nach CSum-Error ins Leere
      if (len-- == 0) fc_com++;
      break;

  } //switch fc
}


uint8_t char_to_zcom() {
  uint8_t res;
  switch (fc_com) {
    case 211:
      ix_file_buf = 0;
      fc_com++;
      res = 0x00; //Syncbyte 0
      break;
    case 212:
      fc_com++;
      res = 0x55; //Syncbyte 1
      break;
    case 213:     //Antworttyp
      if (response == RP_TEXT) {
        res = 0x01;
        fc_com = 214;
      }
      if (response == RP_DATA) {
        res = 0x02;
        fc_com = 220;
      }
      if (response == RP_CODE) {
        res = 0x03;
        ix_file_buf = 0;
        fc_com = 230;
      }
      break;
    //Textausgabe -> Ende: 0x00
    case 214 :
      res = file_buf[ix_file_buf++];
      if (res == 0) fc_com++;
      break;
    case 215:
      fc_com = 255;
      break;

    //Datenausgabe
    case 220:     //Länge L-Byte
      fc_com++;
      res = (uint8_t)len & 0xFF;
      break;
    case 221:
      fc_com++;    //Länge H-Byte
      res = (uint8_t)(len >> 8) & 0xFF;  
      ix_file_buf = 0;
      csum = 0;
      break;  
    case 222:   //Header 32Bytes
      res = file_buf[ix_file_buf++];
      csum += res;
      if (ix_file_buf == 32) fc_com++;  
      break;
    case 223:   //CSum Header
      res = csum;
      csum = 0;
      fc_com++;
      break;
    case 224:   //Daten
      res = file_buf[ix_file_buf++]; 
      csum += res;
      if ((((ix_file_buf-32) % 256) == 0) || (len == ix_file_buf)) fc_com++; //nächstes Byte -> Blockprüfsumme ?
      break;
    case 225:   //Block-CSum
      res = csum;
      csum = 0;
      if (len == ix_file_buf) fc_com++;  //Ende
      else fc_com--; //nächster Block
      break;
    case 226:
      fc_com = 255; //Grunstellung ZCOM
      break;    

    //Rückgabe individuelle Fehlercodes
    case 230:
      res = file_buf[ix_file_buf++];  
      if (ix_file_buf == cnt_code) 
        fc_com = 255;
      break;
          
  }
  return res;
}

// -----------------------------------------------------------------


void start_zcom_op(char x) {
  //set_printfile(false); 
  fc_zcom_initial();
  fc_com = 80;
  csum = 0;
  ix_file_buf = 0;
  resp_ready = false;
  ixbuf = 0;
  bzero(nbuf, sizeof(nbuf));

  switch (x) {
    case 's': fc_com = 10; break;   //Save to SD-Card
    case 'l': fc_com = 30; break;   //Load from SD-Card / List directory
    case 'd': fc_com = 35; break;   //Directory anzeigen/wechseln
    case 'm': fc_com = 37; break;   //Directory erstellen
    case 't': fc_com = 40; break;   //Time set/get
    case 'c': fc_com = 45; break;   //set color
    case 'h': fc_com = 50; break;   //Help monx
    case 'H': fc_com = 55; break;   //Help AC1
//    case 's' + 0x80: fc_com = 60; break;   //extern save - obsolete
//    case 'l' + 0x80: fc_com = 80; break;   //extern load - obsolete

    case 'w' + 0x80: fc_com = 100; break; //extern fopen write
    case 'r' + 0x80: fc_com = 120; break; //extern fopen read
    case 'k' + 0x80: fc_com = 130; break;  //externe Kdos aus IO-Flash laden 
  }

}