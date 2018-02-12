#!/usr/bin/ruby
M=1000003;I=[1,1];*F=I;*R=I
N,A,B=gets.split.map &:to_i
2.upto(N){|i|I<<z=(M-M/i)*I[M%i]%M;F<<i*F[-1]%M;R<<z*R[-1]%M}
r=0
0.step(N,2){|b|
	a=N-b
	b/=2
	if a<=A && b<=B
		r=(r+F[a+b]*R[a]*R[b])%M
	end
}
p r
