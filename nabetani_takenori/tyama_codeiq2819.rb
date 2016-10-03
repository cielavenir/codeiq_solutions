#!/usr/bin/ruby
#TLE on 2820
def array_to_int(a)
	r=0
	a.each{|e|r=r*10+e}
	r
end
def solve(n,m,a)
	if n>1&&a.all?{|e|e.all?{|f|f==0}}
		:-
	else
		r={}
		z=Float::INFINITY
		if n==1
			a.each{|_e|_e.each{|e|
				if (e-m).abs<z
					z=(e-m).abs
					r={}
				end
				if (e-m).abs==z
					r[e]=1
				end
			}}
		else
			a.permutation(n){|b|
				b[0].product(*b[1..-1]).each{|_e|
					next if _e[0]==0
					e=array_to_int(_e)
					if (e-m).abs<z
						z=(e-m).abs
						r={}
					end
					if (e-m).abs==z
						r[e]=1
					end
				}
			}
		end
		r.keys*','
	end
end

if __FILE__==$0
	$<.each{|e|
		a=e.chomp.split(',')
		if a[2].index('/')
			puts solve(a[0].to_i,a[1].to_i,a[2].split('/').map{|e|e.chars.map(&:to_i)})
		else
			puts solve(a[0].to_i,a[1].to_i,a[2].chars.map{|e|[e.to_i]})
		end
	}
end