#!/usr/bin/ruby
T=[
	[[1]],
	[[4,4],[4,4]],
	[[8,8,8,8],[8,8,8,8]],
	[[16,16,16,16],[16,16,16,16],[16,16,16,16],[16,16,16,16]],
]

$memo={}
def dfs(m,x,y)
	if x==0 && y==m.size
		return 1
	end
	if $memo.has_key?(m)
		return $memo[m]
	end
	if x==m[y].size
		return dfs(m,0,y+1)
	end
	if m[y][x]!=0
		return dfs(m,x+1,y)
	end
	r=0
	T.each{|e|
		if e.size.times.all?{|y0|e[y0].size.times.all?{|x0|
			y+y0<m.size && x+x0<m[y+y0].size && m[y+y0][x+x0]==0
		}}
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=1}} # e[y0][x0]}}
			r+=dfs(m,x+1,y)
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=0}}
		end
	}
	$memo[m]=r
end

w,h=gets.split(',').map(&:to_i)
m=h.times.map{[0]*w}.to_a
p dfs(m,0,0)