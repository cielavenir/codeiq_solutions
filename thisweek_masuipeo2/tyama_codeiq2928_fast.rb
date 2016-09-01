#!/usr/bin/ruby
#coding:utf-8

#Harmonic Series
#https://oeis.org/A002387
r=0
n=gets.to_i
p (1..1/0.0).find{|i|
	n<r+=1.0/i
}