#!/usr/bin/ruby
m,n=gets.split(',').map(&:to_i)
p [*0...m].repeated_permutation(n).count{|_|_.chunk{|e|e}.count*2<n}