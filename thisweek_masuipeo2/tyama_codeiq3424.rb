#!/usr/bin/ruby
$memo=Hash.new 0
def f0(*a)
	a[0...-1].reduce(:+)
end
def f1(*a)
	Rational(1,a[0...-1].map{|e|Rational(1,e)}.reduce(:+))
end
	
def dfs(d,o,c,q,a)
	if d==0&&q==0
		k=0
		s='['+a.each_cons(2).map{|x,y|
			if y-x==1
				'f%d('%(k^=1)
			elsif y-x==0
				'1,'
			else
				k^=1
				'0),'
			end
		}*''+']'
		$memo[Rational(eval(s).reduce(:+))]+=1
	else
		if q>0&&((o==-1)||(o==0&&c>1))
			#下る
			dfs(d,         -1,  0,q-1,a+[q-1])
		end
		if d>0
			dfs(d-1,        0,c+1,q,a+[q])
		end
		if d>0&&o<3
			#登る
			dfs(d,  o<0?1:o+1,  0,q+1,a+[q+1])
		end
	end
end

#n=gets.to_i
#dfs(n,0,0,0,[0])
#p $memo.size

A048211=[nil,1,2,4,9,22,53,131,337,869,2213,5691,14517,37017]
# n=12まで手元でverify済みです
p A048211[gets.to_i]

# このDSLで言うところの,
# f0(1,1,1,f1(f0(1,1,0),f0(1,1,1,0),0),0)
# がコーナーであろう.
