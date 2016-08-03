#!/usr/bin/ruby
#coding:utf-8
def mul(a,b)
	raise if a.size!=b.size
	r=[0]*a.size
	a.size.times{|i|
		b.size.times{|j|
			r[(i+j)%a.size]+=a[i]*b[j]
		}
	}
	r
end

T=[0,1,5,10,20]
M=8

h={}
T.repeated_permutation(4){|a|h[a.reduce(:+)]=1}
a=[0]*M
h.each_key{|k|a[k%M]+=1}
e=[1]+[0]*(M-1)
n=gets.to_i # 30000までは余裕で計算できます
while n>0
	e=mul(e,a) if n%2>0
	a=mul(a,a)
	n/=2
end
p e[0]