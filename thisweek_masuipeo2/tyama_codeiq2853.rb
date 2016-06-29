#!/usr/bin/ruby
$memo={}
def dfs(n)
	n==1 ? 0 : $memo[n]||=1+dfs(n-1)*(2..n-1).map{|e|dfs(e)}.reduce(1,:+)
end
p dfs(gets.to_i)