#!/usr/bin/perl6

my $starting=5;
my $bse=10;
loop (;my $s=get();) {
	my $n=$s.Int;
	$n+=$starting-2;
	my $digits=1;
	my $expbase=1;
	my $x;
	loop (;($x=$digits*$expbase*($bse-1)) <= $n;) {
		$n-=$x;
		$digits++;
		$expbase*=$bse;
	}
	my $num=$expbase + ($n div $digits);
	my $d=$digits-1-($n mod $digits);
	loop (;$d--;) {
		$num=$num div $bse;
	}
	say $num mod $bse;
}
