#!/usr/bin/env ruby
$memo={}
def dfs(m,n,x)
	return 1 if n==0
	return 0 if n==1
	$memo[[m,n,x]]||=->{
		r=0
		(2..[m,n,x].min).each{|i|
			r+=dfs(m,n-i,i)
		}
		r
	}.()
end
m,n=gets.split.map(&:to_i)
p dfs(m,n,n)
