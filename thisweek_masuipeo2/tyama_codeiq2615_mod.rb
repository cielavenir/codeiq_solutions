#!/usr/bin/ruby
a,b=gets.split(',').map(&:to_i)
a,b,c=b-1,a-b,b-1-a+b
p (1..a).reduce(:*)/(1..b).reduce(:*)/(1..c).reduce(:*)
