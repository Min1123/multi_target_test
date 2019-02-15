#!/usr/bin/env perl

use strict;
use warnings;

my $x = 0;

foreach my $i (1..350000001) {
	if(($i%3)==0) {
		next;
	}
	if(($i%2)==0) {
		next;
	}
	$x+=$i;
}

print $x, "\n";

