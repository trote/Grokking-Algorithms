#!/usr/bin/perl -w

use warnings;
use strict;

use bigrat;
use List::Util qw(none);
use Data::Dumper;

# the graph
my %graph;
$graph{start}{a} = 6;
$graph{start}{b} = 2;

$graph{a}{fin} = 1;

$graph{b}{a} = 3;
$graph{b}{fin} = 5;

$graph{fin} = {};

# the costs table
my %costs;
$costs{a} = 6;
$costs{b} = 2;
$costs{fin} = inf;

# the parents table
my %parents;
$parents{a} = "start";
$parents{b} = "start";
$parents{fin} = undef;

my @processed;

sub find_lowest_cost_node($) {
    my $costs = shift;
    
    my $lowest_cost = inf;
    my $lowest_cost_node = undef;
    # Go through each node.
    for my $node (keys %$costs) {
        my $cost = $costs->{$node};
        # If it's the lowest cost so far and hasn't been processed yet...
        if ( $cost < $lowest_cost and none { $_ eq $node } @processed ) {
            # ... set it as the new lowest-cost node.
            $lowest_cost = $cost;
            $lowest_cost_node = $node;
        }
    }
    
    return $lowest_cost_node;
}

# Find the lowest-cost node that you haven't processed yet.
my $node = find_lowest_cost_node \%costs;
# If you've processed all the nodes, this while loop is done.
while ( $node ) {
    my $cost = $costs{$node};
    # Go through all the neighbors of this node.
    my $neighbors = $graph{$node};
    for my $n (keys %{ $neighbors }) {
        my $new_cost = $cost + $neighbors->{$n};
        # If it's cheaper to get to this neighbor by going through this node...
        if ( $costs{$n} > $new_cost ) {
            # ... update the cost for this node.
            $costs{$n} = $new_cost;
            # This node becomes the new parent for this neighbor.
            $parents{$n} = $node;
        }
    }
    
    # Mark the node as processed.
    push @processed, $node;
    # Find the next node to process, and loop.
    $node = find_lowest_cost_node \%costs;
}

print "Cost from the start to each node:\n";
print Dumper \%costs;
