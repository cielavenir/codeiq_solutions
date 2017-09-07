#!/usr/bin/env ruby
k=gets.chomp
puts gets.split.map{|e|
	if e==k
		'['+e+']'
	else
		e.gsub(k,'='+k+'=')
	end
}*' '
