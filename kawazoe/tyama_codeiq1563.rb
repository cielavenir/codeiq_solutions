#!/usr/bin/ruby
T=[1,2,3,6,5,10,15,30]
M=10000000
def mult(x,y)
	a=[0]*8
	T.size.times{|i|T.size.times{|j|
		a[i^j]=(a[i^j]+T[i&j]*x[i]*y[j])%M
	}}
	a
end

e=[1,0,0,0,0,0,0,0]
a=[1,1,1,0,1,0,0,0]
n=gets.to_i
while n>0
	e=mult(e,a) if n%2==1
	a=mult(a,a)
	n/=2
end
p e[0]

__END__
【コードの説明】
展開した値は、A+Bsqrt(2)+Csqrt(3)+Dsqrt(6)+Esqrt(5)+Fsqrt(10)+Gsqrt(15)+Hsqrt(30)と表せる。
0,1,2,3,4,5,6,7とビットで表す。
すると、ビット積および排他的ビット和により、積を計算することができる。
あとは繰り返し二乗法を用いれば良い。
【言語】
Ruby