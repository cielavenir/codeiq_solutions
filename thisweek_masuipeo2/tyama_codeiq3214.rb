#!/usr/bin/ruby
K=3
raise if K>5 # 会費6000円以上は不可
$memo={}
def dfs(d,c)
	return 0 if c<0
	return 1 if d==0
	$memo[[d,c]]||=[K,K-5].reduce(0){|s,e|s+dfs(d-1,c+e)}
end
p dfs(gets.to_i,0)
