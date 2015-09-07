#!/usr/bin/python
from fractions import Fraction
N=7
dict={}
for i in range(1,N):
	for j in range(1,N): dict[Fraction(i,j)]=1
print(len(dict)+2) # 2: x=0 and y=0