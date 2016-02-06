#!/usr/bin/env crystal
T=[
	[[2,2]],
	[[3],[3]],
]

$memo={} of Array(Int32) => Int64
def dfs2(m,x,y)
	if x==0 && y==m.size
		#m.each{|e|p e}
		#puts
		return 1
	end
	m0=m.flatten
	if $memo.has_key?(m0)
		return $memo[m0]
	end
	if x==m[y].size
		return dfs2(m,0,y+1)
	end
	if m[y][x]!=0
		return dfs2(m,x+1,y)
	end
	r=0_i64
	T.each{|e|
		if e.size.times.all?{|y0|e[y0].size.times.all?{|x0|
			y+y0<m.size && x+x0<m[y+y0].size && m[y+y0][x+x0]==0
		}}
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=e[y0][x0]}}
			r+=dfs2(m,x+1,y)
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=0}}
		end
	}
	$memo[m0]=r
end
def dfs(m)
	$memo.clear
	dfs2(m,0,0)
end

#h,w=gets.not_nil!.split(',').map(&.to_i)
#m=h.times.map{[0]*w}.to_a
h=7
w=10
m=[
	[0,0,0,0,0,0,0,1,1,0],
	[0,0,0,0,0,0,1,1,0,0],
	[0,0,0,0,0,1,1,0,0,0],
	[0,0,0,1,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0],
]
p dfs(m) # 1なら良い

# 答え：4
# (と思われます)