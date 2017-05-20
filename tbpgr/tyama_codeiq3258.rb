#!/usr/bin/env ruby
s=n=0
$<.each{|e|
    x,y=e.split(',').map &:to_i
    n+=1
    s+=x>3 ? x-3 : 0
    s+=y>4 ? 0 : 5-y
}
s+=n>3 ? n-3 : 0
p s
