#!/usr/bin/gst
[stdin atEnd]whileFalse:[
	n:=stdin nextLine asInteger.
	(n>0)ifTrue:[
		r:=0.
		i:=2.
		x:=n-1.
		[x>=i]whileTrue:[
			x:=n - ((i*(i-1))//2).
			(x\\i==0)ifTrue:[
				r:=r+(x//i).
			].
			i:=i+1.
		].
		r printNl.
	].
].