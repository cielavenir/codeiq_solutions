#!/usr/bin/ruby
n=gets.to_i
if n==2
	#傾き0と∞になるので特別扱い
	p 6
else
	r=0
	(1...n).each{|x|(x...n).each{|y|
		next if x.gcd(y)>1
		#1以上の傾きを列挙(gcdを取る)
		pat=0
		(0...n-x).each{|sx|(0...n-y).each{|sy|
			ex=sx+x;ey=sy+y
			pat+=1 if (sx-x<0||sy-y<0) && (n<=ex+x||n<=ey+y)
		}}
		r+=pat*4
	}}
	p r-4 #傾きがちょうど1の場合、patを1個多く数えてしまう
end

# O(n^2 Σφ(i))なので、O(n^4)よりは若干早い程度か。
