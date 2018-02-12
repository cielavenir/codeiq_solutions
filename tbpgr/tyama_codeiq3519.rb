#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :i
else
	puts '.'*((n-3)/2)+'iii'+'.'*((n-3)/2)
	(1..n-2).each{|i|puts '.'*((n-1)/2)+'i'+'.'*((n-1)/2)}
	puts '.'*((n-3)/2)+'iii'+'.'*((n-3)/2)
end

