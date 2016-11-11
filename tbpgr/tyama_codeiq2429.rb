#!/usr/bin/ruby
puts gets.chomp.split(',').each_with_index.map{|e,i|e=='Code' ? 3 : e=='IQ' ? 5 : e=='CodeIQ' ? 15 : i}*','