#!/usr/bin/env ruby
require 'prime'
m,n=gets.split.map &:to_i
a=Prime.each(n).drop_while{|e|e<m}*''
s=[0]
(0...a.size).each{|i|s[i+1]=a[i].to_i+s[i]}
p a.size.times.map{|i|
    idx=a.rindex(a[i],i+140-1)
    s[idx+1]-s[i]
}.max
