#!/usr/bin/ruby
class Array
	def unique_permutation(n=self.size)
		return to_enum(:unique_permutation,n) unless block_given?
		return if n<0||self.size<n
		a=self.sort
		loop{
			yield a[0,n]
			a=a[0,n]+a[n..-1].reverse
			k=(a.size-2).downto(0).find{|i|a[i]<a[i+1]}
			break if !k
			l=(a.size-1).downto(k+1).find{|i|a[k]<a[i]}
			a[k],a[l]=a[l],a[k]
			a=a[0,k+1]+a[k+1..-1].reverse
		}
	end
	def partial_sum
=begin
		s=[0]
		0.step(self.size-1){|i|s<<s[i]+self[i]}
		s
=end
		self.reduce([0]){|s,e|s<<s.last+e}
	end
end

N=6
P=([0]*N+[1]*N).unique_permutation.to_a # N=5のとき、permutation.to_a.uniqの70倍速
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
