#!/usr/bin/ruby
class Integer
	def pow_binary_mod(y,m)
		x = self
		z = 1
		while y!=0
			z=z*x%m if y&1!=0
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
		a=1
		5.times{|_| #todo#
			a+=1
			a+=1 while a.gcd(n)!=1 #todo#
			r=a.pow_binary_mod(d,n)
			next if r==1||r==n-1
			if s.times.none?{|j|
				r=r.pow_binary_mod(2,n)
				r==n-1
			}
				return false
			end
		}
		return true
	end
	def rho3
		#get one divisor
		def rhonext(x,n,seed) (x*x+seed)%n end
		n=self
		#raise if n<2
		[1,3,5].each{|seed| #todo#
			x=y=1 #todo#
			q=i=1
			loop{
				if i==q
					y=x
					q*=2
				end
				x=rhonext(x,n,seed)
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
		r=[]
		while n>1
			if n.miller_rabin
				return r+[n]
			else
				x=n.rho3
				if !x
					STDERR.puts 'suspicious: %d'%n
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
		r=[]
		if n<0
			r<<-1
			n=-n
		end
		return r if n<2
		[2,3,5,7,11].each{|e| #todo#
			while n%e==0
				n/=e
				r<<e
			end
		}
		return r if n==1
		r+n.rho2
	end
end

m=gets.to_i
r=0
(1..m).each{|i|r+=(i**2+1).rho.uniq.reduce(1,:*)}
p r
