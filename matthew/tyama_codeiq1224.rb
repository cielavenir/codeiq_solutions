#!/usr/bin/ruby
N=10
a=[1]
b=['  1']
2.step(N){
	a=[1]+a.each_cons(2).map{|x,y|x+y}+[1]
	b<<a.map{|e|'%3d'%e}.join(' '*3)
}
b.each_with_index{|e,i|
	puts ' '*(3*(N-i-1))+e
}