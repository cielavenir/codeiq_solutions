#!/usr/bin/env ruby
def solve(a)
	start=[0,a.size-1]
	q=[start]
	depth={start=>0}
	while !q.empty?
		cur=q.shift
		[-1,1].each{|d|
			next if cur[0]+d<0
			tide0=a[cur[0]+d]-a[cur[0]]
			[-1,1].each{|e|
				next if cur[1]+e>=a.size
				tide1=a[cur[1]+e]-a[cur[1]]
				next if tide0!=tide1
				nxt=[cur[0]+d,cur[1]+e]
				q<<nxt
				depth[nxt]=depth[cur]+1
				if nxt[0]==nxt[1]
					return depth[nxt]
				end
			}
		}
	end
	raise
end

def dfs(l,d,x)
	return to_enum(:dfs,l,d,x) if !block_given?
	if d==0
		yield solve(l)
	else
		dfs(l+[l[-1]+1],d-1,x-1,&proc) if x>0
		dfs(l+[l[-1]-1],d-1,x,&proc) if l[-1]-1>=0
	end
end
			
N=12
raise if N%2>0
p dfs([0],N,N/2).max*2 # 20