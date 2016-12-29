#!/usr/bin/ruby
def getchildren(a)
	r=[[a[0],a[0]+a[1]]]
	r<<[a[1]-a[0],a[1]] if 2*a[0]<a[1]
	r
end
def getparent(a)
	2*a[0]<a[1] ? [a[0],a[1]-a[0]] : [a[1]-a[0],a[1]]
end
def getleft(a)
	return nil if a[0]==1
	n=0
	loop{
		x=getparent(a)
		f=getchildren(x)[1]==a
		n+=1
		a=x
		break if f
	}
	raise if getchildren(a).size<2
	a=getchildren(a)[0]
	n-=1
	n.times{
		a=getchildren(a)[-1]
	}
	a
end
def getright(a)
	n=0
	loop{
		return nil if a[1]==2
		x=getparent(a)
		y=getchildren(x)
		n+=1
		f=y.size>1 && y[0]==a
		a=x
		break if f
	}
	raise if getchildren(a).size<2
	a=getchildren(a)[1]
	n-=1
	n.times{
		a=getchildren(a)[0]
	}
	a
end

a=gets.split('/').map(&:to_i)
puts [getleft(a),getright(a)].map{|e|
	e ? e*'/' : '-'
}*','