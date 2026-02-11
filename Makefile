.PHONY: clean db

all:
	zig build run --watch --summary none 2>/dev/null

db:
	zig cc src/db.c -o db && ./db

clean:
	rm -f *.o main db
