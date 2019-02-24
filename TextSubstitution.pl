#!/usr/bin/perl -w

use warnings;
use strict;
use Data::Dumper;
use JSON;
use DBI;
use utf8;
use Encode qw/decode_utf8/;


my $dbh = DBI->connect("dbi:SQLite:dbname=/Users/kiyoto/Library/KeyboardServices/TextReplacements.db","","");

my $sth = $dbh->prepare("SELECT * FROM ZTEXTREPLACEMENTENTRY");
my $row;
my $output = {};

$sth->execute();

while ( $row = $sth->fetch ) {
    $output->{$row->[7]} = decode_utf8($row->[6]);
}

print encode_json($output);