#!/usr/bin/ruby
#coding:utf-8

def comb(n,k)
	r=1
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end
def perm(n,k)
	r=1
	k.times{|i|
		r=r*(n-i)
	}
	r
end
def fact(n)
	(1..n).reduce(1,:*)
end
N=gets.to_i
r=0
(1..N).each{|i|
	#後ろから見てi冊整列されているとき(例：N=4のとき、間を気にせずCDが順番通りに並んでいてかつCより左にBがないなら2冊)
	#(N-i)冊の移動が必要で、その場合の並べ方は、
	#N箇所から(i+1)箇所選び(comb(N,i+1)通り)、
	#その中で一番左以外に、整列されていない本で一番IDが大きい物を置く(例：B)(i通り)
	#残った(N-i-1)箇所に残りの本を詰めればよい(fact(N-i-1)通り)
	r+=(N-i)*comb(N,i+1)*i*fact(N-i-1)
	#r+=i*perm(N,i+1)/(N-i+1)
	#なお、問題文の定義より、0冊整列されている状態は存在しない。
}
p r
# 追記:angel氏の解説見て思いましたが、「(N-i)*comb(N,i+1)*fact(N-i-1)」は「i*perm(N,i+1)/(N-i+1)」に等しいです。