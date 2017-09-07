#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :z
else
	puts 'z'*n
	(1..n-2).each{|i|puts '.'*(n-1-i)+'z'+'.'*i}
	puts 'z'*n
end
