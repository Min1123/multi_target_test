#!/usr/bin/env python3

import sys

x=0
if sys.version_info.major > 2:
    for i in range(1,350000001):
        if((i%3)==0):
            continue
        if((i%2)==0):
            continue
        x+=i
else:
    for i in xrange(1,350000001):
        if((i%3)==0):
            continue
        if((i%2)==0):
            continue
        x+=i

print(x)

