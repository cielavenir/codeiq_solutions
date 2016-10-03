#!/usr/bin/ruby

def popcnt(n)
	n==0 ? 0 : n%2+popcnt(n/2)
end
def lightsout(x,y)
	a=Array.new(x*y){Array.new(2)}

	#create problem
	x.times {|i|
		y.times {|j|
			a[i+j*x][0]=1<<(i+j*x)
			a[i+j*x][1]= 0 +
				(1<<(i+j*x)) +
				(i>0   ? 1<<(i-1+j*x) : 0) +
				(i<x-1 ? 1<<(i+1+j*x) : 0) +
				(j>0   ? 1<<(i+(j-1)*x) : 0) +
				(j<y-1 ? 1<<(i+(j+1)*x) : 0) +
				0
		}
	}

	#solve
	k=(x*y).times {|i|
		if a[i][1]&1<<i==0
			if (i+1).step(x*y-1) {|j|
				if a[j][1]&1<<i!=0
					a[i],a[j]=a[j],a[i]
					succ=1
					break
				end
			}
				#in 6*5 always breaks
				break i
			end
		end

		(x*y).times {|j|
			if i==j then next end
			if a[j][1]&1<<i!=0
				a[j][0]^=a[i][0]
				a[j][1]^=a[i][1]
			end
		}
	}

	#0解(quiet pattern)の集合tを用意する
	(k...x*y).each{|i|a[i][1]=1<<i}
	tmsk=(1<<k)-1
	t=[]
	a.each_with_index{|e,i|
		t<<(k==x*y ? '' : '%0*b'%[x*y-k,e[1]>>k]).chars
		e[0]&=tmsk
	}
	t=t.transpose.map{|e|e.reverse.join.to_i(2)}

	tlst=(1<<(x*y-k)).times.map{|l| # このメモリはあまり大きくならないはず
		r=0
		(x*y-k).times{|j|r^=t[j] if l[j]==1}
		r
	}	

	#全盤面に対し最短手数を計算する
	r=0
	(1<<k).times{|i_|
		next if popcnt(i_)*2>k
		#完全反転についても求め、最小値を取る
		c=[i_,i_^tmsk].map{|i|
			r0=0
			k.times{|j|r0^=a[j][0] if i[j]==1}
			#0解の重ね合わせをすべて試す
			c=(1<<(x*y-k)).times.map{|l|
				r1=r0
				(x*y-k).times{|j|r1^=t[j] if l[j]==1}
				r1^=tlst[l]
				popcnt(r1)
			}.min
			c
		}.min
		r=[r,c].max
	}
	p r
	#白一色か黒一色だったら0解の重ね合わせだけで解ける気もするのですが、
	#どちらでも良いとなると若干つらいところが
	#てか0解が3つ以上の場合の組合せ論がすでによくわからない^^;;
end

m,n=gets.split.map(&:to_i)
lightsout(m,n)
