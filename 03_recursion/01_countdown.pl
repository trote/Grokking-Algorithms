#!/usr/bin/perl -w

use warnings;
use strict;

sub countdown($);

sub countdown($) {
    my $i = shift;
    
    print "$i\n";
    # base case
    return if $i <= 0;
    # recursive case
    countdown $i-1;
}

countdown 5;

