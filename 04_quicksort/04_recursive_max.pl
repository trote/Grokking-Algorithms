#!/usr/bin/perl -w

use warnings;
use strict;

sub max($);

sub max($) {
    my $arr = shift;
    
    if ( @$arr == 2 ) {
        return $arr->[0] > $arr->[1] ? $arr->[0] : $arr->[1];
    }
    
    my $sub_max = max [ @{$arr}[1 .. $#$arr] ];
    $arr->[0] > $sub_max ? $arr->[0] : $sub_max;
}
