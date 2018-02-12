#!/usr/bin/ruby
#coding:utf-8

class Integer
    def isqrt
        return 0 if self<=0
        return 1 if self<4 # 1
        x,y=0,self
        while x!=y&&x+1!=y
            x,y=y,(self/y+y)/2
        end
        x
    end
end

def chk2(a,z)
	x=4*a*a+4*a+1-8*z
	y=x.isqrt
	y*y==x
end

def chk(z)
	β=1
	while β*β<2*z
		if 2*z%β==0
			α=2*z/β
			if (α-β)%2>0 && α-β>=3
				a=(α-β-1)/2
				return true if chk2(a,z)
			end
		end
		β+=1
	end
=begin
	a=1
	loop{
		#x=4*a*a+4*a+1+8*z
		#break if a>z #x>=8*z*z
		y=x.isqrt
		if y*y==x
			return true if chk2(a,z)
		end
		a+=1
	}
=end
	false
end

p Enumerator.new{|y|
	(1..1/0.0).each{|z|y<<z if chk(z)}
}.take(gets.to_i).last

__END__
等差数列の和を考慮すると、与zに対し正整数a,n,mの存在を判定する問題となる。制約条件は、
n/2(2a+n+1) == m/2(2a-m+1) == z
である。
なお、aは下側の数列の最大値である。(例：z=15,a=6,n=2,m=3)
式を変形すると、２次方程式の判別式であるところの、
(2*a+1)**2+8*z および (2*a+1)**2-8*z が平方数であるかを判定すれば良いことになる。
n,mに対しaだけは直接求められず列挙が必要になるが、
(α+β)^2-(α-β)^2 == 4αβ [ai.2ch math/1463594522/]
という性質を使えば、
αβ == 2z (α,βは整数、α>β)として、α-β == 2a+1 と書けるため、O(√z)で探索できる。
残りは (2*a+1)**2-8*z であるが、こちらはO(logD)で(整数)平方根を取り判定するのが良策に見える。
よって、計算量は、求める値をNとすれば、1からNまでのzに対しO(√z)のため、合わせてO(N√N)となり、十分高速である。
(実行くんで350(答えは43605)まで可能)
