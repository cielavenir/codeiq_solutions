#!/usr/bin/ruby
n=gets.to_i
r=1
while n>0
	r*=2 if n%2==1
	n/=2
end
p r

__END__
a=[0,1]
2.upto(gets.to_i){|i|
	b=[0]
	1.upto(i-2){|j|b[j]=a[j-1]^a[j+1]}
	b[i-1]=0
	b[i]=1
	a=b
	puts '%010b %d'%[i,a.reduce(:+)*2]
}