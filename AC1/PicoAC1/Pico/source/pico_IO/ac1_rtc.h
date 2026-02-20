#ifndef __AC1_RTC_H__
#define __AC1_RTC_H__


extern datetime_t dt_def;

void DS3231_init();
bool ds3231_read_datetime(datetime_t *dt);
void ds3231_write_datetime(datetime_t *dt);

#endif