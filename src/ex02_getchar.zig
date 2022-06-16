const std = @import("std");
const print = std.debug.print;

// must run with zig run <src> --library c
const c = @cImport({
    @cInclude("stdio.h");
});

pub fn main() !void {
    var numChars: u64 = 0;
    var numLines: u64 = 0;
    var numWords: u64 = 0;

    const stdout = std.io.getStdOut().writer();

    while (true) {
        const oneChar: c_int = c.getchar();
        if (oneChar == c.EOF) {
            try stdout.print("> Hit EOF! ({d} chars, {d} words, {d} lines)", .{ numChars, numWords, numLines });
            return;
        }
        print("{c}", .{@intCast(u8, oneChar)});
        if (oneChar == ' ') {
            numWords += 1;
        }
        if (oneChar == '\n') {
            numWords += 1;
            numLines += 1;
        } else {
            numChars += 1;
        }
    }
}
