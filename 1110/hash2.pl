#!/usr/bin/perl

%hash = ('apple' => {'small' => 50, 'large' => 200},
  'orange' => {'small' => 30, 'large' => 100},
  'melon'  => {'small' => 500, 'large' => 1500});

foreach $key (keys %hash) {
  print "$key small=$hash{$key}{'small'} large=$hash{$key}{'large'}\n";
}
