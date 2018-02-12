#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
elsif n==1
	puts :v
else
	(n-1).times{|i|puts '.'*(i/2)+'v'+'.'*((n-i)/2*2-1)+'v'+'.'*(i/2)}
	puts '.'*((n-1)/2)+'v'+'.'*((n-1)/2)
end
