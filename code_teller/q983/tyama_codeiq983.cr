#!/usr/bin/env crystal
starting=5_i64
base=10
while (s=gets)!=nil
	n=s.not_nil!.to_i64+starting-2
	digits=1_i64
	expbase=1_i64
	while (x=digits*expbase*(base-1))<=n
		digits+=1
		expbase*=base
		n-=x
	end
	num=expbase+n/digits
	d=digits-1-n%digits
	d.times{num/=base}
	puts num%base
end
