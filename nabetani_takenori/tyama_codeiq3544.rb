#!/usr/bin/ruby
#yhpgに出題されたとして、この処理を1時間以内で書ききるのは無理だった気がします。。

n=gets.to_i
(puts ([*2..13]-[4,7,10,13])*?,;exit)if n==1
R=[]
n-=2 # 0-indexed
q=1
k=0
while n>=4*k
	n-=4*k
	q+=4*k
	k=k*2+3
end

d,r=n.divmod(k) # q+d*k+rという表示にする
#同周
R<<(n>0 ? q+n-1 : q+4*k-1)
R<<(n<4*k-1 ? q+n+1 : q)
#外周1
R<<q+4*k+n*2+d*3 + 2
R<<q+4*k+n*2+d*3 + 3
if r==k-1 #角
	#外周2
	if n==4*k-1
		R<<q+4*k
		R<<q+4*k + 1
	else
		R<<q+4*k+n*2+d*3 + 5
		R<<q+4*k+n*2+d*3 + 6
	end
else
	#内周事前処理(よくわかってない)
	r-=2
	(r+=k-3;d-=1) if r<0
	d=3 if d<0
	#内周
	k=(k-3)/2
	q-=4*k
	R<<q+d*k+r/2
end
puts R.map(&:succ).sort*?,
