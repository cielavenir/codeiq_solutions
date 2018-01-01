#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
else
	(n/2).times{|i|
		s='.'*n
		s[i]=s[-1-i]='y'
		puts s
	}
	(n-n/2).times{puts '.'*(n/2)+'y'+'.'*(n/2)}
end
