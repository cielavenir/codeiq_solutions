#!/usr/bin/ruby
#coding:utf-8

puts [*1..7].permutation.min_by{|a|
	x=a[0]**( (a[1]*0.1+a[2]*0.1)**(-a[3]*0.1) - a[4]**(-a[5]-a[6]*0.1) )
	#[2, 1, 3, 4, 5, 7, 6]
	#p a
	#1.570612084833556e-08
	#p (x-Math::E).abs
}*' '
__END__
2 1 3 4 5 7 6

今回は浮動小数点で何とかなったので、楽でした。