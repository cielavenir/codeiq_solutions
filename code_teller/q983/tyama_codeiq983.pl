#!/usr/bin/perl
use strict;
use warnings;
#use bigint;
use feature qw(say);

my $starting=5;
my $bse=10;
while(<>){
	my $n=$_^0;
	$n+=$starting-2;
	my $digits=1;
	my $expbase=1;
	my $x;
	while(($x=$digits*$expbase*($bse-1))<=$n){
		$n-=$x;
		$digits++;
		$expbase*=$bse;
	}
	my $num=$expbase+$n/$digits;
	my $d=$digits-1-$n%$digits;
	for(;$d--;){
		$num/=$bse;
	}
	say $num%$bse;
}