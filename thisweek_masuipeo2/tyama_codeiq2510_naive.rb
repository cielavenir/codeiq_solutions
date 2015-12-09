#!/usr/bin/ruby
T={
	1=>{
		mat: [[1]],
		pred: ->(h){true},
	},
	2=>{
		mat: [[2],[2]],
		pred: ->(h){h==0||h==1||h==3},
	},
	3=>{
		mat: [[3],[3],[3]],
		pred: ->(h){h==0},
	},
	4=>{
		mat: [[4,4],[4,4]],
		pred: ->(h){h==3},
	},
	5=>{
		mat: [[5],[5],[5],[5],[5]],
		pred: ->(h){h==0},
	},
	6=>{
		mat: [[6,6],[6,6],[6,6]],
		pred: ->(h){h==0},
	},
}

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
	T.each{|k,v|
		next if !v[:pred][y]
		e=v[:mat]
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

w=12
h=5
m=h.times.map{[0]*w}.to_a
p dfs(m,0,0)