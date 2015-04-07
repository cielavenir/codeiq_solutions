#!/usr/bin/ruby
N=40
M=18
K=8

def fact(n)
	(1..n).reduce(1,:*)
end
def comb(n,k)
	fact(n)/fact(k)/fact(n-k)
end
p K.step(M).reduce(0){|s,i|s+comb(M,i)*comb(N-M,M-i)}.to_f/comb(N,M)