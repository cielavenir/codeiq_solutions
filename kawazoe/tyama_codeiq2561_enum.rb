#!/usr/bin/ruby
N=gets.to_i
A=[N/2,N-N/2].map{|n|
	[*1..4].repeated_permutation(n).each_with_object(Hash.new(0)){|a,h|
		h[a.reduce(:+)%9]+=1
	}
}
r=0
A[0].each{|k0,v0|A[1].each{|k1,v1|r+=v0*v1 if (k0+k1)%9==0}}
p r