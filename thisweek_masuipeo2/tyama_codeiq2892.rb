#!/usr/bin/ruby
def comb(n,k)
	return 0 if k<0||n<k
	r=1
	k=n-k if k>n/2
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end

A,B,C=gets.split(',').map(&:to_i)
p (0..C-1).reduce(0){|s,i|s+comb(A-1,i)*comb(B-1,C-1-i)*comb(C-1,i)}