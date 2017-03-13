#!/usr/bin/perl -w

use warnings;
use strict;

sub binary_search {
    my ( $list, $item ) = @_;

    # low and high keep track of which part of the list you'll search in.
    my ( $low, $high ) = (0, $#$list );
    my $result = undef;
    my ( $mid, $guess );

    # While you haven't narrowed it down to one element ...
    while ( $low <= $high ) {
        $mid = int(($low + $high) / 2);
        $guess = $list->[$mid];
        # Found the item.
        if ( $guess == $item ) {
            $result = $mid;
            last;
        }

        if ( $guess < $item ) {
            $low = $mid + 1;
        } else {
            $high = $mid - 1;
        }
    }
    
    $result;
}

my @my_list = (1, 3, 5, 7, 9);
print "Original Array: @my_list\n";
print " Search for  3: ", (defined binary_search(\@my_list, 3) ? defined binary_search(\@my_list, 3) : ""), "\n";
print " Search for -1: ", (defined binary_search(\@my_list, -1) ? binary_search(\@my_list, -1) : ""), "\n";
