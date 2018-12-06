#!/usr/bin/gst
starting:=5.
bse:=10.
[stdin atEnd]whileFalse:[
	n:=stdin nextLine asInteger.
	n:=n+starting-2.
	digits:=1.
	expbase:=1.
	x:=bse-1.
	[x<(n+1)]whileTrue:[
		n:=n-x.
		digits:=digits+1.
		expbase:=expbase*bse.
		x:=digits*expbase*(bse-1).
	].
	num:=expbase+(n//digits).
	d:=digits-1-(n\\digits).
	[d>0]whileTrue:[
		num:=num//bse.
		d:=d-1.
	].
	(num\\bse) printNl.
].