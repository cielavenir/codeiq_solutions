#!/usr/bin/tclsh
while 1 {
	set s [gets stdin]
	if {$s==""} {break}
	set n [expr $s]
	if {$n==0} {break}
	set r 0
	set i 1
	while 1 {
		set n [expr $n - $i]
		incr i
		if {$n<$i} {break}
		if {[expr $n % $i] == 0} {
			set r [expr $r + $n / $i]
		}
	}
	puts $r
}