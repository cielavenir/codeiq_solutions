#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :m
else
	puts 'm'+'.'*(n-2)+'m'
	(n/2-1).times{|i|
		puts 'm'+'.'*i+'m'+'.'*(n-4-i*2)+'m'+'.'*i+'m'
	}
	puts 'm'+'.'*(n/2-1)+'m'+'.'*(n/2-1)+'m'
	(n/2).times{puts 'm'+'.'*(n-2)+'m'}
end
