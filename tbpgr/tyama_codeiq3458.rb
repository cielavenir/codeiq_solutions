#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :p
else
	puts 'p'*n
	(n/2-1).times{puts 'p'+'.'*(n-2)+'p'}
	puts 'p'*n
	(n/2).times{puts 'p'+'.'*(n-1)}
end
