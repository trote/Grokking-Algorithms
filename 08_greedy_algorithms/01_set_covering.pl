#!/usr/bin/perl -w

use warnings;
use strict;

# You pass an array in, and it gets converted to a set.
my @states_needed = qw(mt wa or id nv ut ca az);

my %stations;
$stations{kone}   = [ qw(id nv ut) ];
$stations{ktwo}   = [ qw(wa id mt) ];
$stations{kthree} = [ qw(or nv ca) ];
$stations{kfour}  = [ qw(nv ut) ];
$stations{kfive}  = [ qw(ca az) ];

my @final_stations;

while ( @states_needed ) {
    my $best_station;
    my @states_covered;

    while ( my ($station, $states) = each (%stations) ) {
        my %union;
        my %isect;
        for my $e ( @states_needed, @$states ) { $union{$e}++ && $isect{$e}++ }
        my @covered = keys %isect;
        if ( @covered > @states_covered ) {
            $best_station = $station;
            @states_covered = @covered;
        }
    }

    my %count;
    my @diff;
    for my $e ( @states_needed, @states_covered ) { $count{$e}++ }
    for my $e ( keys %count ) {
        push @diff, $e if $count{$e} != 2;
    }
    @states_needed = @diff;
    push @final_stations, $best_station;
}

print "@final_stations\n";
