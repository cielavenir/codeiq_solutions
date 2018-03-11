#!/usr/bin/ruby
#coding:utf-8

STR=STDIN.tty? ? "CodeIQ ４周年！\n" : STDIN.read
ctr=0
$><<'w'
STR.each_byte{|b|
	b=(b-'w'.ord)%256
	if b==0
		$><<'W'*(2+ctr)
		$><<'w'*(4+ctr)
		ctr+=1
	else
		$><<'W'*(3+ctr)
		$><<'w'*(4+ctr)
		ctr+=1
		(b-1).times{|i|
			$><<'W'*(3+ctr)
			$><<'w'
			ctr+=1
		}
		$><<'W'*(2+ctr)
		$><<'w'
		ctr+=1
	end
}