#!/usr/bin/perl -w

use warnings;
use strict;

sub sum {
    my $arr = shift;
    
    my $total = 0;
    $total += $_ for @$arr;
    $total;
}

print sum [1, 2, 3, 4];
