#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <hardware/i2c.h>
#include <pico/stdlib.h>

#include "ac1_interface.h"

static bool isblocked = false;

void picom_master_init() {
    gpio_init(PICOM_DATA);
    gpio_set_function(PICOM_DATA, GPIO_FUNC_I2C);
    // pull-ups are already active on slave side, this is just a fail-safe in case the wiring is faulty
    gpio_pull_up(PICOM_DATA );

    gpio_init(PICOM_CLK);
    gpio_set_function(PICOM_CLK, GPIO_FUNC_I2C);
    gpio_pull_up(PICOM_CLK);

    i2c_init(PICOM_I2C_IF, PICOM_BAUDRATE);
}

//Aufruf darf nur aus Core0 kommen 
int picom_write_command(uint8_t command, uint8_t *buf, int len) {  
  uint8_t b[64];
  b[0] = command;
  memcpy(&b[1], buf, len);
  return i2c_write_blocking(PICOM_I2C_IF, PICOM_ADDRESS, b, len+1, false);
}

