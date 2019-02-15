#!/usr/bin/env perl6

my Int $x = 0;

for 1..350000001 -> $item {
	if (($item%3)==0) {
		next;
	}
	if (($item%2)==0) {
		next;
	}
	$x+=$item;
}

print $x, "\n";

