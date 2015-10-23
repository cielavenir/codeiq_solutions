#!/usr/bin/ruby
def egcd(x,y)
	return [x,1,0] if y==0
	g,a,b=egcd(y,x%y)
	[g,b,a-x/y*b]
end
def mod_inverse(n,m)
	g,a,b=egcd(n,m)
	raise if g!=1
	a%m
end

class Integer
	def pow_binary_mod(y,m)
		x = self
		z = 1
		while y!=0
			z=z*x%m if y&1!=0
			x=x*x%m
			y>>=1
		end
		z
	end
end

M=1000000
REV3=mod_inverse(3,M)
n=gets.to_i
p (16.pow_binary_mod(n,M)-1)*2*REV3%M