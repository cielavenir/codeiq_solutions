#!/usr/bin/env lua
starting=5
bse=10
while true do
	n=io.read("*n")
	if not n then
		break
	end
	n=n+starting-2
	digits=1
	expbase=1
	x=bse-1
	while x<=n do
		n=n-x
		digits=digits+1
		expbase=expbase*bse
		x=digits*expbase*(bse-1)
	end
	num=expbase+math.floor(n/digits)
	d=digits-1-n%digits
	while d>0 do
		num=math.floor(num/bse)
		d=d-1
	end
	print(num%bse)
end