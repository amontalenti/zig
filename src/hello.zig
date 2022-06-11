const std = @import("std");

//
// function order doesn't matter within module
//
pub fn printItems(stdout: anytype) !void {
    // the '_' means inferred size
    const items = [_]u8{ 'a', 'b', 'c', 'd', 'e', 'f', 'g' };

    // though we're using 'anytype' above, we still have a runtime
    // type available here via @TypeOf
    try stdout.print("What's the runtime type of stdout?\n", .{});
    try stdout.print("{s}\n\n", .{@TypeOf(stdout)});

    // make use of the tagged array's length
    try stdout.print("{d} introspected items to greet...\n", .{items.len});

    // simple for loop with built in iteration and enumeration
    for (items) |item, idx| {
        try stdout.print("Hello, {c} (in pos # {d})\n", .{ item, idx });
    }
}

pub fn main() !void {
    // stdout must be imported!
    const stdout = std.io.getStdOut().writer();

    // functions that return errors will fail to be called without "try",
    // forcing you to explicitly handle errors or explicitly ignore them
    try stdout.print("Hello, {s}!\n", .{"world"});
    try stdout.print("\n---\n", .{});

    // modularization via functions is pretty painless
    try printItems(stdout);
}
