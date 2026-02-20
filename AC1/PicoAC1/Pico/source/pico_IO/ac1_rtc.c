#include <stdio.h>
#include "pico/stdlib.h"

#include "hardware/i2c.h"

#include "ac1_rtc.h"
#include "ac1_interface.h"


#define DS3231_ADDR     0x68
#define DS3231_SEC_REG  0x00    //1.Datenregister (sek)
#define DS3231_CNT_REG  0x07    //Anz. der Zeit-Datenregister


//Default-Start-Time, falls kein DS3231 erkannt wird
datetime_t dt_def = {
            .year  = 2023,
            .month = 8,
            .day   = 1,
            .dotw  = 0, 
            .hour  = 12,
            .min   = 0,
            .sec   = 0
};


void DS3231_init() {
    i2c_init(RTC_I2C_IF, 400000); 
    gpio_set_function(RTC_DATA, GPIO_FUNC_I2C);  //SDA
    gpio_set_function(RTC_CLK, GPIO_FUNC_I2C);   //CLK
    gpio_pull_up(RTC_DATA);
    gpio_pull_up(RTC_CLK);

}


static uint8_t hex2bcd(uint8_t hex_in) {
    uint8_t lb = hex_in % 10;
    uint8_t hb = (hex_in - lb) / 10;
    return (hb << 4) | lb;
}


static uint8_t bcd2hex(uint8_t bcd_in){
    uint8_t lb = bcd_in & 0x0F;
    uint8_t hb = bcd_in >> 4;
    return lb + hb * 10;
}

//Datum & Zeit aus RTC-Register leden
bool ds3231_read_datetime(datetime_t *dt) {
    uint8_t buf[8];
    buf[0] = DS3231_SEC_REG;
    i2c_write_blocking(RTC_I2C_IF, DS3231_ADDR, buf, 1, true);
    if (i2c_read_blocking(RTC_I2C_IF, DS3231_ADDR, buf, DS3231_CNT_REG, false) == DS3231_CNT_REG) {
        dt->sec = bcd2hex(buf[0]);
        dt->min = bcd2hex(buf[1]);
        dt->hour = bcd2hex(buf[2]);
        dt->dotw = buf[3];
        dt->day = bcd2hex(buf[4]);
        dt->month = bcd2hex( buf[5] & 0x7F);
        dt->year = bcd2hex(buf[6]) + 1900 + 100 * (buf[5] >> 7);
        return true;
    } else {
        dt = &dt_def;
        return false;
    }    
}

//Datum & Zeit in RTC-Register schreiben
void ds3231_write_datetime(datetime_t *dt) {
    uint8_t buf[8];
    buf[0] = DS3231_SEC_REG;    //Startregister
    buf[1] = hex2bcd(dt->sec);
    buf[2] = hex2bcd(dt->min);
    buf[3] = hex2bcd(dt->hour);
    buf[4] = dt->dotw;
    buf[5] = hex2bcd(dt->day);
    buf[6] = hex2bcd(dt->month);
    if (dt->year < 2000) {
        buf[7] = hex2bcd(dt->year - 1900);
    } else {
       buf[7] = hex2bcd(dt->year - 2000); 
       buf[6] |= 0x80;  //century-Bit
    }
    i2c_write_blocking(RTC_I2C_IF, DS3231_ADDR, buf, DS3231_CNT_REG + 1, true);
} 
