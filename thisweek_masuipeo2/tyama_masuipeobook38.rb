#!/usr/bin/env ruby
H=4
W=4
$memo={}
def dfs(d,k)
	return 1 if d==H*W
	$memo[k]||=lambda{
		d0,r0=d.divmod W
		r=0
		(H*W).times{|i|
			d1,r1=i.divmod W
			next if k[i]==1 || d0==d1 || r0==r1
			r+=dfs(d+1,k|(1<<i)) 
		}
		r
	}.call
end
p dfs(0,0)
