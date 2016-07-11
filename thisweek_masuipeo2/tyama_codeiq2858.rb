#!/usr/bin/ruby

def dfs(h,n,st,s,t)
	if n==0
		1
	else
		r=0
		(st..(s==0 ? st : M)).each{|e|
			if s+e<=t && h[e]==0
				h|=1<<e
				r+=s+e==t ? dfs(h,n-1,(1..M).find{|i|h[i]==0},0,t) : dfs(h,n,e+1,s+e,t)
				h&=~(1<<e)
			end
		}
		r
	end
end

M,N=gets.split(',').map(&:to_i)
S=M*(M+1)/2
if S%N>0
	p 0
else
	p dfs(0,N,1,0,S/N)
end