#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :n
else
	puts 'n'+'.'*(n-2)+'n'
	(1..n-2).each{|i|puts 'n'+'.'*(i-1)+'n'+'.'*(n-2-i)+'n'}
	puts 'n'+'.'*(n-2)+'n'
end
