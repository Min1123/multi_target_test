fn main()
{
    let mut x: u64 = 0;

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

    println!("{}\n",x);
}

