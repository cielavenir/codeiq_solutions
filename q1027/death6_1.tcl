for {set i 2} {$i < 997} {incr i} {
	for {set j 2} {$i%$j} {incr j} {}
	if {$i==$j} {
		puts -nonewline $i
		puts -nonewline ":"
	}
}
puts 997