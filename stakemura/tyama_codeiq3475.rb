#!/usr/bin/ruby
CODEIQ3475=1
if defined?(CODEIQ3475)
	D=[[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
else
	D=[[-1,0],[0,-1],[1,0],[0,1]]
end
def fill(_x,_y)
	q=[[_x,_y]]
	while !q.empty?
		x,y=q.shift
		if 0<=x&&x<$n&&0<=y&&y<$m&&$T[y][x]
			$T[y][x]=false
			D.each{|dx,dy|q.push([x+dx,y+dy])}
		end
	end
end
if defined?(CODEIQ3475)
	$T=$<.map{|e|e.chomp.chars.map{|e|e=='0'}}
	$n=$T[0].size;$m=$T.size
else
	$n,$m=gets.split.map(&:to_i)
	$T=$m.times.map{gets.split.map{|e|e.to_i==1}}
end
r=0
$m.times{|i|
	$n.times{|j|
		if $T[i][j]
			r+=1
			fill(j,i)
		end
	}
}
p r
