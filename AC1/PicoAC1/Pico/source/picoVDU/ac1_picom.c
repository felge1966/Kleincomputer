#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"
#include <hardware/i2c.h>
#include <pico/i2c_slave.h>

#include "ac1_interface.h"


uint8_t fc_picom = 0;
bool rx_ready = false;

#define RX_PICOM_BUF_LEN 4096
uint8_t rx_picom_buf[RX_PICOM_BUF_LEN];
uint32_t ix_picom_in = 0;
uint32_t ix_picom_out = 0;


static void i2c_slave_handler(i2c_inst_t *i2c, i2c_slave_event_t event) {
    switch (event) {
    case I2C_SLAVE_RECEIVE: // master has written some data
        //empfangenes Zeichgen in Ringpuffer eintragen
        rx_picom_buf[ix_picom_in & RX_PICOM_BUF_LEN-1] = i2c_read_byte_raw(i2c);
        rx_ready = false;
        ix_picom_in++;
        break;
    case I2C_SLAVE_REQUEST: // master is requesting data

        break;
    case I2C_SLAVE_FINISH: // master has signalled Stop / Restart
        rx_ready = true;
        break;
    default:
        break;
    }
}


void picom_slave_init() {

    gpio_init(PICOM_DATA);
    gpio_set_function(PICOM_DATA, GPIO_FUNC_I2C);
    gpio_pull_up(PICOM_DATA);

    gpio_init(PICOM_CLK) ;
    gpio_set_function(PICOM_CLK , GPIO_FUNC_I2C);
    gpio_pull_up(PICOM_CLK);

    i2c_init(PICOM_I2C_IF, I2C_BAUDRATE);
    // configure I2C0 for slave mode
    i2c_slave_init(PICOM_I2C_IF, I2C_SLAVE_ADDRESS, &i2c_slave_handler);

    //Ringpuffer initialisieren
    ix_picom_in = 0;
    ix_picom_out = 0;
    //FlowControl rücksetzen
    fc_picom = 0;
    rx_ready = false;
}

//Anzahl der im Ringpuffer vorgehaltenen (empfangenen) Zeichen
int get_cnt_picom_char() {
    return ix_picom_in - ix_picom_out;
}

//Rückgabe des nächsten empfangenen Zeichens aus Ringpuffer
//cnt sollte >0 sein, ansonsten Ergebnis = 0 / b = false
uint8_t get_next_picom_char(bool *b) {
    uint8_t res = 0;
    if (get_cnt_picom_char > 0) {
        *b = true;
        res = rx_picom_buf[ix_picom_out & RX_PICOM_BUF_LEN-1];
        ix_picom_out++;
    } else *b = false;
    return res;
}

//True, wenn Kommando komplett empfangen wurde
bool is_picom_ready() {
    return ((ix_picom_in > ix_picom_out) && rx_ready);
}
