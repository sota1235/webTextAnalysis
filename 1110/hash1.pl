#!/usr/bin/perl

%hash = ('apple' => 100,
  'orange' => 50,
  'melon'  => 1000);

print "apple=$hash{'apple'}\n";
print "orange=$hash{'orange'}\n";
print "melon=$hash{'melon'}\n";

$hash{'banana'} = 200;

print "banana=$hash{'banana'}\n";

@keys = keys %hash;
print "@keys\n";

delete $hash{'melon'};

@values = values %hash;
print "@values\n";
