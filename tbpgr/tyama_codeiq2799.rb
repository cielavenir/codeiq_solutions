#!/usr/bin/ruby
Even=lambda{|a,b|
	a>b ? [a,b+7] : a<b ? [a+7,b] : [a,b]
}
T={
	'G'=>{
		'G'=>Even,
		'C'=>lambda{|a,b|[a+3,b]},
		'P'=>lambda{|a,b|[a,b+6]},
	},
	'C'=>{
		'G'=>lambda{|a,b|[a,b+3]},
		'C'=>Even,
		'P'=>lambda{|a,b|[a+6,b]},
	},
	'P'=>{
		'G'=>lambda{|a,b|[a+6,b]},
		'C'=>lambda{|a,b|[a,b+6]},
		'P'=>Even,
	},
}		
a=b=0

$<.each{|e|
	x,y=e.chomp.split(',')
	a,b=T[x][y][a,b]
}
puts [:even,"A,#{a-b}","B,#{b-a}"][a<=>b]