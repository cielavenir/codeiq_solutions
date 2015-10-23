#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

def egcd(x,y):
	if y==0: return (x,1,0)
	g,a,b=egcd(y,x%y)
	return (g,b,a-x//y*b)
def mod_inverse(n,m):
	g,a,b=egcd(n,m)
	if g!=1: return None
	return a%m

M=1000000
REV3=mod_inverse(3,M)
n=int(raw_input())
print((pow(16,n,M)-1)*2*REV3%M)