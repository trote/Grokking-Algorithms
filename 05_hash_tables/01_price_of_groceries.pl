#!/usr/bin/perl -w

use warnings;
use strict;

use Data::Dumper;

my %book;
# an apple costs 67 cents
$book{"apple"} = 0.67;
# milk costs $1.49
$book{"milk"} = 1.49;
$book{"avocado"} = 1.49;
print Dumper \%book;
