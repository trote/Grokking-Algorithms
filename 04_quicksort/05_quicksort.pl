#!/usr/bin/perl -w

use warnings;
use strict;

sub quick_sort {
    my ( $arr ) = @_;

    # base case, arrays with 0 or 1 element are already "sorted"
    return $arr if @$arr < 2;

    my $pivot = $arr->[ rand @$arr ];
    # sub-array of all the elements less than the pivot
    my $less = [ grep { $_ < $pivot } @$arr ];
    # sub-array of all the elements greater than the pivot
    my $greater = [ grep { $_ > $pivot } @$arr ];

    [ @{quick_sort($less)}, $pivot, @{quick_sort($greater)} ];
}

my @arr = (54, 26, 93, 17, 77, 31, 44, 55, 20);
print "Original Array: @arr\n";
print "Sorted Array:   @{quick_sort \@arr}\n";
