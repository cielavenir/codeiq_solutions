#!/usr/bin/ruby
def decompose(a)
	r=Rational(a.pop)
	r=a.pop+1/r while !a.empty?
	r
end
def compose(n)
	return n.to_i.to_s if n.denominator==1
	r=[]
	while n!=n.to_i
		r<<n.to_i
		n=1/(n-n.to_i)
	end
	r<<n.to_i
	'[%d;%s]'%[r.shift,r*',']
end
		
puts compose gets.split('+').map{|e|decompose(e.scan(/\d+/).map(&:to_i))}.reduce(:+)