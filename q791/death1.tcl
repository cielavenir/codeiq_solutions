#/usr/bin/tclsh
#lds
set x {108 100 115}
for {set i 0} {$i < 3} {incr i} {puts -nonewline [format %c [expr [lindex $x $j] - 32]]}