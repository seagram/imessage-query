#import <time.h>

time_t convert_epoch_mac_to_unix(time_t mac_time);

time_t convert_epoch_unix_to_mac(time_t unix_time);

time_t convert_calendar_date_to_unix_epoch(char date[]);

time_t convert_calendar_date_to_mac_epoch(char date[]);
