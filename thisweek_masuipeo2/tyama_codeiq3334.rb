#!/usr/bin/env ruby
F=[1,1]
(2..999).each{|i|F[i]=F[i-1]*i}
a,b,c=gets.split.map(&:to_i)
d=a+b-c
p 0<=d&&d<=[a,b].min ? F[c]/F[a-d]/F[b-d]/F[d] : 0
