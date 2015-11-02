#!/usr/bin/env ruby
N=gets.to_i
ret=0
(1<<N).times{|j|
	n=j
	r=0
	while n>0
		i=N-1
		while i>0
			if (n&(1<<i)>0)&&(n&(1<<(i-1)))==0
				n=n&~(1<<i)|(1<<(i-1))
				i-=1
			end
			i-=1
		end
		n&=~1 if i==0
		r+=1
	end
	ret+=r
}
p ret