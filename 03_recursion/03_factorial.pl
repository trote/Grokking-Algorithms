#!/usr/bin/perl -w

use warnings;
use strict;

sub fact($);

sub fact($) {
    my $x = shift;
    
    return 1 if $x == 1;
    $x * fact($x - 1);
}

print fact 5;
