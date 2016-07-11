#!/usr/bin/python
import random

T={
98: 91,
97: 93,
96: 94,
84: 73,
75: 61,
67: 56,
53: 48,
3: 8,
13: 19,
21: 32,
33: 46,
42: 58,
51: 70,
68: 89
}

N=10001
A=[]
for _ in range(N):
	i=0
	n=1
	while n<100:
		roll=random.randint(1,6)
		n+=roll
		if n in T: n=T[n]
		i+=1
	A.append(i)
print(sorted(A)[N/2])

# 27