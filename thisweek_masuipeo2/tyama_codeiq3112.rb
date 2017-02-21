#!/usr/bin/env ruby
def f(n) (n>=10?f(n/10):0)+n%10 end
a,b=gets.split.map(&:to_i);r=0;s=0
#(a..b).map{|e|f(e)}.reduce(:+)
x,y,z=a,b,s
while x<=b
	(y+=1;z+=f(y)) if z<=s
	(y+=1;z+=f(y)) while z<s
	(z-=f(x);x+=1) while z>s
	r+=1 if z==s&&x<=b
end
x,y,z=a,b,s
while y>=a&&x>0
	(x-=1;z+=f(x)) if z<=s&&x>0
	(x-=1;z+=f(x)) while z<s&&x>0
	(z-=f(y);y-=1) while z>s
	r+=1 if z==s&&y>=a
end
p r
