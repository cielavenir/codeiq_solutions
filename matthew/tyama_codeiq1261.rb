#!/usr/bin/ruby
#derived from AOJ 0041
require 'rational'

#https://github.com/rubyworks/facets/pull/92
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
end

class String
	def integer?
		Integer(self)!=nil rescue false
	end
end

def dfs(a,&block)
	return to_enum(:dfs,a) if !block_given?
	yield [a[0],a[0].to_s] if a.size<2
	(a.size-1).times{|i|
		dfs(a[0..i]){|l|
			dfs(a[i+1..-1]){|r|
				yield [l[0]+r[0],%Q((#{l[1]} + #{r[1]}))]
				yield [l[0]-r[0],%Q((#{l[1]} - #{r[1]}))]
				yield [l[0]*r[0],%Q((#{l[1]} * #{r[1]}))]
				yield [l[0].is_a?(Rational) || r[0].is_a?(Rational) ? l[0]/r[0] : Rational(l[0],r[0]),%Q((#{l[1]} / #{r[1]}))] if r[0]!=0
				#yield ["#{l[0]}#{r[0]}".to_i,%Q(#{l[1]}#{r[1]})] if l[1].integer? and r[1].integer?
			}
		}
	}
end

[1,1,5,8].unique_permutation{|e|
	dfs(e){|f|
		n=f[0]
		n=f[0].numerator if f[0].denominator==1
		if n==10
			puts f[1]
		end
	}
}