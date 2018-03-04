#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :j
else
	((n+1)/2).times{|i|puts '.'*(n-1)+'j'}
	((n-3)/2).times{|i|puts 'j'+'.'*(n-2)+'j'}
	puts 'j'*n
end
