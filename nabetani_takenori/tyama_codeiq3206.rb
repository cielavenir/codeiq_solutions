#!/usr/bin/ruby
#cf: hena e02

STDOUT.sync=true
T=[*'A'..'Z']
H=26
W=26
while gets
	a=$_.chomp.split
	n=a[0].to_i
	mo,mx=[1,2].map{|i|
		m=(H+1).times.map{[0]*(W+1)}
		a[i].split(',').each{|e|
			x,y=e.upcase.chars.map{|c|T.index(c)}
			m[y+1][x+1]=1
		}
		(H+1).times.map{|y|W.times.map{|x|m[y][x+1]+=m[y][x]}}
		H.times.map{|y|(W+1).times.map{|x|m[y+1][x]+=m[y][x]}}
		m
	}
	r=[]
	H.times{|y0|(y0+1).upto(H){|y1|W.times{|x0|(x0+1).upto(W){|x1|
		if
			mo[y0][x0]-mo[y1][x0]-mo[y0][x1]+mo[y1][x1]==n &&
			mx[y0][x0]-mx[y1][x0]-mx[y0][x1]+mx[y1][x1]==0
		then
			r<<(x1-x0)*(y1-y0)
		end
	}}}}
	z=r.max
	if !z
		puts '-'
	else
		puts z
	end
end
