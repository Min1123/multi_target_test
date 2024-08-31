fn run() -> String
{
    let mut x: u64 = 0;
    let start_time = std::time::Instant::now();

    for i in 1..350000001
    {
        if (i%3)==0
        {
            continue;
        }
        if (i%2)==0
        {
            continue;
        }
        x+=i;
    }

    let end_time = start_time.elapsed();

    let etnorm = format!("{}.{}", end_time.as_secs(), end_time.subsec_nanos() / 1000);

    return format!("{}, {}", x, etnorm);
}

fn main()
{
    println!("{}", run());
}

