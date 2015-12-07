#!/usr/bin/env ruby
Pair=[[0,1],[0,3],[1,2],[2,5],[3,6],[5,8],[6,7],[7,8]]
$memo={}
def dfs(x)
	return 1 if x==0
	$memo[x]||=lambda{
		r=0
		Pair.each{|i,j|
			r+=dfs(x&~(1<<i | 1<<j)) if x[i]>0&&x[j]>0
		}
		(0...9).each{|i|
			r+=dfs(x&~(1<<i)) if x[i]>0
		}
		r
	}.call
end
p dfs(511)