#!/usr/bin/env ruby
n=gets.to_i
if n%2==0
	puts :invalid
else
	n.times{|i|
		s='.'*n
		s[i]=s[-1-i]='x'
		puts s
	}
end
