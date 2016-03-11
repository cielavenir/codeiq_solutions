#!/usr/bin/env ruby
$memo={}
def dfs(m,h,w)
	return 1 if m==0
	return 0 if m<0 || h==w
	$memo[(m<<20)|(h<<10)|w]||=lambda{
		r=0
		(h+w).step(N,w).with_index(1){|i,j|
			r+=dfs(m-j,w,i)
		}
		r
	}.call
end
N,m=gets.split(',').map(&:to_i)
p (1..N).map{|i|dfs(m,0,i)}.reduce(:+)