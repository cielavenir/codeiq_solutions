set x {97 65 12354 12450 12450 12354 65 97}
for {set i 0} {$i < 26} {incr i} {for {set j 0} {$j < 8} {incr j} {puts -nonewline [format %c [expr [lindex $x $j] + $i]]}}