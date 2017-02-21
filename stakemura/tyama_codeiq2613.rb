#!/usr/bin/env ruby
s=gets.split
n=s.size
a=[]
s.each_with_index{|e,i|
	a<<e
	if ['.','!','?'].find(&e.method(:end_with?)) && !(['Mr.','Ms.','Mrs.','Mt.'].include?(e) || e[0..-2]=~/^[0-9]$/)
		puts a*' '+(i==n-1 ? '' : ' ')
		a=[]
	end
}
puts a*' ' if !a.empty?