#!/usr/bin/python
#coding:utf-8
def mul(a,b):
	assert len(a)==len(b)
	r=[0]*len(a)
	for i in range(len(a)):
		for j in range(len(b)):
			r[(i+j)%len(a)]+=a[i]*b[j]
	return r

T=[0,1,5,10,20]
M=8

import sys,itertools

h={}
for a in itertools.combinations_with_replacement(T,4):
	h[sum(a)]=1
a=[0]*M
for k in h:a[k%M]+=1
e=[1]+[0]*(M-1)
n=int(sys.stdin.readline()) # 30000までは余裕で計算できます
while n:
	if n%2:e=mul(e,a)
	a=mul(a,a)
	n//=2
print(e[0])