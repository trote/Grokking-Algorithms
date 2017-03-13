#!/usr/bin/perl -w

use warnings;
use strict;

use Data::Dumper;

my %voted;

sub check_voter {
    my $name = shift;
    
    if ( $voted{$name} ) {
        print "kick them out!\n";
    } else {
        $voted{$name} = 1;
        print "let them vote!\n";
    }
}

check_voter "tom";
check_voter "mike";
check_voter "mike";
