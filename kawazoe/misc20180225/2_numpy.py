#!/usr/bin/python
#coding:utf-8
import sys
import numpy
N=-~int(sys.stdin.readline())//2*2-1 # 奇数の最大
N2=N+1>>1 # 和の最大の平方根

# 最大がN2を越えないピタゴラス数の列挙
P=numpy.array(list(zip([-1,-2,2],[-2,-1,2],[-2,-2,3])))
B=numpy.array([[-1,1,1],[1,-1,1],[-1,-1,1]])
Q=[numpy.array([3,4,5])]
r=N2 # n==0を例外扱い
while Q:
	c=Q.pop()
	r+=N2//c[-1]*2
	m=(c*B).dot(P)
	for i in range(3):
		if m[i,-1]<=N2: Q.append(m[i,:])
print(r)
# 10000000 => 27368012
