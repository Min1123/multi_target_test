const warn = @import("std").debug.warn;

pub fn main() void {

    var x: u64 = 0;
    var i: u64 = 1;

    while (i < 350000001) : (i+=1) {
        if ((i%3)==0)
        {
            continue;
        }
        if ((i%2)==0)
        {
            continue;
        }
        x+=i;
    }

    warn("{}\n", x);
}

