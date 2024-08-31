#!/usr/bin/env lua

local socket = require("socket")

function run()
	local x = 0

	local start_time = socket.gettime()

	for i=1,350000001,1
		do
			flag=0
			if((i%3)==0)
				then
				flag=1
				end
			if((i%2)==0)
				then
				flag=1
				end
			if(flag==0)
				then
					x=x+i
				end
	end

	local end_time = socket.gettime()

	return string.format("%d, %0.6f", x, end_time - start_time)
end

print(run())

