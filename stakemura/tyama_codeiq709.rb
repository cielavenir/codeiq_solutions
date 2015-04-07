#!/usr/bin/ruby
#based on http://people.revoledu.com/kardi/tutorial/AHP/Priority%20Vector.htm
m=[
=begin
	[1,3,5,7],
	[1.0/3,1,5,7],
	[1.0/5,1.0/5,1,3],
	[1.0/7,1.0/7,1.0/3,1],
=end
	[1,3,5,7,1],
	[1.0/3,1,3,7,1],
	[1.0/5,1.0/3,1,3,1.0/5],
	[1.0/7,1.0/7,1.0/3,1,1.0/7],
	[1,1,5,7,1],
]
a=[]
w=m.transpose.map{|e|
	a<<(s=e.reduce(:+).to_f)
	e.map{|f|f/s}
}.transpose.map{|e|e.reduce(:+)/m.size}
p w # [0.36989481516623857, 0.21912229610424344, 0.07703983259846511, 0.03709171922568394, 0.296851336905369]
# p w.reduce(:+) # 1
p (a.zip(w).map{|a,b|a*b}.reduce(:+)-m.size)/(m.size-1) # CI=0.05343165143701878