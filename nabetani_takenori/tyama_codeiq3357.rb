#!/usr/bin/env ruby
D=[[0,0],[1,0],[2,0],[2,1],[2,2],[1,2],[0,2],[0,1]]
def num2place(n)
	n-=1
	x=y=0
	z=1
	while n>0
		x+=D[n%8][0]*z
		y+=D[n%8][1]*z
		n/=8
		z*=3
	end
	[x,y]
end
def place2num(x,y)
	n=0
	z=1
	return nil if x<0||y<0
	while x>0||y>0
		idx=D.index([x%3,y%3])
		return nil if !idx
		n+=idx*z
		x/=3
		y/=3
		z*=8
	end
	n+1
end
while gets
	x,y=num2place($_.to_i)
	puts [[0,-1],[-1,0],[1,0],[0,1]].map{|dx,dy|
		place2num(x+dx,y+dy)
	}.compact.sort*','
	STDOUT.flush
end
