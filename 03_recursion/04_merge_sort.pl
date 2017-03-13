#!/usr/bin/perl -w

use warnings;
use strict;

sub merge_sort($);

sub merge_sort($) {
    my ( $arr ) = @_;
    
    if ( @$arr > 1 ) {
        # sub-divide into partitions
        my $mid = int(@$arr / 2);
        my @left = @{$arr}[0 .. $mid - 1];   # from 0 to mid
        my @right = @{$arr}[$mid .. $#$arr]; # from mid to end

        merge_sort(\@left);
        merge_sort(\@right);

        my ( $i, $j, $k ) = ( 0, 0, 0 ); # i is left, j is right, k is the original array

        # keep sorting until only 1 table is left with elements
        while ( $i < @left and $j < @right ) {
            if ( $left[$i] < $right[$j] ) {
                $arr->[$k] = $left[$i];
                $i++;
            } else {
                $arr->[$k] = $right[$j];
                $j++;
            }
            
            $k++;
        }
        
        # sort the remaining element(s)

        while ( $i < @left ) {
            $arr->[$k++] = $left[$i++];
        }

        while ( $j < @right ) {
            $arr->[$k++] = $right[$j++];
        }
    }    

    $arr;
}
    


my @arr = (54, 26, 93, 17, 77, 31, 44, 55, 20);
print "Original array: @arr\n";
print "Sorted Array:   @{ merge_sort(\@arr) }\n";
