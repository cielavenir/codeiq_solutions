#!/usr/bin/env ruby
require 'set'
def dfs(h,d,x,y)
	return to_enum(:dfs,h,d,x,y) if !block_given?
	if d==0
		proc.call(h.dup)
	else
		[[-1,0],[0,-1],[1,0],[0,1]].each{|dx,dy|
			nx=x+dx
			ny=y+dy
			k=[nx,ny]
			if !h.include?(k)
				h.add(k)
				dfs(h,d-1,nx,ny,&proc)
				h.delete(k)
			end
		}
	end
end		
n=gets.to_i
h=Set.new
x=Set.new
x.add([0,0])
dfs(x,n,0,0){|_|h.add(_)}
p h.size
