#!/usr/bin/env ruby
#http://nabetani.sakura.ne.jp/hena/orde17palin/
#http://qiita.com/Nabetani/items/aa15539c8dc2c610c1a0
def solve(t,b=10)
	return to_enum(:solve,t,b) if !block_given?
	(0...b).each{|i|return if i>t;yield i}
	start=1
	digit=1
	loop{
		start.step(start*b-1){|i|
			s=i.to_s(b)
			n=(s+s.reverse).to_i(b)
			return if n>t
			yield n
		}
		start.step(start*b-1){|i|
			s=i.to_s(b)
			(0...b).each{|mid|
				n=(s+mid.to_s(b)+s.reverse).to_i(b)
				return if n>t
				yield n
			}
		}
		start*=b
		digit+=b
	}
end

while gets
	x,y=$_.split(',').map &:to_i
	x=solve(x-1).to_a.size
	y=solve(y).to_a
	r=y[x..-1]
	if r.size==0
		puts :-
	elsif r.size%2>0
		p r[r.size/2]
	else
		puts '%d,%d'%r[r.size/2-1,2]
	end
	STDOUT.flush
end
