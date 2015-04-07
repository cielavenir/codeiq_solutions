#!/usr/bin/python
#coding:utf-8
import sys,math
if sys.version_info[0]>=3: raw_input=input

#多項式乗算
#mul([2,1,1],[1,4,3]) => [2, 9, 11, 7, 3]
#(2+x+x^2)*(1+4x+3x^2) is 2+9x+11x^2+7x^3+3x^4
#cf. http://www.checkio.org/mission/simplification/publications/ciel/python-3/first/share/c884eccc1acbb9ed3b4b9b51cc6d9d64/
def add(a,b):
	m=max(len(a),len(b))
	return [(0 if len(a)<=i else a[i])+(0 if len(b)<=i else b[i]) for i in range(m)]
def mul(a,b):
	r=[]
	for i in range(len(b)):
		r=add(r,[0]*i+[b[i]*e for e in a])
	return r

def calc(a,t):
	r=0
	for i,e in enumerate(a): r+=e*t**i
	return math.sqrt(r)

def interpolate_catmull_rom(p0, p1, p2, p3):
	c1 = (-p0 + 3 * p1 - 3 * p2 + p3) / 2.0
	c2 = (2 * p0 - 5 * p1 + 4 * p2 - p3) / 2.0
	c3 = (-p0 + p2) / 2.0
	c4 = (2 * p1) / 2.0
	#return [c4,c3,c2,c1] #c4+c3*t+c2*t**2+c1*t**3
	return [c3,2*c2,3*c1] #c3+2c2*t+3c1*t**2

if __name__=='__main__':
	num=1000
	points=[]
	try:
		while True:
			points.append([float(e) for e in raw_input().split(',')])
	except EOFError:
		points.pop()
		s=0
		for j in range(len(points)):
			a=interpolate_catmull_rom(*[points[(j+i)%len(points)][0] for i in range(4)])
			b=interpolate_catmull_rom(*[points[(j+i)%len(points)][1] for i in range(4)])
			c=add(mul(a,a),mul(b,b))
			#s+=integrate(sqrt(c[0]+c[1]*t+c[2]*t**2+c[3]*t**3+c[4]*t**4),t,0,1)
			for i in range(num):
				t1=i*1.0/num
				t2=(i+1)*1.0/num
				#s+=calc(c,t1)/num # rectangular
				#s+=(t2-t1)/2*(calc(c,t1)+calc(c,t2)) #trepezoidal
				s+=(t2-t1)/6*(calc(c,t1)+4*calc(c,(t1+t2)/2)+calc(c,t2)) #simpson
		print(s)

#6252.38460294
#http://ideone.com/q0XAyI