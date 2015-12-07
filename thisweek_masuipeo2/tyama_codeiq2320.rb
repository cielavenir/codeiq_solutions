#!/usr/bin/env ruby
def dfs(prev,lst,orig)
	if lst.all?{|e|e==0}
		1
	else
		r=0
		filled=true
		lst.size.times{|i|
			if 0<lst[i] && i!=prev && filled
				lst[i]-=1
				r+=dfs(i,lst,orig)
				lst[i]+=1
			end
			filled=false if lst[i]==orig[i]
		}
		r
	end
end
def solve(n)
	orig=[2]*n
	lst=orig.dup
	lst[0]-=1
	dfs(0,lst,orig)
end
def solve_oeis000806(n)
	a,b=0,1
	(n-2).times{|i|
		a,b=b,(-2*i-5)*b+a
	}
	b.abs
end
#2.step(8){|i|p solve_oeis000806(i)}
p solve_oeis000806(gets.to_i)