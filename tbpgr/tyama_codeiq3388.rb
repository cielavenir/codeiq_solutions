#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :e
else
	height=(n-3)/2
	puts 'e'*n
	height.times{puts 'e'+'.'*(n-1)}
	puts 'e'*(n-n/2)+'.'*(n/2)
	height.times{puts 'e'+'.'*(n-1)}
	puts 'e'*n
end
