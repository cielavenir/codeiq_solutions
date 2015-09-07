#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

my $N=10;
my @F=(3,5,7,11,13,17,19,23,29,31);
sub solve{
	my $ma=shift;
	my $i=1;
	my $j;
	my $n;
	my $r=0;
	for(;$i<1<<$N;$i++){
		my $n=0;
		my $divisor=1;
		for($n=$j=0;$j<$N;$j++){if($i&(1<<$j)){$n++,$divisor*=$F[$j];}}
		my $items=$ma/$divisor^0;
		$r+=(($n%2*2-1)*($items*($items+1)/2)*$divisor);
	}
	return $r;
}
say solve(100000);
say solve(1000000000);