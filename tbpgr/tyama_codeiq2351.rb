#!/usr/bin/env ruby
a=gets.chomp.split(',')
puts '%d%%'%[(a[1..-1].count{|e|e==a[0]}*10).to_s]