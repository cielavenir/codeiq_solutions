#!/usr/bin/env ruby
#cf: codeiq3011/hena24
require 'prime'

def take_prime(prev)
	return to_enum(:take_prime,prev) if !block_given?
	before=0
	Prime.each{|e|
		d=e-before
		(d-1).times{prev.next}
		yield prev.next
		before=e
	}
end

if $0==__FILE__
	while gets
		it=take_prime(Prime.each)
		($_.to_i-1).times{it.next}
		p it.next
	end
end
