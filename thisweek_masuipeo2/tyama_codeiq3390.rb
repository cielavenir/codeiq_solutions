#!/usr/bin/ruby
require 'set'
def f(state,se,c)
	r=Float::INFINITY
	z=false
	(1...N).each{|i|
		nxt=(c+i)%N
		if state[nxt]==0
			z=true
			idx=i.step(i+N**2,N).find{|j|!se.include?(j)}
			state
			se.add(idx)
			r=[r,f(state|(1<<nxt),se,nxt)+idx].min
			se.delete(idx)
		end
	}
	z ? r : 0
end
N=gets.to_i
p f(1,Set.new,0)
