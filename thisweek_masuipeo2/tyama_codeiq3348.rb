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

SIMPLIFIED=false
A=10;B=10
def calc(a)
	### paiza ###
	b=[]
	f=0
	st=sp=0
	a.each{|e|
		b<<e
		if e==B&&f==0 then b<<0 else f^=1 end
	}
	b<<0 if b.size&1==1
	b=b.each_slice(2).to_a
	if !SIMPLIFIED
		# if nil is returned here, a does not satisfy valid bowling score sequence.
		return nil if b.size<A || A+2<b.size
		if b[A-1]==[B,0] then b[A-1]=[B] end
		if b[A]==[B,0] then b[A]=[B] end
		if b[A+1]==[B,0] then b[A+1]=[B] end
		while b.size>A
			b[A-1]+=b.delete_at(A)
		end
		if b[A-1].size==4&&b[A-1][3]==0
			b[A-1].pop
		end
		return nil if b[A-1].size>3
		return nil if b[A-1].size<2
		if b[A-1].size==2
			return nil if b[A-1][0]+b[A-1][1]>=10
		end
		if b[A-1].size==3
			return nil if b[A-1][0]<10&&b[A-1][0]+b[A-1][1]!=10
		end
	end
	while b.size<A+4
		b<<[0,0]
	end
	c=[]
	0.step(A+1){|i|
		if b[i][0]==B
			if b[i+1][0]==B then c[i]=2*B+b[i+2][0] else c[i]=B+b[i+1][0]+b[i+1][1] end
		else
			c[i]=b[i][0]+b[i][1]
			if c[i]==B then c[i]+=b[i+1][0] end
		end
	}
	c[A-1]=b[A-1].reduce(:+) if !SIMPLIFIED
	c.reduce(:+)
end

### main

st,sp=gets.split.map &:to_i
nmax=12-st-sp
hi=-Float::INFINITY
lo=Float::INFINITY
#ストライク・スペアでないフレームの数は総当たりとする。ストライクやスペアが10フレームに入るか否かで処理が異なるためである。
(0..nmax).each{|n|
	(st.times.map{[10]}+sp.times.map{[9,1]}+n.times.map{[9,0]}).unique_permutation{|a|
		x = calc a.flatten
		hi = [hi,x].max if x
	}
}
(0..nmax).each{|n|
	(st.times.map{[10]}+sp.times.map{[0,10]}+n.times.map{[0,0]}).unique_permutation{|a|
		x = calc a.flatten
		lo = [lo,x].min if x
	}
}
#p hi
#p lo
p hi-lo
