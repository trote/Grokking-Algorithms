#!/usr/bin/perl -w

use warnings;
use strict;

# Finds the smallest value in an array
sub min($) {
    my ( $arr ) = @_;
    
    # Stores the smallest value
    my $smaller = $arr->[0];
    # Stores the index of the smallest value
    my $smaller_index = 0;
    for ( 1 .. $#$arr ) {
        if ( $arr->[$_] < $smaller ) {
            $smaller_index = $_;
            $smaller = $arr->[$_];
        }
    }
    $smaller_index;
}

# Sort array
sub selection_sort($) {
    my ( $arr ) = @_;

    my @sorted_arr;
    for ( 0 .. $#$arr ) {
        # Finds the smallest element in the array and adds it to the new array
        push @sorted_arr, splice @$arr, min($arr), 1;
    }
    \@sorted_arr;
}

my @arr = (5, 3, 6, 2, 10);
print "Original Array: @arr\n";
print "  Sorted Array: @{selection_sort \@arr}\n";
