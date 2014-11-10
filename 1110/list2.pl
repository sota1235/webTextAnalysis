#!/usr/bin/perl

@lis = ("apple", "orange", "melon");

print "for loop\n";

for($i=0;$i<@lis;$i++){
  print "$lis[$i]\n";
}

print "\n";

print "while loop\n";

$i=0;

while($i<@lis) {
  print "$lis[$i]\n";
  $i++;
}
