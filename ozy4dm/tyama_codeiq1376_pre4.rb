#!/usr/bin/ruby
1.step(10000){|n|
	r=1+(~-n&0b10101010101010)
	puts sprintf('%08b',~-n)+' '+r.to_s
}