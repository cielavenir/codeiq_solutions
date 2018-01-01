#!/usr/bin/ruby
$memo={}
def dfs(n,q)
	return q if n==0
	$memo[[n,q]]||=(1..[n,3].min).reduce(0){|s,i|s+dfs(n-i,q^1)}
end
p dfs(gets.to_i,0)
