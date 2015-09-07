#!/usr/bin/python
#coding:utf-8

# CodeIQ 'Approximate the golden ratio by common fraction' test code
from __future__ import division
from functools import reduce
from fractions import Fraction
import math
if __name__ == '__main__':
	# Please approximate the golden ratio by common fraction.
	# Digit of numerator and denominator must be less than or equal to 5.
	# 黄金比を分数で近似しましょう。ただし分子と分母とはいずれも整数であり、５桁以下とします
	# Fix this numerator and denominator to minimize approximation error.
	# 以下の分子と分母を、なるべく近似誤差が小さくなるように、値を求め直してください。
	frac=reduce(lambda s,i: 1+1/s,range(23),Fraction(1))
	numerator = frac.numerator #75025
	denominator = frac.denominator #46368
	
	real = (1+math.sqrt(5))/2
	approx = numerator / denominator
	print("%5d / %5d = %.15lf (Error=%.15lf)\n" %
		(numerator, denominator, approx, approx - real))