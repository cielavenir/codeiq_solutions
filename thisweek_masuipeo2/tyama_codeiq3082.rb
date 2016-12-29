#!/usr/bin/env ruby
def comb(n,k)
	return 0 if k<0||n<k
	r=1
	k=n-k if k>n/2
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end
N,A,B=gets.split.map(&:to_i)
p comb(N-2,A-2)*comb(A-2,B-2)
