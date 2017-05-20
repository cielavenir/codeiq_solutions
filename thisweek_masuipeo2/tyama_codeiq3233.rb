#!/usr/bin/env ruby
$memo={}
def dfs(m,n)
	return n==0 ? 1 : 0 if m==0
	$memo[[m,n]]||=(1..[n,9].min).reduce(0){|s,i|s+dfs(m-1,n-i)}
end
p dfs(*gets.split.map(&:to_i))
