#!/usr/bin/env ruby
T=[
	[0,0],[1,0],[2,0],
	[3,0],[3,1],[3,2],
	[3,3],[2,3],[1,3],
	[0,3],[0,2],[0,1],
]
def f(y,x)
	return 0 if y==x
	le=(y-x)%12
	if x%3!=0
		le+=x%3
	end
	(le-1)/3
end
#辺上にある線分は除外
a,b=gets.split.map{|e|e.bytes.sort.map{|b|b-97}}.reject{|x,y|
	s,t=T[x].zip(T[y])
	((s[0]==0||s[0]==3) && s[0]==s[1]) ||
	((t[0]==0||t[0]==3) && t[0]==t[1])
}.sort.uniq
if !a
	p 4
elsif !b
	puts [[a[1],a[0]],[a[0],a[1]]].map{|y,x|
		2+f(y,x)
	}.sort*','
elsif (a[1]-b[0])*(b[0]-a[0])>0 && (b[1]-a[1])*(a[1]-b[0])>0
	#線分aと線分bは交わる
	puts [[b[0],a[0]],[a[1],b[0]],[b[1],a[1]],[a[0],b[1]]].map{|y,x|
		3+f(y,x)
	}.sort*','
else
	q=(b[1]-b[0])%12+(a[1]-b[1])%12+(a[0]-a[1])%12+(b[0]-a[0])%12
	if q==24
		b[0],b[1]=b[1],b[0]
		q=(b[1]-b[0])%12+(a[1]-b[1])%12+(a[0]-a[1])%12+(b[0]-a[0])%12
		if q==24
			a[0],a[1]=a[1],a[0]
			q=(b[1]-b[0])%12+(a[1]-b[1])%12+(a[0]-a[1])%12+(b[0]-a[0])%12
			#p q
		end
	end
	puts [[b[1],b[0]],[a[1],b[1]],[a[0],a[1]]].map.with_index{|(y,x),i|
		(i==1 ? f(b[0],a[0])+[*a,*b].uniq.size : 2)+f(y,x)
	}.sort*','
end
