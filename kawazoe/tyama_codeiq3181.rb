#!/usr/bin/env ruby
#cf: 1382 mod
def pow(x,y,m)
	z = 1
	while y!=0
		z=z*x%m if y&1!=0
		x=x*x%m
		y>>=1
	end
	z
end

require 'prime'
M=1000003
N=gets.to_i
p Prime.each(N).reduce(1){|s,n|
	i=N
	p=0
	while i>0
		p+=i/=n
	end
	s*(n-1)*pow(n,p-1,M)%M
}
