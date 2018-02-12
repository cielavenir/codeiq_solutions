#!/usr/bin/ruby
T=[6,2,5,5,4,5,6,3,7,6]
h={}
n=gets.to_i
r=0
while !h[n]
	h[n]=1
	n=n.to_s.bytes.map{|b|T[b-48]}.reduce(:*)
	r+=1
end
p r
