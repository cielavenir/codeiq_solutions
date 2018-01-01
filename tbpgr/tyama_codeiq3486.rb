#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :b
else
	puts 'b'*n
	(n/2-1).times{puts 'b'+'.'*(n-2)+'b'}
	puts 'b'*n
	(n/2-1).times{puts 'b'+'.'*(n-2)+'b'}
	puts 'b'*n
end
