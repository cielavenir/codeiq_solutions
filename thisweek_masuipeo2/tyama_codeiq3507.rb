#!/usr/bin/ruby
T=[1, 2, 3, 5, 10, 20, 30, 50, 62, 82, 92, 100, 120, 140, 205, 280, 310, 500, 1000]
N=gets.to_i
bag=[1]+[0]*N
T.each{|e|N.downto(e){|i|bag[i]+=bag[i-e]}}
p bag[N]
