#!/usr/bin/ruby
d,r=(gets.to_i-1).divmod(5)
a=[]
if d==0||d==2
	a<<d*5+5+r
else
	a<<d*5-5+r
end
if d==0||d==3
	a<<d*5+(r+1)%5
	a<<d*5+(r-1)%5
elsif d==1
	a<<d*5+5+r
	a<<d*5+5+(r-1)%5
else
	a<<d*5-5+r
	a<<d*5-5+(r+1)%5
end
puts a.map{|e|e+1}.sort*','
