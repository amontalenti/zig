const std = @import("std");
const print = std.debug.print;

// must run with zig run <src> --library c
const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("stdlib.h");
});

pub fn main() !void {
    var numChars: u64 = 0;
    var numLines: u64 = 0;
    var numWords: u64 = 0;
    var numDigit: u64 = 0;
    var numWhite: u64 = 0;
    var numOther: u64 = 0;

    var numDigitArray: [10]u64 = .{0} ** 10;

    print("numDigitArray @TypeOf    =\n  {s}\n", .{@TypeOf(numDigitArray)});
    print("[10]u64 @typeInfo =\n  {s}\n", .{@typeInfo([10]u64)});

    while (true) {
        const oneChar: c_int = c.getchar();
        if (oneChar == c.EOF) {
            print("> Hit EOF!\n", .{});
            print("> char, word, line count: {d} chars, {d} words, {d} lines\n", .{ numChars, numWords, numLines });
            print("> whitespace vs digits  : {d} whitespace, {d} digit, {d} other\n", .{ numWhite, numDigit, numOther });
            print("> digits array, '0'-'9' : {any}", .{numDigitArray});
            return;
        }
        const charAsciiCode: u8 = @intCast(u8, oneChar);
        print("{c}", .{charAsciiCode});
        if (oneChar == ' ') {
            numWhite += 1;
            numWords += 1;
        } else if (oneChar == '\n') {
            numWhite += 1;
            numWords += 1;
            numLines += 1;
        } else if (oneChar >= '0' and oneChar <= '9') {
            // use the cute C trick of contiguous ASCII encodings
            const digitIdx = charAsciiCode - '0';
            numDigitArray[digitIdx] += 1;
            numDigit += 1;
        } else {
            numOther += 1;
        }
        numChars += 1;
    }
}
