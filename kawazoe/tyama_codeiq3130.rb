#!/usr/bin/env ruby
class Integer
	#http://www001.upp.so-net.ne.jp/y_yutaka/labo/math_algo/math_algo.html
	def isqrt
		return 0 if self<=0
		s=1
		t=self
		while s<t
			s,t=s*2,t/2
		end
		begin
			s,t=(self/s+s)/2,s
		end while s<t
		t
	end
end

M=10**6
def mul(a,b)
	[(a[0]*b[0]+3*a[1]*b[1])%M,(a[1]*b[0]+b[1]*a[0])%M]
end
x=[2,1]
e=[1,0]
k=gets.to_i
while k>0
	e=mul(e,x) if k%2>0
	x=mul(x,x)
	k/=2
end
#p (e[0]+(3*e[1]**2).isqrt).to_i%M
# こちらの最終式は
# https://code.google.com/codejam/contest/dashboard?c=32016#s=a&a=2
# による
p (2*e[0]-1)%M

__END__
(Math.hypot(0.5,1+Math.sqrt(3)/2)**n)**2
Math.hypot(0.5,1+Math.sqrt(3)/2)**(n*2)
(2+Math.sqrt(3))**n
