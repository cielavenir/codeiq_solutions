#!/usr/bin/ruby
#coding:utf-8

def search1(l)
	return to_enum(:search1,l) if !block_given?
	yield ''
	q=[['1',1]]
	loop{
		s,n=q.shift
		yield s+'0'
		q<<[s+'0',0]
		if n<l
			q<<[s+'1',n+1]
		end
	}
end

def search2(l)
	return to_enum(:search2,l) if !block_given?
	yield ''
	q=[['0',0]]
	loop{
		s,n=q.shift
		yield s
		q<<[s+'0',0]
		if n<l
			q<<[s+'1',n+1]
		end
	}
end

x,y=gets.split(',').map(&:to_i)

if x==1
	a1=search1(x)
	a1.next
	a1=y.times.map{a1.next.to_i(2)/2}
	p a1[-1]
else
	a1=search1(x).take([y/3,10].max)
	a2=search2(x).take([y/3,10].max)
	p a1.flat_map{|e|a2.map{|f|(e+'1'*x+f).to_i(2)}}.sort.uniq[y-1]
	#ここ、本当はO(n)でやりたい…
end