#!/usr/bin/perl
use List::Util qw(max);

@words = ("I", "can", "can");
@postags = ("N", "V", "ART", "AUX");

%bigram = (
  "BOS" => {"N" => 0.8,   "V" => 0,     "ART" => 0,   "AUX" => 0.2},
  "N"   => {"N" => 0.167, "V" => 0.667, "ART" => 0,   "AUX" => 0.167},
  "V"   => {"N" => 0,     "V" => 0.2,   "ART" => 0.4, "AUX" => 0},
  "ART" => {"N" => 1,     "V" => 0,     "ART" => 0,   "AUX" => 0},
  "AUX" => {"N" => 0.5,   "V" => 0.5,   "ART" => 0,   "AUX" => 0}
);
%dist = (
  "N"   => {"I" => 0.2, "can" => 0.2},
  "V"   => {"I" => 0,   "can" => 0.333},
  "ART" => {"I" => 0,   "can" => 0},
  "AUX" => {"I" => 0,   "can" => 1}
);

@prob = ([0,0,0,0], [0,0,0,0], [0,0,0,0]);

for($i=0;$i<@words;$i++) {
  for($j=0;$j<@postags;$j++) {
    if($i==0) {
      $prob[$i][$j] = $bigram{"BOS"}{$postags[$j]} * $dist{$postags[$j]}{$words[$i]};
    } else {
      my @tmp_prob;
      for($k=0;$k<@postags;$k++) {
        $tmp = $prob[$i-1][$k] * $bigram{$postags[$k]}{$postags[$j]} * $dist{$postags[$j]}{$words[$i]};
        push(@tmp_prob, $tmp);
      }
      $prob[$i][$j] = max @tmp_prob;
    }
  }
}

print max ($prob[2][0], $prob[2][1], $prob[2][2]);
