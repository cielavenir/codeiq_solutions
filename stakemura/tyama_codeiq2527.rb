#!/usr/bin/env ruby
#coding:utf-8
A=$<.map{|e|
	e.split(',').map(&:to_f)
}
p [*0...A.size].max{|i,j|
	xa,xb,xc=A[i]
	ya,yb,yc=A[j]
	# 指数変換 n=z**Math.log(n,z)
	# xb**xc * Math.log(xa) <=> yb**yc * Math.log(ya)
	# xb**xc * Math.log(xa) <=> (xb**Math.log(yb,xb))**yc * Math.log(ya)
	# xb**(xc - Math.log(yb,xb)*yc) <=> Math.log(ya)/Math.log(xa)
	xb**(xc - Math.log(yb,xb)*yc) <=> Math.log(ya)/Math.log(xa)
}