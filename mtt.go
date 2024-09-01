package main

import (
	"fmt"
	"time"
)

func run() string {
	var x int = 0

	start_time := time.Now()

	for i := 1; i < 350000001; i++ {
		if (i % 3) == 0 {
			continue
		}
		if (i % 2) == 0 {
			continue
		}
		x += i
	}

	end_time := float64((time.Now().Sub(start_time)).Nanoseconds()) / (1000.0 * 1000.0 * 1000.0)

	output := fmt.Sprintf("%d, %0.6f", x, end_time)

	return output
}

func main() {
	fmt.Println(run())
}
