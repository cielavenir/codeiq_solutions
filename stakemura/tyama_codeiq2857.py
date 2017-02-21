#!/usr/bin/python
Z=0
if Z==0:
	#40000
	cost = 150
	price = 300
	waste = 30
	quantity = [
		10000, 20000, 40000, 60000
	]
	demand_dist = [
		(10000, 0.1),
		(20000, 0.35),
		(40000, 0.3),
		(60000, 0.25)
	]
elif Z==1:
	#700
	cost = 200
	price = 500
	waste = 10
	quantity = [
		300, 500, 700, 900
	]
	demand_dist = [
		(200, 0.2),
		(450, 0.3),
		(700, 0.4),
		(950, 0.1),
	]
elif Z==2:
	#12000
	cost = 20
	price = 100
	waste = 10
	quantity = [
		10000, 12000, 14000, 18000, 20000
	]
	demand_dist = [
		(2400, 0.1),
		(6000, 0.5),
		(12000, 0.3),
		(24000, 0.1),
	]
elif Z==3:
	#8000
	cost = 80
	price = 400
	waste = 20
	quantity = [
		2000, 4000, 6000, 8000, 10000
	]
	demand_dist = [
		(1000, 0.4),
		(2000, 0.1),
		(7000, 0.3),
		(10000, 0.2),
	]

def calc(q):
	s=x=0
	for e in demand_dist:
		n=min(e[0],q)
		s+=price*n*e[1]
		x+=waste*max(q-n,0)*e[1]
	return s-q*cost-x

print(max(quantity,key=calc))