#!/usr/bin/env crystal
#coding:utf-8

#答え：610通り

N=20
S=N*2*3

T=[[
	[1,1],
	[1,1],
	[1,1],
],[
	[2,2,2],
	[2,2,2],
]]

def dfs(m,x,y,d)
	if x==0 && y==m.size
		#raise if d!=0
		return 1
	end
	if x==m[y].size
		return dfs(m,0,y+1,d)
	end
	if m[y][x]!=0
		return dfs(m,x+1,y,d)
	end
	r=0_i64
	T.each{|e|
		if e.size.times.all?{|y0|e[y0].size.times.all?{|x0|
			y+y0<m.size && x+x0<m[y+y0].size && m[y+y0][x+x0]==0
		}}
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=e[y0][x0]}}
			r+=dfs(m,x+1,y,d-1)
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=0}}
		end
	}
	r
end
	
def solve(h)
	m=h.times.map{[0]*(S / h)}.to_a
	dfs(m,0,0,N)
end

r=0
i=1
while i*i<=S
	if S%i==0
		r+=solve(i)
		r+=solve(S / i) if i*i<S
	end
	i+=1
end
p r