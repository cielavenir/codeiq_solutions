#!/usr/bin/env ruby
D=[[0,1],[1,0],[0,-1],[-1,0]]
$memo={}
def dfs(x,y,d,n)
	if (x==W&&y==H) && n==0
		return 1
	end
	if (x==W&&y==H) || n==0 || (W-x)+(H-y)>n
		return 0
	end
	$memo[[x,y,d,n]]||=->{
		r=0
		[1,3].each{|i|
			r+=dfs(x,y,(d+i)%4,n-1)
		}
		nx=x+D[d][0]
		ny=y+D[d][1]
		if 1<=nx&&nx<=W && 1<=ny&&ny<=H
			r+=dfs(nx,ny,d,n-1)
		end
		r
	}.()
end
W,H,n=gets.split.map &:to_i
p dfs(1,1,0,n)+dfs(1,1,1,n)+dfs(1,1,2,n)+dfs(1,1,3,n)