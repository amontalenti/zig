const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const zero: u32 = 0;
    var fahr: f32 = zero;
    const lower = zero;
    const upper = 300;
    const step: f32 = 10;

    fahr = lower;

    // header
    print("{s}\t{s}\n", .{ "fahr", "celsius" });

    // In K&R, this is where C-style for loops get introduced.
    // But, Zig doesn't have C-style for loops! On purpose!
    // Zig extends while loops with a "continue expression",
    // which is after the colon ":" here. As for var/const
    // declarations, Zig simply expects you to do those above
    // your while loop. Seems reasonable enough to me!

    while (fahr <= upper) : (fahr = fahr + step) {
        // convert (floating point)
        // row => digit
        // x.y is width.precision
        // c> is left-pad with character 'c'
        // ' >' is left-pad with spaces
        print("{d:3.0}\t{d: >6.2}\n", .{
            fahr, // fahrenheit value
            (5.0 / 9.0) * (fahr - 32), // celsius conversion
        });
    }

    print("---\n", .{});
    print("Final fahr value: {d:3.0}\n", .{fahr});
    print("fahr type: {s}\n", .{@TypeOf(fahr)});
    print("lower type: {s}\n", .{@TypeOf(lower)});
    print("upper type: {s}\n", .{@TypeOf(upper)});
}
