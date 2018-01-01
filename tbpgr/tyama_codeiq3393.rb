#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :h
else
	(n/2).times{puts 'h'+'.'*(n-2)+'h'}
	puts 'h'*n
	(n/2).times{puts 'h'+'.'*(n-2)+'h'}
end
