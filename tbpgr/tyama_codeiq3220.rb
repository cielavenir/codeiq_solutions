#!/usr/bin/ruby
def zeller(_y,m,d)
	m+=1
	if m<4 then _y-=1;m+=12 end
	y=_y/100;z=_y%100
	(5*y+z+y/4+z/4+13*m/5+d-1)%7
end
def leap(y)
	return true if y%400==0
	return false if y%100==0
	y%4==0
end
while gets
	y,m,k=$_.chomp.split(',').map(&:to_i)
	d=[0,31,28,31,30,31,30,31,31,30,31,30,31][m]
	d+=1 if m==2&&leap(y)
	d=d.downto(1).find{|i|zeller(y,m,i)==k}
	puts '%04d%02d%02d'%[y,m,d]
end
