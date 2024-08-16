#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <strings.h>
#include <time.h>

char output[128];

char *run()
{
	struct timespec start_time;
	struct timespec end_time;
	double out_time_delta;
	uint64_t x=0;
	int i;

	clock_gettime(CLOCK_REALTIME, &start_time);

	for(i=1; i<350000001; i++)
	{
		if((i%3)==0)
			continue;
		if((i%2)==0)
			continue;
		x+=i;
	}
	clock_gettime(CLOCK_REALTIME, &end_time);

	out_time_delta = (end_time.tv_nsec - start_time.tv_nsec)/(1000.0*1000.0*1000.0);

	if(out_time_delta < 0)
	{
		exit(-1);
	}

	snprintf(output, 200, "%llu, %f\n", x, out_time_delta);

	return output;
}

int main()
{
	printf("%s", run());

	return 0;
}

