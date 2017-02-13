#!/usr/bin/env crystal
require "big_int"
struct BigInt
	def pow_binary_mod(y : BigInt,m : BigInt) : BigInt
		x = self
		z = BigInt.new(1)
		while y != 0
			z=z*x%m if y&1 != 0
			x=x*x%m
			y>>=1
		end
		z
	end
	def miller_rabin
		n=self.abs #todo#
		return true if n==2
		return false if n==1||n%2==0
		d=n-1
		s=0
		while d%2==0
			d/=2
			s+=1
		end
		a=BigInt.new(1)
		5.times{|z| #todo#
			a+=1
			while a.gcd(n) != 1; a+=1 end #todo#
			r=a.pow_binary_mod(d,n)
			next if r==1||r==n-1
			if s.times.all?{|j|
				r=r.pow_binary_mod(BigInt.new(2),n)
				r != n-1
			}
				return false
			end
		}
		return true
	end
	def rho3
		#get one divisor
		rhonext=->(x : BigInt,n : BigInt,seed : BigInt){(x*x+seed)%n}
		n=self
		#raise if n<2
		[1,3,5].each{|seed| #todo#
			x=y=BigInt.new(1) #todo#
			q=i=1
			loop{
				if i==q
					y=x
					q*=2
				end
				x=rhonext.call(x,n,BigInt.new(seed))
				d=(x-y).abs.gcd(n)
				if d>1
					break if d==n
					return d
				end
				i+=1
			}
		}
		nil
	end
	def rho2
		#get all divisors
		n=self
		#raise if n<2
		r=[] of BigInt
		while n>1
			p [n,n,miller_rabin]
			if n.miller_rabin
				return r+[n]
			else
				x=n.rho3
				if !x
					STDERR.puts "suspicious: %d"%n
					return r+[n]
				end
				r+=x.rho2
				n/=x
			end
		end
		r
	end
	def rho
		n=self
		r=[] of BigInt
		if n<0
			r << BigInt.new(-1)
			n=-n
		end
		return r if n<2
		[2].each{|e| #todo#
			while n%e==0
				n/=e
				r<<BigInt.new(e)
			end
		}
		return r if n==1
		r+n.rho2
	end
end
N=BigInt.new("280671392065546467397265294532969672241810318954163887187279320454220348884327")
table=N.rho
l=table.size
p table
m=N*2+1
r=Array(Array(BigInt)).new
(3**(l-2)*2).times{|i|
	table2=Array.new(3){|a|a=[] of BigInt}
	table.each_with_index{|e,j|table2[i/3**j%3]<<e}
	edge=table2.map{|e|e.reduce(1){|s,f|s*f}}
	surface=edge[0]*edge[1]+edge[1]*edge[2]+edge[2]*edge[0]
	if surface<m
		m=surface
		r=table2
	end
}

puts r.map{|e|e.reduce(1){|s,f|s*f}}.sort.join("x")

#56412637156759097412131861x63634925160141537479761109x78185498323479435878944223
