const std = @import("std");
const print = std.debug.print;

pub fn strlen(s: [*:0]const u8) u64 {
    // [*:0]const u8 -- let's break this down
    // [   ]
    //   ^--- This means "slice" (pointer + length)
    //  *
    //  ^---- This means pointer (any value up to usize)
    //   :0
    //   ^^-- This means "null terminated"
    //
    // As for "const u8", that's just "bytes".
    //
    // So, altogether, this is a "slice of null-terminated bytes."
    //
    // It is interchangeable with the C concepts of "char *s" or "char s[]" in
    // a function prototype, but in C, the null-termination is "enforced by
    // code" rather than in the types.
    var i: usize = 0;
    while (s[i] != 0) {
        // note: you don't have '\0', instead it's just 0 -- makes sense!
        i += 1;
    }
    return i;
}

pub fn main() !void {
    const s = "hello";
    print("{s} = {d}\n", .{ s, strlen(s) });
    const z = "zig is a great programming language!";
    print("{s} = {d}\n", .{ z, strlen(z) });
}

test {
    const expectEqual = std.testing.expectEqual;
    const exampleStr = [_:0]u8{ '0', '1' };
    try expectEqual(std.mem.eql(u8, &exampleStr, "01"), true);
    try expectEqual(exampleStr.len, 2);
    try expectEqual(exampleStr.len, strlen(&exampleStr));
    try expectEqual("hello, world".len, strlen("hello, world"));
}
