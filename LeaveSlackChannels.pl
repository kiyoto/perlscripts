#!/usr/bin/perl -w

use strict;
use warnings;

use WebService::Slack::WebApi;
use Data::Dumper;
use List::Util 'any';

my $slack = WebService::Slack::WebApi->new(token => '<TOKEN>');

my $conversations = $slack->conversations->list;
my $own_slack_id = '<MY ID>';
my $members;
my $name;

while (1) {
    for my $channel (@{$conversations->{channels}}) {
        $members = $channel->{members};
        if ( any { /$own_slack_id/ } @$members ) {
            $name = $channel->{name};
            if ( 
                # YOUR REGEX HERE
            ) { 
                print $name."\n";
                my $response = $slack->conversations->leave(channel => $channel->{id});
                print (Dumper $response);
            }
        } else {

        }
    }
    my $next_cursor = $conversations->{response_metadata}->{next_cursor};
    
    print (Dumper $conversations->{response_metadata});
    
    if ( $next_cursor =~ /^$/ ) { exit -1; }
    
    $conversations = $slack->conversations->list(cursor => $next_cursor );
}