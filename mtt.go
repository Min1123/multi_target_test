package main

import (
	"fmt"
)

func main() {
	var x int = 0

	for i := 1; i<350000001; i++ {
		if((i%3)==0) {
			continue
		}
		if((i%2)==0) {
			continue
		}
		x+=i;
	}

	fmt.Println(x)
}


/*
#include <stdio.h>

int main()
{
	unsigned long long x=0;
	int i;

	for(i=1; i<350000001; i++)
	{
		if((i%3)==0)
			continue;
		if((i%2)==0)
			continue;
		x+=i;
	}

	printf("%llu\n",x);
}
*/
