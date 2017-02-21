#!/usr/bin/env ruby
def rec(d,m,n,a,b)
	return 1 if b[-1]==n
	r=0
	if d<=m
		r+=rec(d+1,m,n,a+[d],b)
	end
	if !a.empty?
		r+=rec(d,m,n,a[0...-1],b+[a[-1]])
	end
	r
end
m,n=gets.split.map(&:to_i)
p rec(1,m,n,[],[-1])
