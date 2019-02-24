sub choose_random {
    my $arr = shift;
    my $idx = int(rand scalar @$arr);
    $arr->[$idx];
}
