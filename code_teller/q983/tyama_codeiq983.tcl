#!/usr/bin/tclsh
set starting 5
set bse 10
while 1 {
	set s [gets stdin]
	if {$s==""} {break}
	set n [expr $s + $starting - 2]
	set digits 1
	set expbase 1
	set x [expr $bse - 1]
	while {$x<=$n} {
		set n [expr $n - $x]
		set digits [expr $digits + 1]
		set expbase [expr $expbase * $bse]
		set x [expr $digits * $expbase * ($bse - 1)]
	}
	set num [expr $expbase + $n / $digits]
	set d [expr $digits - 1 - $n % $digits]
	while {$d>0} {
		set num [expr $num / $bse]
		set d [expr $d - 1]
	}
	puts [expr $num % $bse]
}