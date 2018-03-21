#!/usr/bin/ruby
N=gets.to_i
1.step(N,2){|i|
	p [i] #[1..i]
	1.step(i-1,2){|j|
		x=((i+1)/2)**2-((j+1)/2)**2
		if Math.sqrt(x).to_i**2==x
			#p [j+2..i] 
			p [(j+3>>1)**2..(i+1>>1)**2]
		end
	}
}
