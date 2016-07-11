#!/usr/bin/python
from fractions import Fraction
N=int(input())
print(min(range(1,N+1),key=lambda i:[Fraction(N,N-i+1)-Fraction(i+N+2,2),i]))

# N=input();print max(range(1,N+1),key=lambda i:i+__import__('fractions').Fraction(2*N,~N+i))
# N=input();print max(range(1,N+1),key=lambda i:i+2.*N/(~N+i))