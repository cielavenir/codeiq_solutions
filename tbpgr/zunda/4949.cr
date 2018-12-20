#!/usr/bin/env crystal
def isqrt(n)
	return 0 if n<=0
	return 1 if n<4 # 1
	x,y=0,n
	while x!=y&&x+1!=y
		x,y=y,(n/y+y)/2
	end
	x
end

def isPrime(i)
	return false if i<2
	(2..isqrt(i)).each{|j|
		if i%j<1
			return false
		end
	}
	true
end

def is4949(i)
	return false if i<=0
	return true if i%10==4||i%10==9
	is4949(i/10)
end

n=gets.not_nil!.to_i
i=2
cnt=0
while cnt<n
	if is4949(i)&&isPrime(i)
		print i
		if cnt<n-1
			print ","
		else
			puts
		end
		cnt+=1
	end
	i+=1
end
