#!/usr/bin/ruby
p Enumerator.new{|y|
	a=b=1
	y<<a
	y<<b
	while b<=500
		a,b=b,a+b
		y<<b
	end
}.to_a.size # 15