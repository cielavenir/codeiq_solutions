#!/usr/bin/ruby
require 'rational'
N=7
dict={}
(1..N-1).each{|i|
	(1..N-1).each{|j|dict[Rational(i,j)]=1}
}
p dict.size+2 # 2: x=0 and y=0
# 25