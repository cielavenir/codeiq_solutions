#!/usr/bin/ruby
if RUBY_VERSION<'2.2'
	module Kernel
		def itself
			self
		end
	end
end
def zip(*arrays)
	arrays.empty? ? [] : arrays[0].zip(*arrays[1..-1])
end
def riffle(a)
	zip(*a.each_slice(a.size/2).to_a).flat_map(&:itself)
end
def riffle_cycle(d,a,orig)
	d!=0&&a==orig ? d : riffle_cycle(d+1,riffle(a),orig)
end
puts (1..100).count{|i|
	riffle_cycle(0,*[(2*i).times.to_a]*2)==2*(i-1)
} # 22