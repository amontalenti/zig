const std = @import("std");
const print = std.debug.print;

// This code translated straightforwardly from C, but we needed
// to migrate from 'int' to 'u64', explicitly declare 'var' variables,
// and switch from C-style for loop to Zig extended while loop.
pub fn power(base: u64, n: u64) u64 {
    var p: u64 = 1;
    var i = p;

    while (i <= n) : (i += 1) {
        p = p * base;
    }

    return p;
}

// In C, a function argument is not 'const', thus K&R C just uses 'n'
// directly; in Zig, we need to do a no-performance-cost var declaration to
// make it clear that we are modifying a variable which merely "defaults"
// to the passed-in fn argument value.
pub fn powerDown(base: u64, n: u64) u64 {
    var p: u64 = 1;
    var n_ = n;

    while (n_ > 0) : (n_ -= 1) {
        p = p * base;
    }

    return p;
}

pub fn main() !void {
    var i: u64 = 1;

    while (i <= 10) : (i += 1) {
        print("{d} = {d} = {d}\n", .{ i, power(2, i), powerDown(2, i) });
    }
}

// We can convert our debug output into a nice unit test. This compares the
// return values of power() to powerDown().
test {
    const expectEqual = std.testing.expectEqual;
    var i: u64 = 1;
    // change maxPower to e.g. 100 and it'll overflow
    const max_power = 10;

    while (i <= max_power) : (i += 1) {
        try expectEqual(power(2, i), powerDown(2, i));
    }
}
