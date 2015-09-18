#!/usr/bin/perl
use strict;
use warnings;
#use bigint;
use feature qw(say);

while(<>){
	my $n=int($_);
	if($n==0){last;}
	my $r=0;
	for(my $i=2;;$i++){
		my $x=$n-$i*($i-1)/2;
		if($x<$i){last;}
		if($x%$i==0){
			$r+=$x/$i;
		}
	}
	say $r;
}