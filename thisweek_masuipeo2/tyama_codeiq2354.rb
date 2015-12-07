#!/usr/bin/env ruby
def solve(n)
	p [*1..n].permutation.count{|a|a.each_cons(3).none?{|x,y,z|(x<y&&y<z) || (x>y&&y>z)}}
end
def solve_oeis001250(n)
	r=1
	a={-1=>0, 0=>2}
	k=0
	e=1
	0.step(n){|i|
		am=a[k+e]=0
		e=-e
		0.step(i){|j|am+=a[k]; a[k]=am; k+=e}
		if i>1
			r=i%2==0 ? a[-i/2] : a[i/2]
		end
	}
	r.abs
end

N=gets.to_i
p solve_oeis001250(N)