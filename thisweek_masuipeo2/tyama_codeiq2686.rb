#!/usr/bin/ruby
def fact(n) (1..n).reduce(1,:*) end
def comb(n,k)
	r=1
	k.times{|i|r=r*(n-i)/(i+1)}
	r
end
m,n=gets.split(',').map(&:to_i)
p m==0 ? 0 : 0.step(n,m).reduce(0){|s,i|
	s+comb(n,i)*fact(i)/fact(i/m)**m
}