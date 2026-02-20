#ifndef _AC1_SDCARD_H_
#define _AC1_SDCARD_H_

#include "ac1_config.h"

extern uint8_t file_buf[0x10020]; // Z80 max Speicher + 32 Bytes Header, (Tx)
extern uint32_t ix_file_buf;
extern bool resp_ready;           //Response bereit zu Übertragung
extern bool sd_blocked;

#define SZ_NBUF 48
extern uint8_t nbuf[SZ_NBUF];              //Puffer Zeichenkette v. ZCOM
extern uint8_t fname[SZ_NBUF];
extern uint8_t ixbuf;

extern uint16_t arg1, arg2, arg3; // AC1 - Argumente
extern uint8_t ftype;             //Filetyp Header, Info

uint8_t load_file(uint8_t *fn, uint32_t *plen);
int find_file (uint8_t *fnx, uint8_t typ);
uint8_t save_file(uint8_t *fbuf, uint8_t *fn, uint32_t flen, bool save_hdr);
int change_dir(char *pn, bool force);

void sd_card_check();
bool is_sd_card_detected();

uint8_t load_cfg(cfg_data_t* cfg_data);
uint8_t save_cfg(cfg_data_t cfg_data);

void sd_set_pathname(char *pn);
char* sd_get_pathname();

uint8_t save_scancode(uint8_t *pkbs);
uint8_t load_scancode(uint8_t *pkbs);

#endif