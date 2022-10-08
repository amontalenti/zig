const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const mem = std.mem;
const fmt = std.fmt;

pub fn main() !void {
    print("Done.\n", .{});
}

test "using slices for strings" {
    // Zig has no concept of strings. String literals are const pointers
    // to null-terminated arrays of u8, and by convention parameters
    // that are "strings" are expected to be UTF-8 encoded slices of u8.
    // Here we coerce *const [5:0]u8 and *const [6:0]u8 to []const u8
    const hello: []const u8 = "hello";
    const world: []const u8 = "世界";

    var all_together: [100]u8 = undefined;
    // You can use slice syntax on an array to convert an array into a slice.
    const all_together_slice = all_together[0..];

    // String concatenation example.
    const hello_world = try fmt.bufPrint(all_together_slice, "{s} {s}", .{ hello, world });

    // Generally, you can use UTF-8 and not worry about whether something is a
    // string. If you don't need to deal with individual characters, no need
    // to decode.
    try expect(mem.eql(u8, hello_world, "hello 世界"));
}
