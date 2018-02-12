#!/usr/bin/ruby
$memo={}
def dfs(n)
	[n/2-M,n*2/3-N].each{|e|
		e>0&&!$memo[e]&&($memo[e]=1)&&dfs(e)
	}
end
n,M,N=gets.split.map &:to_i
$memo[n]=1
dfs n
p (1..1/0.0).find{|e|!$memo[e]}
#面食らいましたが実はやるだけなんですよね…yhpgのお陰。
