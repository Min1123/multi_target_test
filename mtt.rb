#!/usr/bin/env ruby

x=0

(1..350000001).each do |i| 
  if((i%3)==0)
    next
  end
  if((i%2)==0)
    next
  end

  x+=i
end

puts(x)

