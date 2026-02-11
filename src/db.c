#include <pwd.h>
#include <sqlite3.h>
#include <string.h>
#include <unistd.h>

struct sqlite3 *create_db_connection() {
  const char *user_dir = getpwuid(getuid())->pw_dir; // TODO: error logic
  const char *sqlite_file_path = "/Library/Messages/data.db";

  char db_file_path[strlen(user_dir) + strlen(sqlite_file_path) + 1];
  strncpy(db_file_path, user_dir, sizeof(db_file_path));
  strncat(db_file_path, sqlite_file_path, strlen(sqlite_file_path));

  struct sqlite3 *db;
  sqlite3_open(db_file_path, &db);
  return db;
}

int main() {};
