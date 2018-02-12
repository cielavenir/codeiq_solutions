#!/usr/bin/ruby
a=$<.map.with_index{|e,i|[1/e.split.reduce(0){|s,e|s+Rational(1,e.to_i)},i]}.sort
r=[]
v=z=Float::INFINITY
a.size.downto(1){|i|v>a[i-1][0]&&(v=a[i-1][0];z=i);r[a[i-1][1]]=z}
p *r
