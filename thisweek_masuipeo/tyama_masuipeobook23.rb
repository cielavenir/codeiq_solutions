#!/usr/bin/env ruby
$memo={}
def dfs(n,d)
	return 0 if n==0
	return 1 if d==0
	$memo[[n,d]]||=dfs(n-1,d-1)+dfs(n+1,d-1)
end
p dfs(10,24)