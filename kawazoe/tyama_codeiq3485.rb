#!/usr/bin/ruby
N,K=gets.split.map &:to_i
F=[1,1];2.upto(N){|i|F<<i*F[-1]}
def comb(n,k) F[n]/F[k]/F[n-k] end

A=(0..N).map{|k|
	next 0 if (N-k)%2>0
	d=(N-k)/2 # d=組の個数
	#N組からd組選ぶ
	#選ばなかった組からk組選び、k組からk枚選ぶのは2**k通り
	comb(N,d) * 2**k * comb(N-d,k)
}
S=A.reduce(:+)
p (Rational(A[K],S).to_f*10**6).to_i
