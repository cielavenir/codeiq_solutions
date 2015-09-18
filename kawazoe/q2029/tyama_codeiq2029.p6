#!/usr/bin/perl6

while my $n=get() {
	if $n==0 {last;}
	my $r=0;
	loop (my $i=1;;) {
		$n-=$i;
		$i++;
		if $n < 0 {last;}
		if $n%$i==0 {
			$r+=$n/$i;
		}
	}
	say $r;
}