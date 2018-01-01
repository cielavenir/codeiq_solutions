#!/usr/bin/ruby
d=gets.chomp
a=$<.map{|e|e.chomp.split('=')}
k,l=a.transpose.map{|e|e.map(&:size).max}
a.each{|x,y|puts '%s=%s'%[x.send(d+'just',k),y]}
