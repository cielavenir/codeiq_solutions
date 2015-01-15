#!/usr/bin/ruby
require 'prime'
CHOOSE=7

p Prime.take(CHOOSE-1).permutation.map{|a|
	([a.first**2]+a.each_cons(2).map{|x,y|x*y}+[a.last**2]).max
}.min # 55
p Prime.take(CHOOSE).permutation.map{|a|
	([a.first**2]+a.each_cons(2).map{|x,y|x*y}).max
}.min # 55
p Prime.take(CHOOSE+1).permutation.map{|a|
	(a.each_cons(2).map{|x,y|x*y}).max
}.min # 77

# example: 7*7, 7*5, 5*11, 11*2, 2*13, 13*3, (3*17 or 3*3)