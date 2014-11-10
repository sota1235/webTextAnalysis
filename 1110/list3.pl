#!/usr/bin/perl

@lis = (["apple", "orange", "melon"], ["car", "bus", "train"]);

for($i=0;$i<@lis;$i++) {
  for($j=0;$j<@{$lis[$i]};$j++) {
    print "$lis[$i][$j]\n";
  }
}
