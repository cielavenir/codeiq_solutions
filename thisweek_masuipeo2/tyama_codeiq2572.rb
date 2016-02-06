#!/usr/bin/ruby
#coding:utf-8
T=[10000,5000,2000,1000,500,100,50,10,5,1]
a=[1]
gets.to_i.times{
	a=[1]+a.each_cons(2).map{|x,y|x+y}+[1]
}
p a.map{|e|
	r=0
	T.each{|f|
		r+=e/f
		e%=f
	}
	r
}.reduce(:+)