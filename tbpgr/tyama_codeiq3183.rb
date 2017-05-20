#!/usr/bin/env ruby
t={'>'=>[1,0],'v'=>[0,1],'<'=>[-1,0],'^'=>[0,-1]}
s=9.times.map{'x'*9}
x=y=0
s[y][x]='Y'
gets.chomp.chars{|c|
	dx,dy=t[c]
	x+=dx
	y+=dy
	s[y][x]='Y'
}
puts s
