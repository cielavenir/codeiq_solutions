#!/usr/bin/ruby
1.step(1100){|n|
	n-=1
	r=1
	r+=2 if n&2>0
	r+=8 if n&8>0
	r+=32 if n&32>0
	r+=128 if n&128>0
	r+=512 if n&512>0
	r+=2048 if n&2048>0
	r+=8192 if n&8192>0
	puts sprintf('%08b',n)+' '+r.to_s
}