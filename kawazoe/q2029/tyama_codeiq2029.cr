#!/usr/bin/env crystal
while (s=gets)!=nil
	n=s.not_nil!.to_i64
	break if n==0
	r=0_i64
	i=2_i64
	while true
		x=n-i*(i-1)/2
		break if x<i
		r+=x/i if x%i==0
		i+=1
	end
	p r
end