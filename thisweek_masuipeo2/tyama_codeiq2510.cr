#!/usr/bin/env crystal
T1=[
	[[1]],
	[[2],[2]],
	#[[3],[3],[3]],
	[[6,6],[6,6],[6,6]],
]
T2=[
	[[1]],
	[[2],[2]],
	[[4,4],[4,4]],
]

$memo={} of Array(Int32) => Int64
def dfs_naive2(t,m,x,y)
	if x==0 && y==m.size
		return 1
	end
	m0=m.flatten
	if $memo.has_key?(m0)
		return $memo[m0]
	end
	if x==m[y].size
		return dfs_naive2(t,m,0,y+1)
	end
	if m[y][x]!=0
		return dfs_naive2(t,m,x+1,y)
	end
	r=0_i64
	t.each{|e|
		if e.size.times.all?{|y0|e[y0].size.times.all?{|x0|
			y+y0<m.size && x+x0<m[y+y0].size && m[y+y0][x+x0]==0
		}}
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=1}} # e[y0][x0]}}
			r+=dfs_naive2(t,m,x+1,y)
			e.size.times{|y0|e[y0].size.times{|x0|m[y+y0][x+x0]=0}}
		end
	}
	$memo[m0]=r
end
def dfs_naive(t,m,x,y)
	$memo.clear
	dfs_naive2(t,m,x,y)
end

W=12
x1t=(0..W).map{|w|
	h=3
	m=h.times.map{[0]*w}.to_a
	dfs_naive(T1,m,0,0).to_i64
}.to_a
x1=(0..W).map{|w|
	r=0_i64
	(1<<w).times{|i|
		a=[-1]
		w.times{|j|a<<j if (i&(1<<j))!=0}
		a<<w
		r0=1_i64
		a.each_cons(2).each{|e|
			n=e[1]-e[0]-1
			r0*=x1t[n]
		}
		r+=r0
	}
	r
}.to_a
x2=(0..W).map{|w|
	h=2
	m=h.times.map{[0]*w}.to_a
	dfs_naive(T2,m,0,0).to_i64
}.to_a
r=0_i64
(1<<W).times{|i|
	a=[-1]
	W.times{|j|a<<j if (i&(1<<j))!=0}
	a<<W
	r0=1_i64
	a.each_cons(2).each{|e|
		n=e[1]-e[0]-1
		r0*=x1[n]*x2[n]
	}
	r+=r0
}
#p x1
#p x2
p r

# 答え: 2754844344633通り

# ナイーブに計算したのでは時間がかかりすぎる。
# まず、5人グループをどこに置くか考える(1<<12通り)。
# 置いた後の間隔の一覧をn in aとすれば、置き方の数の合計は、
# (上側幅nの1,2,3,6人席の置き方)*(下側幅nの1,2,4人席の置き方)の積として表される。
# この積を1<<12回求め、和を取れば、答えとなる。
# 「上側幅nの1,2,3,6人席の置き方」を求めるのも若干困難なので、
# 同様の考え方で、先に3人グループを置き、その間隔に1,2,6人席を置く方法を求めた。
# これはコード中ではx1tを求める操作に該当し、ここが最大律速である。
# Ruby 2.0だと3分15秒。
# Crystalに移植したところ21秒を要した。
# 備考：dfs_naive()はCodeZine問題のRuby答案。