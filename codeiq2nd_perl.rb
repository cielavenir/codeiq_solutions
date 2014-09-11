#!/usr/bin/ruby
#coding:utf-8

S=STDIN.tty? ? "CodeIQ 2nd Anniversary!\n" : STDIN.read
STR='(?{print"'+S+'"})'
a=STR.bytes
b=a.map{|e|
	0x60 <= e ? '@' :
	0x40 <= e ? '#' :
	'~'
}.join.bytes
puts "''=~('"+a.zip(b).map{|x,y|(x^y).chr}.join+"'^'"+a.zip(b).map{|x,y|y.chr}.join+"');"