#!/usr/bin/ruby
A=[2,3,5,7]
M=10000000

T=[1]*(2**A.size)
e=[1]+[0]*(2**A.size-1)
a=[1]+[0]*(2**A.size-1)
A.size.times{|i|
	a[1<<i]=1
}
T.size.times{|i|
	A.size.times{|j|
		if (i&1<<j)>0
			T[i]*=A[j]
		end
	}
}

def mult(x,y)
	a=[0]*T.size
	T.size.times{|i|T.size.times{|j|
		a[i^j]=(a[i^j]+T[i&j]*x[i]*y[j])%M
	}}
	a
end

n=gets.to_i
while n>0
	e=mult(e,a) if n%2==1
	a=mult(a,a)
	n/=2
end
p e[0]
p e
p a