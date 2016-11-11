#!/usr/bin/ruby
h={}
DATA.each{|e|
	x,y,z=e.chomp.split(',')
	h[x]=[y.to_i,z]
}
down=false
last=nil
r=0
gets.chomp.split(',').each{|e|
	d,t=h[e]
	f=down ? 8 : 10
	f/=2 if last==e
	r+=d*f/10
	last=e
	down||=t=='down'
}
p r
__END__
a,10,normal
b,20,down
c,20,normal
d,30,normal