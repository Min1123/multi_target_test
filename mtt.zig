const std = @import("std");

pub fn main() !void {
    var x: u64 = 0;
    var i: u64 = 1;

    const stdout = std.io.getStdOut().writer();

    while (i < 350000001) : (i += 1) {
        if ((i % 3) == 0) {
            continue;
        }
        if ((i % 2) == 0) {
            continue;
        }
        x += i;
    }

    try stdout.print("{d}\n", .{x});
}
