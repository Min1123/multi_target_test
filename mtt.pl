#!/usr/bin/env perl

use strict;
use warnings;
use Time::HiRes;

sub run() {
	my $x = 0;

	my $start_time = Time::HiRes::time();

	foreach my $i (1..350000001) {
		if(($i%3)==0) {
			next;
		}
		if(($i%2)==0) {
			next;
		}
		$x+=$i;
	}

	my $end_time = Time::HiRes::time();

	my $etnorm = sprintf("%0.6f", ($end_time - $start_time));

	return $x . ", " . $etnorm;
}

print run(), "\n";

