#!/usr/bin/env ruby

def run()
  x=0

  start_time = Time.now()

  (1..350000001).each do |i|
    if((i%3)==0)
      next
    end
    if((i%2)==0)
      next
    end

    x+=i
  end

  end_time = Time.now()

  etnorm = (end_time - start_time).truncate(6).to_s()

  return x.to_s() + ", " + etnorm
end

puts(run())

