#ifndef _AC1_STATUSLINE_H_
#define _AC1_STATUSLINE_H_

//enum sl_value_t {sl_mon = 0, sl_clk, sl_kbd, sl_zg, sl_dir, sl_prn, sl_time};

void sl_draw_mon (uint8_t x);
void sl_draw_clk (uint8_t x) ;
void sl_draw_kbd (uint8_t x);
void sl_draw_scancode(uint8_t x);
void sl_draw_zg (uint8_t x);
void sl_draw_dir(char *c);
void sl_draw_time(uint64_t x);
void sl_draw_prn(char *c);
void sl_draw_all();
void sl_init();


#endif