#!/usr/bin/ruby
require 'prime'
N=10000
C=500
A=Prime.each(N).to_a
p (1..100000).bsearch{|lim|
	n=c=0
	A.each{|e|
		if n+e>lim
			c+=1
			n=0
		end
		n+=e
	}
	c+=1 if n>0
	c<=C
}
