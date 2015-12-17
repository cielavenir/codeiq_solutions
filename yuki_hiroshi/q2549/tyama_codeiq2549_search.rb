#!/usr/bin/ruby
$memo={}
def dfs(cur,d,c)
	return 0 if c<0||cur==4
	return 1 if cur==0
	#due to memorization and recur depth, dfs order cannot be changed.
	$memo[[cur,d,c]]||=dfs(cur-d,-d,c-1)+dfs(cur+d,d,c)
end
n=gets.to_i
p dfs(2,1,n)