#!/usr/bin/env ruby
H=6
W=4
A=(H*2+1).times.map{[nil]*(W*2+1)}
D=[[1,0],[0,1],[-1,0],[0,-1]]
def dfs(d,x,y)
	return 1 if x==2*W&&y==2*H
	r=0
	[d,(d+1)%4].each{|d0|
		next if x+D[d0][0]<0||2*W<x+D[d0][0] || y+D[d0][1]<0||2*H<y+D[d0][1] || A[y+D[d0][1]][x+D[d0][0]]
		A[y+D[d0][1]][x+D[d0][0]]=1
		r+=dfs(d0,x+D[d0][0]*2,y+D[d0][1]*2)
		A[y+D[d0][1]][x+D[d0][0]]=nil
	}
	r
end

p dfs(0,0,0)