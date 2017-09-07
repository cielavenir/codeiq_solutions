#!/usr/bin/ruby
def solve(m,x)
	a=[0,0,2**m-1]
	q=[a]
	depth={a=>0}
	while !q.empty?
		c=q.shift
		n=depth[c]
		[[0,1],[0,2],[1,0],[1,2],[2,0],[2,1]].each{|from,to|
			from_least=c[from]&-c[from]
			to_least=c[to]&-c[to]
			if from_least>0 && (to_least==0||from_least<to_least)
				c[to]|=from_least
				c[from]&=~from_least
				nxt=c.sort
				if !depth.has_key?(nxt)
					break if n+1>x
					q<<nxt
					depth[nxt]=n+1
				end
				c[from]|=from_least
				c[to]&=~from_least
			end
		}
	end
	depth.count{|k,v|v==x}
end
m,n=gets.split.map &:to_i
p solve m,n
