#!/usr/bin/perl -w

use warnings;
use strict;

sub sum($);

sub sum($) {
    my $arr = shift;
    
    return 0 unless @$arr;
    $arr->[0] + sum([ @{$arr}[1 .. $#$arr] ]);
}

print sum [1, 2, 3, 4];
