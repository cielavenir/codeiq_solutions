#!/usr/bin/env ruby
def popcnt32(n)
	m1=0x55555555
	m2=0x33333333
	m4=0x0f0f0f0f
	m8=0x00ff00ff
	m16=0x0000ffff
	n=((n>>1)&m1)+(n&m1)
	n=((n>>2)&m2)+(n&m2)
	n=((n>>4)&m4)+(n&m4)
	n=((n>>8)&m8)+(n&m8)
	n=((n>>16)&m16)+(n&m16)
	return n
end

T=[
0b1111110,
0b0110000,
0b1101101,
0b1111001,
0b0110011,
0b1011011,
0b1011111,
0b1110000,
0b1111111,
0b1111011,
]
h=Hash.new(0)
86400.times{|i|
	n=[i/3600 /10,i/3600 %10,i/60%60 /10,i/60%60 %10,i%60 /10,i%60 %10].reduce(0){|s,e|s+popcnt32(T[e])}
	h[n]+=1
}
puts $<.map{|e|h[e.to_i]}