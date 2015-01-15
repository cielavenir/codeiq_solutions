#!/usr/bin/ruby
#coding:utf-8

pascal=[1,1]
cnt=0
(3..1/0.0).each{|i|
	nxt=[1]+pascal.each_cons(2).map{|x,y|x^y}+[1]
	cnt+=nxt.count(0)
	if cnt>=2014
		p i
		break
	end
	pascal=nxt
}