const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var buf: [1000]u8 = undefined;
    var numChars: u64 = 0;
    var numLines: u64 = 0;
    var numWords: u64 = 0;

    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    while (true) {
        const line = (try stdin.readUntilDelimiterOrEof(&buf, '\n')) orelse {
            try stdout.print("> Hit EOF! ({d} chars, {d} words, {d} lines)\n", .{ numChars, numWords, numLines });
            return;
        };

        // debug echo output
        print("{s}\n", .{line});

        for (line) |char| {
            if (char == ' ') {
                numWords += 1;
            }
        }
        if (line.len > 0) {
            numWords += 1;
        }
        numChars += line.len;
        numLines += 1;
    }
}
