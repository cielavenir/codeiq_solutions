#!/usr/bin/env ruby
D=[[1,0],[0,1],[-1,0],[0,-1]]
def dfs(s,d,x,y)
	return 0 if s[[x,y]]
	return 1 if d==0
	r=0
	s[[x,y]]=1
	D.each{|x0,y0|r+=dfs(s,d-1,x+x0,y+y0)}
	s[[x,y]]=nil
	r
end
p dfs({},12,0,0)