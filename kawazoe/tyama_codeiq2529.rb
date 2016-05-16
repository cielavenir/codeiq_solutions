#!/usr/bin/env ruby
require 'prime'

def f(a,b,c,d)
	x=Math.atan2(Math.sin(a)*Math.sin(c)*Math.sin(b+c+d),Math.sin(d)*Math.sin(a+b)+Math.sin(a)*Math.sin(c)*Math.cos(b+c+d))
	((x/Math::PI*180+1e-12)*10**6).to_i
end
def g(n)
	(n-1).prime_division.reduce(1){|s,(n,p)|s*(n**(p+1)-1)/(n-1)}-1 # (n-1).divisorsum-1
end
def h(m)
	it=Enumerator.new{|y|
		(0..9).each{|e|y<<e}
		st=1
		loop{
			(st...st*10).each{|i|y<<(i.to_s+i.to_s.reverse).to_i}
			(st...st*10).each{|i|
				(0..9).each{|e|y<<(i.to_s+e.to_s+i.to_s.reverse).to_i}
			}
			st*=10
		}
	}
	r=0
	while (n=it.next)<=m
		r+=n
	end
	r
end

a,b,c,d=gets.split.map{|e|e.to_f/180*Math::PI}
p h(g(f(a,b,c,d)))