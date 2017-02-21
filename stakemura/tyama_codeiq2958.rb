#!/usr/bin/ruby
puts gets.strip.split.join(' ').gsub(/ ([\.\?,])/,'\1')