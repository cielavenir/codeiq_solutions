#!/usr/bin/env ruby
H,W=gets.split(',').map(&:to_i)
A=(H*2+1).times.map{[nil]*(W*2+1)}
D=[[1,0],[0,1],[-1,0],[0,-1]]
def dfs(x,y)
	return 0 if x==0&&y==0
	r=-1
	4.times{|d0|
		next if x+D[d0][0]<0||2*W<x+D[d0][0] || y+D[d0][1]<0||2*H<y+D[d0][1] || A[y+D[d0][1]][x+D[d0][0]]
		A[y+D[d0][1]][x+D[d0][0]]=1
		z=dfs(x+D[d0][0]*2,y+D[d0][1]*2)
		r=[z+1,r].max if z>=0
		A[y+D[d0][1]][x+D[d0][0]]=nil
	}
	r
end

x=y=0
r=-1
4.times{|d0|
	next if x+D[d0][0]<0||2*W<x+D[d0][0] || y+D[d0][1]<0||2*H<y+D[d0][1] || A[y+D[d0][1]][x+D[d0][0]]
	A[y+D[d0][1]][x+D[d0][0]]=1
	z=dfs(x+D[d0][0]*2,y+D[d0][1]*2)
	r=[z+1,r].max if z>=0
	A[y+D[d0][1]][x+D[d0][0]]=nil
}
p r