#!/usr/bin/ruby
#coding:utf-8

F=[1,2]

class Array
	def geometric?
		a=self.each_cons(2).map{|x,y|Rational(x,y)}
		a.all?{|e|e==a[0]}
	end
	def arithmetic?
		a=self.each_cons(2).map{|x,y|y-x}
		a.all?{|e|e==a[0]}
	end
	def fibo?
		F.bsearch{|e|e>=self[0]}==self[0] &&
		self.each_cons(3).all?{|x,y,z|x+y==z}
	end
end

2.upto(100){|i|F<<F[i-1]+F[i-2]}

puts $<.map{|e|
	a=e.split.map(&:to_i)
	r=''
	r<<'G' if a.geometric?
	r<<'A' if a.arithmetic?
	r<<'F' if a.fibo?
	r.empty? ? 'x' : r
}