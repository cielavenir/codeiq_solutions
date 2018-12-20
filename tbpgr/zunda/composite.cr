#!/usr/bin/env crystal
def isqrt(n)
	return 0 if n<=0
	return 1 if n<4 # 1
	x,y=0,n
	while x!=y&&x+1!=y
		x,y=y,(n/y+y)/2
	end
	x
end
p (4..1/0.0).each.select{|i|(2..isqrt(i)).any?{|j|i%j<1}}.first(gets.not_nil!.to_i).sum
