#!/usr/bin/env ruby
m,n=gets.split.map(&:to_i)
p (3*m-n)/2+1-[2*m-n,0].max
