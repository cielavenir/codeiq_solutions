#!/usr/bin/ruby
def parse(s)
	x,y,r=s.split(',').map &:to_i
	return {y=>[x,x]} if r==0
	h={y-r=>[x,x],y+r=>[x,x]}
	(y-r+1..y+r-1).each{|y0|
		dx=Math.sqrt(r**2-(y0-y)**2).to_i
		h[y0]=[x-dx,x+dx]
	}
	h
end

while gets
	a,b=$_.split.map{|e|parse e}
	r=0
	a.each{|y,xa|
		next if !b.has_key?(y)
		xb=b[y]
		xa,xb=[xa,xb].sort
		r0=[xa[1],xb[1]].min-xb[0]+1
		r+=r0 if r0>0
	}
	p r
	STDOUT.flush
end
