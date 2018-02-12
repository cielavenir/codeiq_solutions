#!/usr/bin/env python
#https://qiita.com/Nabetani/items/7baf181b4a1b7eacc79a
#http://nabetani.sakura.ne.jp/hena/orde20maze/
from scipy import sparse
t='12 23 34 45 06 28 4A 67 78 9A 9F AG BH CD DJ EK HN IJ JK KL MN IO JP MS NT QR RS OU QW TZ UV VW XY YZ'
t0=[[int(c,36) for c in e] for e in t.split()]
A={int(e[0],36):[int(c,36) for c in e[1]] for e in [['a','7D'],['b','EF'],['c','GM'],['d','AB']]}

import sys
while True:
	l=sys.stdin.readline()
	if not l: break
	line=[int(c,36) for c in l.strip()]
	T=tuple(zip(A[line[0]],*t0))
	a=sparse.csgraph.dijkstra(sparse.csr_matrix(([1]*len(T[0]),T),[36]*2),0,line[1])
	print(int(a[line[2]]))
	sys.stdout.flush()
