#!/usr/bin/ruby
#coding:utf-8
D=10
F=(1..D).reduce(:*)

def decode(s)
	a,d=s.split('.')
	d||=''
	r=F
	a.to_i*F+d.each_byte.with_index.reduce(0){|s,(b,i)|
		r/=D-i
		s+(b-48)*r
	}
end
def encode(n0)
	d,n=n0.divmod F
	s=''
	if n>0
		(2..D).each{|i|
			s<<(n%i).to_s
			n/=i
		}
		s<<'.'
	end
	s.reverse!
	true while s.chomp!('0')
	d.to_s+s
end

r=[]
$<.each{|_|
	id,expr,ans=_.split
	r<<id if encode(expr.split('+').map{|s|
		decode(s)
	}.reduce(:+))!=ans
}
puts r*',' # 41,42,135,623,730,950