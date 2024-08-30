#!/usr/bin/env python3
#import datetime
import time

def run() -> str:
    start_time = time.time_ns()
    x=0
    for i in range(1,350000001):
        if i%3 == 0:
            continue
        if i%2 == 0:
            continue
        x+=i
    end_time = time.time_ns()
    return f'{x}, {(end_time - start_time)/1000**3}'


print(run())

