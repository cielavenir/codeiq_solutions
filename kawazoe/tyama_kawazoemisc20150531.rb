#!/usr/bin/ruby
#http://riverplus.net/misc/20150531/

def solve_slow(n)
	m=1<<n
	s=(0...m).reduce(0){|s,i|
		r=0
		#0==black, 1==white
		prev=0
		while i>0
			nxt=i&1
			r+=1 if prev==0&&nxt==1
			prev=nxt
			i>>=1
		end
		s+r
	}
	Rational(s,m)
end
def solve_fast(n)
	Rational(n+1,4)
end
puts (1..18).map{|i|i.to_s+':'+solve_slow(i).to_s}

__END__
1:1/2
2:3/4
3:1/1
4:5/4
5:3/2
6:7/4
7:2/1
8:9/4
9:5/2
10:11/4
11:3/1
12:13/4
13:7/2
14:15/4
15:4/1
16:17/4
17:9/2
18:19/4

規則性を考えると、Rational(n+1,4)となる(答：250000)。