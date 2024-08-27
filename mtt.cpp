#include <chrono>
#include <cstdint>
#include <iostream>
#include <string>

std::string run() {
	uint64_t x=0;
	int i;
	double time_delta;
	std::string output;

	auto start = std::chrono::system_clock::now();



	for(i=1; i<350000001; i++) {
		if((i%3)==0)
			continue;
		if((i%2)==0)
			continue;
		x+=i;
	}
	
	auto stop = std::chrono::system_clock::now();

	auto stop_nanos = std::chrono::duration_cast<std::chrono::nanoseconds>(stop.time_since_epoch());
	auto start_nanos = std::chrono::duration_cast<std::chrono::nanoseconds>(start.time_since_epoch());

	time_delta = (stop_nanos.count() - start_nanos.count())/1000.0/1000.0/1000.0;

	output = std::to_string(x) + ", " + std::to_string(time_delta);

	return output;
}

int main() {
	std::cout << run() << "\n";

	return 0;
}

