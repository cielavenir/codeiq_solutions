#!/usr/bin/ruby
1.step(10000){|n|
	n_orig=n
	n-=1
	x=2
	r=1
	while n>0
		r+=x if n&2>0
		n/=4
		x*=4
	end
	puts sprintf('%08b',n_orig-1)+' '+r.to_s
}