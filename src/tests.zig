const print = @import("std").debug.print;

pub fn isZero(b: u1) bool {
    return b == 0;
}

pub fn main() void {
    const smallInts = [_]u3{ 1, 2, 3, 4, 5, 6, 7 };

    print("Hello, {s}, {s}!\n", .{ "world", isZero(@boolToInt(false)) });

    for (smallInts) |smallInt| {
        print("Hello, {}\n", .{smallInt});
    }
}

const std = @import("std");
const expect = std.testing.expect;
const eql = std.mem.eql;
const ArrayList = std.ArrayList;
const test_allocator = std.testing.allocator;

test "arraylist" {
    var list = ArrayList(u8).init(test_allocator);
    defer list.deinit();
    try list.append('H');
    try list.append('e');
    try list.append('l');
    try list.append('l');
    try list.append('o');
    try list.appendSlice(" World!");

    try expect(eql(u8, list.items, "Hello World!"));
}
