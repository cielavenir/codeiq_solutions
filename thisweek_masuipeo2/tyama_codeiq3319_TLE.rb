#!/usr/bin/env ruby
N,M=gets.split.map &:to_i
if N*M%2>0
	p 0
	exit
end
p [*1..N*M-2].combination(N*M/2-1).count{|a|
	h={}
	next if a.any?{|e|
		h[e]=1
		h.has_key?(N*M-1-e)
	}
	m=N.times.map{[0]*M}
	m[0][0]=1
	a.each{|e|m[e/M][e%M]=1}
	q=[[0,0]]
	d={[0,0]=>0}
	while !q.empty?
		c=q.shift
		[[-1,0],[0,-1],[1,0],[0,1]].each{|dx,dy|
			nx=dx+c[0]
			ny=dy+c[1]
			if 0<=nx&&nx<M && 0<=ny&&ny<N && m[ny][nx]==1 && !d.has_key?([nx,ny])
				d[[nx,ny]]=d[c]+1
				q<< [nx,ny]
			end
		}
	end
	d.size==N*M/2
}
