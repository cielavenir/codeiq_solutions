#!/usr/bin/env ruby
$memo={}
def dfs(n) n<0 ? 0 : n==0 ? 1 : $memo[n]||=(2..5).reduce(0){|s,e|s+dfs(n-e)} end
def solve(n) n<=1 ? 0 : (n%2..2).reduce(0){|s,e|s+dfs(n/2-e)} end

if __FILE__==$0
	N=gets.to_i
	i=2
	r=0
	while i*i<=N
		if N%i==0
			r+=solve(i)
			r+=solve(N/i) if i*i!=N
		end
		i+=1
	end
	p r
end