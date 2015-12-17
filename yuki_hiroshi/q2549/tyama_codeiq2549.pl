#!/usr/bin/perl
use strict;
use warnings;
use bigint;

sub mul{
	my ($a1,$b1,$c1,$d1,$a2,$b2,$c2,$d2)=@_;
	my $t=$a1*$a2;
	my $u=$b1*$c2;
	my $a0=$t+$u;
	$t=$a1*$b2;
	$u=$b1*$d2;
	my $b0=$t+$u;
	$t=$c1*$a2;
	$u=$d1*$c2;
	my $c0=$t+$u;
	$t=$c1*$b2;
	$u=$d1*$d2;
	my $d0=$t+$u;
	return ($a0,$b0,$c0,$d0);
}

my $a1=1;
my $b1=0;
my $c1=0;
my $d1=1;
my $a2=1;
my $b2=1;
my $c2=1;
my $d2=0;
my $n=int(<>);
$n=($n+3)>>1<<1;
for(;$n;$n>>=1){
	($a1,$b1,$c1,$d1)=mul($a1,$b1,$c1,$d1,$a2,$b2,$c2,$d2) if($n&1);
	($a2,$b2,$c2,$d2)=mul($a2,$b2,$c2,$d2,$a2,$b2,$c2,$d2);
}
print $c1-1,$/