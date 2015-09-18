#!/usr/bin/rexx
numeric digits 20
do while 1
	n=linein()
	if n=="" then leave
	if n==0 then leave
	r=0
	i=2
	do while 1
		x=n-i*(i-1)%2
		if x<=0 then leave
		if x//i==0 then do
			r=r+x%i
		end
		i=i+1
	end
	say r
end