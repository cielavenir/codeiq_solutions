#!/usr/bin/ruby
1.step(10000){|n|
	r= ~-n&10923|1
	puts sprintf('%08b',~-n)+' '+r.to_s
}