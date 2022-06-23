run:
	ls ex* | parallel --tag-string "{}:    \t" -k zig run --library c

test:
	ls ex* | parallel --tag-string "{}:    \t" -k zig test

cprogs:
	zig cc power.c -o run_power
	zig cc getchar.c -o run_getchar
