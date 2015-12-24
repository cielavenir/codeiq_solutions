#!/usr/bin/env crystal
s=gets
if s
	n=s.to_i
	if n%2==0
		p 0
	else
		r=1_i64
		j=1
		((n-1>>1)+2).upto(n-1){|i|
			r*=i
			while j<=(n-1>>1) && r%j==0
				r/=j
				j+=1
			end
		}
		p r
	end
end
#Catalan(n-1>>1)