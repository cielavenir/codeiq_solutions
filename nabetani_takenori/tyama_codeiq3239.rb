#!/usr/bin/env ruby
N=gets.to_i
A=[1,1]
2.upto(99){|i|A<<A[i-1]+A[i-2]}
A.reverse!

#upper
idx=(0...A.size).bsearch{|i|A[i]<=N}
s=0
print (idx...A.size).map{|i|
	if s+A[i]>N
		0
	else
		s+=A[i]
		1
	end
}*''+','

#lower
s=0
idx=(A.size-1).downto(0).find{|i|
	s+=A[i]
	s>=N
}
puts (idx...A.size).map{|i|
	if s-A[i]<N
		1
	else
		s-=A[i]
		0
	end
}*''
