#include <stdio.h>

#ifdef PICO_BUILD
#include "pico/stdlib.h"
#include "pico/time.h"
#else
#include <stdint.h>
#include <stdlib.h>
#include <strings.h>
#include <time.h>
#endif

char output[128];

char *run()
{
	#ifdef PICO_BUILD
	uint32_t start_time;
	uint32_t end_time;
	#else
	struct timespec start_time;
	struct timespec end_time;
	#endif

	double out_time_delta;
	uint64_t x=0;
	int i;

	#ifdef PICO_BUILD
	start_time = to_ms_since_boot(get_absolute_time());
	#else
	clock_gettime(CLOCK_MONOTONIC_COARSE, &start_time);
	#endif

	for(i=1; i<350000001; i++)
	{
		if((i%3)==0)
			continue;
		if((i%2)==0)
			continue;
		x+=i;
	}

	#ifdef PICO_BUILD
	end_time = to_ms_since_boot(get_absolute_time());
	out_time_delta = (end_time - start_time)/(1000.0);
	#else
	clock_gettime(CLOCK_MONOTONIC_COARSE, &end_time);

	out_time_delta = (end_time.tv_nsec - start_time.tv_nsec)/(1000.0*1000.0*1000.0);

	if (out_time_delta < 0)
	{
		return "Failed to have positive time.\n";
	}
	#endif


	snprintf(output, 120, "%llu, %f\n", x, out_time_delta);

	return output;
}

int main()
{
	#ifdef PICO_BUILD
	stdio_init_all();
	#endif

	printf("%s", run());

	return 0;
}

