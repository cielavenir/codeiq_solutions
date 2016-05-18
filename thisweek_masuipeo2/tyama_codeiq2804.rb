#!/usr/bin/ruby
n=gets.to_i
r=0
p (1..n).find{|i|
	x=n-(i-1)
	(r+=1;x/=2) while x%2==0
	y=i
	(r-=1;y/=2) while y%2==0
	r>0
}||0

__END__
r=1
p (1..n).find{|i|
	r=r*(n-(i-1))/i
	r%2==0
}||0