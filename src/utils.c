#include <time.h>

const int TIME_SECONDS_OFFSETT = 978307200;

time_t convert_epoch_mac_to_unix(time_t mac_time) {
  return mac_time + TIME_SECONDS_OFFSETT;
};

time_t convert_epoch_unix_to_mac(time_t unix_time) {
  return unix_time - TIME_SECONDS_OFFSETT;
};
