#!/usr/bin/ruby
x,y=gets.split(',').map(&:to_i)
p x*([2,y].min*30+[9,y].min*10)