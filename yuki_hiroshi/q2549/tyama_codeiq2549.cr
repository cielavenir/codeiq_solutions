#!/usr/bin/ruby
require "big_int"

def mul(a1,b1,c1,d1,a2,b2,c2,d2)
	t=a1*a2
	u=b1*c2
	a0=t+u
	t=a1*b2
	u=b1*d2
	b0=t+u
	t=c1*a2
	u=d1*c2
	c0=t+u
	t=c1*b2
	u=d1*d2
	d0=t+u
	[a0,b0,c0,d0]
end

a1=BigInt.new(1)
b1=BigInt.new(0)
c1=BigInt.new(0)
d1=BigInt.new(1)
a2=BigInt.new(1)
b2=BigInt.new(1)
c2=BigInt.new(1)
d2=BigInt.new(0)
s=gets
if s
	n=s.to_i
	n=(n+3)/2*2
	while n>0
		a1,b1,c1,d1=mul(a1,b1,c1,d1,a2,b2,c2,d2) if n%2>0
		a2,b2,c2,d2=mul(a2,b2,c2,d2,a2,b2,c2,d2)
		n>>=1
	end
	p c1-1
end