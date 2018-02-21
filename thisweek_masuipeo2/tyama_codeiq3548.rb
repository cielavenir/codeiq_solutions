#!/usr/bin/ruby
$memo={}
def dfs(n,k)
	return 1 if n<1
	$memo[[n,k]]||=(1..[n,k].min).reduce(0){|s,i|s+(k-i+1)*dfs(n-i,i-1)}
end
n=gets.to_i
p (1..n).reduce(0){|s,i|s+dfs(n-i,i-1)}
