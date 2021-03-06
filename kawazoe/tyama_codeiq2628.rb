#!/usr/bin/ruby
while s=gets
	a,b=s.split.map(&:to_i)
	n=b**2-a**2
	break if n==0
	r=0
	(1..1/0.0).each{|i|
		x=n-i*(i-1)
		break if x/i/2<=0
		if x%i==0&&x/i%2==1
			#p [x/i/2,x/i/2+i]
			r+=x/i/2 + x/i/2+i
		end
	}
	p r
end
__END__
[コードの説明]
平方数は1+3+5+7+...と表わされることに注意して、ステップ・アップ・サム問題へと帰着する。
たとえば72が7+9+11+13+15+17で表せるとした場合に、72 - (0+2+4+6+8+10) - 6*7=0と書ける。6は真ん中の和の項数を意味する。
よって、nをiで割った余りとi*(i-1)をiで割った余りが一致するかどうか、すなわちnがiで割り切れるかどうかで、nがi個の数字の和で表せるかどうかを判定することができる。
また、最初の式で6に掛けられている7はそのまま初項である。
ただし、たとえば2400は44+46+48+...+106と表すことができるが、各項が偶数のため、無効である。
よって、xをiで割った商(=初項)が奇数であることを確かめる必要がある。
項数はO(√n)なので、全探索しても時間制限には十分間に合う。