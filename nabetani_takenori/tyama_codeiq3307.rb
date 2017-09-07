#!/usr/bin/env ruby
T={
	'C'=>[1,1],
	'S'=>[2,2],
	'I'=>[4,4],
	'L'=>[8,4],
	'D'=>[8,8],
	'M'=>[16,16],
}
p gets.chomp.chars.reduce([0,0]){|(_,cur),c|
	prev=(cur+T[c][1]-1)/T[c][1]*T[c][1]
	[prev,prev+T[c][0]]
}[0]
