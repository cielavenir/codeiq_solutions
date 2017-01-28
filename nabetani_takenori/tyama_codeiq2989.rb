#!/usr/bin/ruby
r=0
a,b=gets.split.map(&:to_i)
(1<<(a-1)).times{|i|
	n=0
	(a-1).times{|j|
		n=n*a+j+1 if i[j]==1
	}
	n0=n
	l=[]
	while n>0
		l.unshift(n%b)
		n/=b
	end
	r=n0 if r<n0 && l.each_cons(2).all?{|x,y|x>y}
}
p r
