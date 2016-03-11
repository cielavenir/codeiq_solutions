#!/usr/bin/env ruby
$memo={}
def dfs(n,m,limit)
	return 1 if n==0
	return 0 if n>m*(2*limit)/2
	$memo[[n,m,limit]]||=lambda{
		r=0
		1.upto([n,limit].min){|i|
			r+=dfs(n-i,m-1,i-1)
		}
		r
	}.call
end
n,m=gets.split(',').map(&:to_i)
p dfs(n,m,n)