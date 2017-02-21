#!/usr/bin/ruby
puts$<.read.gsub(/[+-]?\d+\.?\d*[eE]?[+-]?\d*/,'*')
