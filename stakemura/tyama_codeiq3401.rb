#!/usr/bin/ruby
r=Float::INFINITY
rx=nil
a=$<.map{|e|e.split.map &:to_i}
a.combination(4){|b|
  b.combination(2){|c|
    d=b-c
    if r>q=((c[0][1]+c[1][1])-(d[0][1]+d[1][1])).abs
      r=q
      rx="%d %d\n%d %d\n"%[c[0][0],c[1][0],d[0][0],d[1][0]]
    end
  }
}
puts rx
