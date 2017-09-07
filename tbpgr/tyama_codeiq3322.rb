#!/usr/bin/env ruby
c,d,n,t=gets.split(',').map(&:to_i)
r=0
n.times{
  r+=c
  r-=d if r>t
  if r>75
    puts 'good bye'
    exit
  end
}
p [r,0].max
