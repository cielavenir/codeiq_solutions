#!/usr/bin/ruby
$memo={}
def dfs(n,d,c)
	return 0 if c==2
	return 1 if n==d
	$memo[[n,d,c]]||=(d>0 ? dfs(n-1,d-1,0) : 0)+dfs(n-1,d,c+1)
end
a,b=gets.split(',').map(&:to_i)
p dfs(a-2,b-2,0)