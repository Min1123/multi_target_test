#include <iostream>
#include <cstdint>
using namespace std;

int main()
{
	uint64_t x=0;
	int i;

	for(i=1; i<350000001; i++)
	{
		if((i%3)==0)
			continue;
		if((i%2)==0)
			continue;
		x+=i;
	}

	cout << x << "\n";
}

