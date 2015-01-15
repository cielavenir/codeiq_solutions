#!/usr/bin/env ruby
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
#p T #[126, 48, 109, 121, 51, 91, 95, 112, 127, 123]
M=(0..9).map{|e|(0..9).map{|f|7.times.count{|j|(T[e]^T[f])[j]>0}}}
p [*0..9].permutation.map{|a|
	p a
	9.times.reduce(0){|s,i|s+M[a[i]][a[i+1]]}
}.min