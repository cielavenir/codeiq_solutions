#!/usr/bin/ruby
require 'prime'
N=50
p Prime.each(N).reduce(1){|s,n|
	i=N
	p=0
	while i>0
		p+=i/=n
	end
	s*(2*p+1)
}+1>>1
