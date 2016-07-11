#!/usr/bin/ruby
require 'json'
T=JSON.parse(DATA.read)
N=11
p N.times.map{
	i=0
	n=1
	while n<100
		roll=1+rand(6)
		n+=roll
		if T[n]
			n=T[n]
		end
		i+=1
	end
	i
}.sort[N/2]
__END__
{
98: 91,
97: 93,
96: 94,
84: 73,
75: 61,
67: 56,
53: 48,
3: 8,
13: 19,
21: 32,
33: 46,
42: 58,
51: 70,
68: 89
}