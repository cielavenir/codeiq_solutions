#!/usr/bin/env crystal
class Array(T)
	def unique_permutation(n=self.size) : Channel(Array(T))
		nxt=Channel(Array(T)).new
		spawn{
			if n<0||self.size<n
				nxt.close
				next
			end
			a=self.sort
			loop{
				nxt.send a[0,n]
				a=a[0,n]+a[n..-1].reverse
				k=(a.size-2).downto(0).find{|i|a[i]<a[i+1]}
				if k.is_a?(Nil)
					nxt.close
					break
				end
				l=(a.size-1).downto(k+1).find{|i|a[k]<a[i]}.not_nil!
				a[k],a[l]=a[l],a[k]
				a=a[0,k+1]+a[k+1..-1].reverse
			}
		}
		nxt
	end
end

class Channel(T)
	include Iterator(T)
	def next
		begin
			receive
		rescue ClosedError
			stop
		end
	end
end

N=6
P=([0]*N+[1]*N).unique_permutation.to_a # N=5のとき、permutation.to_a.uniqの70倍速
#各Pは経路を表す。1が縦、0が横を表す。
r=0
P.each{|e0|
	P.each{|f0|
		flg=0
		zero1=0
		zero2=N
		one1=0
		one2=N
		(N*2).times{|i|
			zero1 += e0[i]==0 ? 1 : 0
			one1  += e0[i]==1 ? 1 : 0
			zero2 -= f0[N*2-1-i]==0 ? 1 : 0
			one2  -= f0[N*2-1-i]==1 ? 1 : 0
			flg+=1 if zero1==zero2
			flg+=1 if one1==one2
		}
		r+=1 if flg>=2
	}
}
p r # 527552
