#!/usr/bin/perl -w

use List::Util qw /max/;

my $input = do { local $/; <> };
my @cookies = split /;\s*/, $input;
my @key_lengths = map { index $_, "=" } @cookies;
my $max_key_length = max @key_lengths;

for my $cookie ( @cookies ) {
    my ($k, $v) = split '=', $cookie, 2;
    print $k . (' ' x ($max_key_length-length($k)));
    print "=$v\n";
}