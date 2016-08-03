#!/usr/bin/ruby
puts gets.split.map{|e|
	x0,y0,r0,x1,y1,r1=e.scan(/\d+/).map(&:to_i)
	if x0==x1 && y0==y1 && r0==r1
		'A'
	else
		d=(x0-x1)**2+(y0-y1)**2
		r0,r1=[r0,r1].minmax
		if d>(r0+r1)**2
			'F'
		elsif d==(r0+r1)**2
			'E'
		elsif d>(r1-r0)**2
			'D'
		elsif d==(r1-r0)**2
			'C'
		else
			'B'
		end
	end
}*''