#!/usr/bin/env lua

x=0
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

print(x)

