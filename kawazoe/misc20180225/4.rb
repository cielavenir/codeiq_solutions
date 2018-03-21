#!/usr/bin/ruby
#prime_divisionだと間に合わないよなぁ…
N=gets.to_i
B=6000
r=0
((N+B-1)/B).times{|i|
	IO.popen('gfactor','r+b'){|io|
		(i*B+1..[N,(i+1)*B].min).each{|j|io.puts j**2+1}
		io.close_write
		io.each{|e|
			a=e.split
			a.shift
			r+=a.map(&:to_i).uniq.reduce(:*)
		}
	}
}
p r
# 2000000 => 2424282424390823376
