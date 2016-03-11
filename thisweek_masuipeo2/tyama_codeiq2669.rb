#!/usr/bin/env ruby
#cf: http://ibeckuu.hatenablog.com/entry/2016/02/24/014539
def f(i,j) i==0 ? 0 : j/i + f(j%i,i) end
N,m=gets.split(',').map(&:to_i)
r=0
(1..N).each{|j|r+=(1..j).count{|i|f(i,j)==m}}
p r