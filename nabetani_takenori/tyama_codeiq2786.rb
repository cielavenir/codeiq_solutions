#!/usr/bin/ruby
EPS=1e-9
def eql(a,b)
	(a-b).abs<EPS
end
def chk(x0,x1,xa,xb)
	if eql(xa,xb)
		if eql(x1,xa) || eql(x0,xb)
			'G'
		elsif x0<xa && xb<x1
			'H'
		else
			'I'
		end
	else
		if xa<x0 && x1<xb
			'A'
		elsif x0<xa && xb<x1
			'E'
		elsif (xa<x0 && x0<xb && xb<x1) || (x0<xa && xa<x1 && x1<xb)
			'F'
		elsif eql(x0,xa) && eql(x1,xb)
			'C'
		elsif (eql(x0,xa) && x1<xb) || (xa<x0 && eql(x1,xb))
			'B'
		elsif eql(x0,xb) || eql(x1,xa)
			'G'
		else
			'D'
		end
	end
end

puts gets.split.map{|e|
	x,y,r,x0,y0,x1,y1=e.scan(/\d+/).map(&:to_i)
	if x0>x1
		x0,x1=x1,x0
		y0,y1=y1,y0
	end
	if x0==x1 && y0>y1
		y0,y1=y1,y0
	end
	if x0==x1 && y0==y1
		raise 'not line: '+e
	end
	a=y1-y0
	b=x0-x1
	c=-a*x0-b*y0
	d=a*x+b*y+c
	z=(a*a+b*b)*r*r-d*d
	if z<0
		'I'
	else
		if x0!=x1
			chk(x0,x1,*[-1,1].map{|sgn|(-a*d + sgn*b*Math.sqrt(z))/(a*a+b*b)+x}.minmax)
		else
			chk(y0,y1,*[1,-1].map{|sgn|(-b*d + sgn*a*Math.sqrt(z))/(a*a+b*b)+y}.minmax)
		end
	end
}*''