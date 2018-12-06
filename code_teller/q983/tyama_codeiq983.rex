#!/usr/bin/rexx
numeric digits 20
starting=5
bse=10
do while 1
	n=linein()
	if n=="" then leave
	n=n+starting-2
	digits=1
	expbase=1
	x=bse-1
	do while x<=n
		n=n-x
		digits=digits+1
		expbase=expbase*bse
		x=digits*expbase*(bse-1)
	end
	num=expbase+n%digits
	d=digits-1-n//digits
	do while d>0
		num=num%bse
		d=d-1
	end
	say num//bse
end