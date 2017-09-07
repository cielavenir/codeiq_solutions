#!/usr/bin/ruby
n=gets.to_i
if n%2==0
	puts :invalid
else
	n.times{|i|
		s='.'*n
		k=(n/2-i).abs
		s[k]=s[-k-1]='o'
		puts s
	}
end
