const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const zero: u32 = 0;
    var fahr: f32 = zero;
    var celsius: f32 = zero;
    const lower = zero;
    const upper = 300;
    const step = 10;

    fahr = lower;
    // header
    print("{s}\t{s}\n", .{ "fahr", "celsius" });
    while (fahr <= upper) {
        // convert (floating point)
        celsius = 5 * (fahr - 32) / 9;
        // row => digit
        // x.y is width.precision
        // c> is left-pad with character 'c'
        // ' >' is left-pad with spaces
        print("{d:3.0}\t{d: >6.2}\n", .{ fahr, celsius });
        // advance
        fahr = fahr + @as(f32, step);
    }
    print("---\n", .{});
    print("Final fahr: {d:3.0}\n", .{fahr});
    print("Final fahr type: {s}\n", .{@TypeOf(fahr)});
}
