#!/usr/bin/perl -w

use warnings;
use strict;

sub person_is_seller {
    my $name = shift;

    substr($name, -1) eq 'm';
}

my %graph;
$graph{"you"} = ["alice", "bob", "claire"];
$graph{"bob"} = ["anuj", "peggy"];
$graph{"alice"} = ["peggy"];
$graph{"claire"} = ["thom", "jonny"];
$graph{"anuj"} = [];
$graph{"peggy"} = [];
$graph{"thom"} = [];
$graph{"jonny"} = [];

sub search {
    my $name = shift;
    
    my @search_queue;
    push @search_queue, @{$graph{$name}};
    # This array is how you keep track of which people you've searched before.
    my @searched;
    while ( @search_queue ) {
        my $person = shift @search_queue;
        # Only search this person if you haven't already searched them.
        unless ( grep { $_ eq $person } @searched ) {
            if ( person_is_seller $person ) {
                print "$person is a mango seller!\n";
                return 1;
            } else {
                push @search_queue, @{$graph{$person}};
                # Marks this person as searched
                push @searched, $person;
            }
        }
    }    
    return 0;
}
    
search "you";
