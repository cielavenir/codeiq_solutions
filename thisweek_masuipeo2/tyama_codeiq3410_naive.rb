#!/usr/bin/ruby
class Array
	def unique_permutation(n=self.size)
		return to_enum(:unique_permutation,n) unless block_given?
		return if n<0||self.size<n
		a=self.sort
		loop{
			yield a[0,n]
			a=a[0,n]+a[n..-1].reverse
			k=(a.size-2).downto(0).find{|i|(a[i]<=>a[i+1])<0}
			break if !k
			l=(a.size-1).downto(k+1).find{|i|(a[k]<=>a[i])<0}
			a[k],a[l]=a[l],a[k]
			a=a[0,k+1]+a[k+1..-1].reverse
		}
	end
end

def c(n)
	n*(n.bit_length-2)
end
n=gets.to_i
bag=[[[]],nil,[[]]]
(2..12).each{|i|
	p k=c(1<<i)
	k.step(n,2){|j|
		bag[j]||=[]
		b=[]
		bag[j-k].each{|c|
			b<<c+[1<<i]
		}
		bag[j]+=b
	}
}
bag[n].each{|a|
	next if a.size>16
	a+=[2]*(16-a.size)
	a.unique_permutation{|b|
		#chk
	}
}
#p DATA.read.split.map{|e|c(e.to_i)}.reduce(:+)

__END__
4 8 2 4
2 16 32 2
32 128 64 16
4096 512 256 32
