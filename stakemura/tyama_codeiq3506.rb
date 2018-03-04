#!/usr/bin/ruby
gets;a=$<.map{|e|e.chomp.split(',')}.transpose
puts a.map{|e|e.uniq.size}*','
