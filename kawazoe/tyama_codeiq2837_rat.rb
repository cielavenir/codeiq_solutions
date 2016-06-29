#!/usr/bin/ruby
#小数決の回数の期待値(同数の場合は全員生き残る)
Pascal=[[1]]
1.step(1000){|i|Pascal[i]=[1]+Pascal[i-1].each_cons(2).map{|x,y|x+y}+[1]}
F=[0,0,0]

def Q(n)
	aiko_prob=Rational(2,2**n) # 全員同じ
	aiko_prob+=Rational(Pascal[n][n/2],2**n) if n%2==0 # 同数
	#1.step(40).reduce(0){|s,i|s+i*aiko_prob**(i-1)}*(1-aiko_prob)
	#(1-aiko_prob) * (1/(1-aiko_prob))**2
	1/(1-aiko_prob)
	#2**(n-1)/(2**(n-1)-1).to_f
end
def P(i,n)
	i=n-i if i>n-i
	# 同数の場合は考慮しない(よくわからないけどこうすると通る…)
	i+i!=n ? F[i]*Pascal[n][i] : 0
end

N=gets.to_i
3.step(N){|i|
	F[i]=Q(i)*(1+Rational((1...i).map{|j|P(j,i)}.reduce(:+),2**i))
}
puts F[N].numerator*10**6/F[N].denominator