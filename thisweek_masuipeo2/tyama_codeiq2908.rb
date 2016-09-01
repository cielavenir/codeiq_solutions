#!/usr/bin/ruby
#coding:utf-8

def f(m,n,mi)
	#m人でn票を分ける組み合わせ
	#ただし昇順になっていて、かつ最低mi票
	#m==2,n==6なら、(5,1),(4,2),(3,3)
	raise if n<mi
	return 1 if m==1
	r=0
	(mi..n/m).each{|i|
		r+=f(m-1,n-i,i)
	}
	r
end

m,n=gets.split.map(&:to_i)
if m==1
	p 1
	exit
end
r=0
d=1
while m*d<=n
	#m人のうち1人をd票に固定
	r+=f(m-1,n/d-1,1) if n%d==0
	d+=1
end
p r