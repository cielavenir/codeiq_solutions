#!/usr/bin/env lua
while true do
	n=io.read("*n")
	if not n then
		break
	end
	if n==0 then
		break
	end
	r=0
	i=2
	while 1 do
		x=n-math.floor(i*(i-1)/2)
		if x<i then
			break
		end
		if x%i==0 then
			r=r+math.floor(x/i)
		end
		i=i+1
	end
	print(r)
end