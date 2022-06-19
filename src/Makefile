run:
	ls ex* | parallel --tag-string "{}:    \t" -k zig run --library c

test:
	ls ex* | parallel --tag-string "{}:    \t" -k zig test
