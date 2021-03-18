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
			nxt.send a[0,n]
			loop{
				a=a[0,n]+a[n..-1].reverse
				k=(a.size-2).downto(0).find{|i|a[i]<a[i+1]}
				if k.is_a?(Nil)
					nxt.close
					break
				end
				l=(a.size-1).downto(k+1).find{|i|a[k]<a[i]}.not_nil!
				a[k],a[l]=a[l],a[k]
				a=a[0,k+1]+a[k+1..-1].reverse
				nxt.send a[0,n]
			}
		}
		nxt
	end
	def partial_sum
		self.reduce([0]){|s,e|s<<s.last+e}
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
P=([0]*N+[1]*N).unique_permutation.to_a
#各Pは経路を表す。1が縦、0が横を表す。
r=0
P.each{|e0|
	e = e0.partial_sum
	#数学の座標系のように左下をA、右上をBとすると、eの各インデックスiにおいて、x座標がi-e[i]、y座標がe[i]となる。
	P.each{|f0|
		f = f0.partial_sum
		r+=1 if (N*2).times.none?{|i|
			#i番目の座標とi+1番目の座標が等しければ、「道に重複がある」とみなせる。
			e[i]==f[i] && e[i+1]==f[i+1]
		}
	}
}
p r # 100360
