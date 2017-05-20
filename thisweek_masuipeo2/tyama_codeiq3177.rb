#!/usr/bin/env ruby
$memo={}
def dfs(m,n)
	return 0 if m<0
	return 1 if m==0
	$memo[m]||=(1..n).reduce(0){|s,i|s+dfs(m-i,n)}
end
m,n=gets.split.map(&:to_i)
p dfs(m,n)
