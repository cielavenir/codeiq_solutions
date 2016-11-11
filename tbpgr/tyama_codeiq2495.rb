#!/usr/bin/env ruby
a,b,c=gets.chomp.split(',')
d=b.to_f/a.to_f
puts d>1 ? :invalid : c*(d*100).to_i