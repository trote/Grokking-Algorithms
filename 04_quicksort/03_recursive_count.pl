#!/usr/bin/perl -w

use warnings;
no warnings 'recursion';
use strict;

sub count($);

sub count($) {
    my $arr = shift;
    
    return 0 unless @$arr;
    1 + count([ @{$arr}[1 .. $#$arr] ]);
}

print count [1..100]
