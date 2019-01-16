#!/usr/bin/env python3

import six

x=0
for i in six.moves.range(1,350000001):
    if((i%3)==0):
        continue
    if((i%2)==0):
        continue
    x+=i

print(x)

