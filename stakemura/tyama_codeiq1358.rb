#!/usr/bin/ruby
#coding:utf-8

# CodeIQ 'Approximate the golden ratio by common fraction' test code
if __FILE__ == $0
	# Please approximate the golden ratio by common fraction.
	# Digit of numerator and denominator must be less than or equal to 5.
	# 黄金比を分数で近似しましょう。ただし分子と分母とはいずれも整数であり、５桁以下とします
	# Fix this numerator and denominator to minimize approximation error.
	# 以下の分子と分母を、なるべく近似誤差が小さくなるように、値を求め直してください。
	frac=23.times.reduce(Rational(1)){|s,i|1+1/s}
	numerator = frac.numerator #75025
	denominator = frac.denominator #46368
	
	real = (1+Math.sqrt(5))/2
	approx = numerator*1.0 / denominator
	puts "%5d / %5d = %.15f (Error=%.15f)\n" %
		[numerator, denominator, approx, approx - real]
end