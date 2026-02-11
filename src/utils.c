#include <time.h>

const int TIME_SECONDS_OFFSETT = 978307200;
const char *CALENDAR_DATE_FORMAT = "%Y-%m-%d %H:%M:&S";

time_t convert_epoch_mac_to_unix(time_t mac_time) {
  return mac_time + TIME_SECONDS_OFFSETT;
};

time_t convert_epoch_unix_to_mac(time_t unix_time) {
  return unix_time - TIME_SECONDS_OFFSETT;
};

time_t convert_calendar_date_to_unix_epoch(char date[]) {
  // TODO: error handling
  struct tm tm = {0};
  strptime(date, CALENDAR_DATE_FORMAT, &tm);
  return timegm(&tm);
};

time_t convert_calendar_date_to_mac_epoch(char date[]) {
  // TODO: re-implement logic to convert to mac epoch directly
  return convert_epoch_unix_to_mac(convert_calendar_date_to_unix_epoch(date));
};
