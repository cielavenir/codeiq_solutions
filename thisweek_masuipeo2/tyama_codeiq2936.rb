#!/usr/bin/ruby
C,N=gets.split.map(&:to_i)
p [*1..C].combination(N).count{|a|
if false
	(1...2**N).none?{|i|
		#与集合の中で
		b=a.select.with_index{|e,j|i[j]==1}
		#和が等しくなる切り方はあるか
		if true
			#総当り
			(2**b.size).times.any?{|j|
				x=0
				b.each_with_index{|e,k|x+=e*(j[k]*2-1)}
				x==0
			}
		else
			#ナップザック変形
			s=b.reduce(:+)
			next false if s%2>0
			bag=[true]+[false]*s
			b.each{|e|
				s.downto(e){|i|bag[i]||=bag[i-e]}
			}
			bag[s/2]
		end
	}
else
	#提出したアルゴリズムはこちら
	#左側、右側、使わないに分け、左側と右側が等しい場合
	#第一要素を右側に置く場合は考えなくて良いのは結城先生のチョコ問題でも有用な考え方
	(2*3**(N-1)).times.none?{|i|
		x=y=0
		N.times{|j|
			x+=a[j] if i%3==0
			y+=a[j] if i%3==2
			i/=3
		}
		x+y>0 && x==y
	}
end
}