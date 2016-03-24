#!/usr/bin/ruby
#coding:utf-8

#A094047
def fact(n) (1..n).reduce(1,:*) end
def comb(n,k)
	r=1
	k.times{|i|r=r*(n-i)/(i+1)}
	r
end

N=gets.to_i
p (-1)**N * 2 * fact(N-1) + fact(N) * N.times.reduce(0){|s,i|s+(-1)**i * fact(N-i-1) * comb(2*N-i-1,i)}