#!/usr/bin/ruby
#coding:utf-8

n=gets.to_i
triangle=[0]
n.times{|i|
	triangle<<triangle[-1]+i+1
}
h=Hash.new(0)
1.upto(triangle.size-1){|i|
	(i-1).downto(0){|j|
		break if triangle[i]-triangle[j]>n
		h[triangle[i]-triangle[j]]+=1
	}
}
r=0
1.upto(n){|i|
	r+=h[i]*h[n/i] if n%i==0
}
p r
__END__
【コードの説明】
Nが、2つの(三角数-三角数)の積で表されれば良い。
なお、処理をさぼっているのでO(NlogN)ですが、ちゃんと書けばO(N)以下にできそうです。
【言語】
Ruby