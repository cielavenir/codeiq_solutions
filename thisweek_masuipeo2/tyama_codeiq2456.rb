#!/usr/bin/ruby
N=gets.to_i
s=0
((N+2)/3).upto(N){|i|
	((N-i+1)/2).upto([i-1,N-i].min){|j|
		k=N-i-j
		s+=j==k ? 3 : 6
	}
}
p s