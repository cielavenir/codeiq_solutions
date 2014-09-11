#!/usr/bin/ruby
#coding:utf-8

def gen_label(n)
	raise 'gen_label' if !n.is_a?(Integer) || n<0
	n.to_s(2).tr('01'," \t")+"\n"
end

def gen_number(n)
	raise 'gen_number' if !n.is_a?(Integer)
	(n<0 ? "\t" : ' ')+gen_label(n.abs)
end

STR=STDIN.tty? ? "CodeIQ ２周年！\n" : STDIN.read
STR.each_byte{|e|
	c = e
	print '  '+gen_number(c)
	print "\t\n  "
}
#ideoneだと正常終了時に末端に変な出力がある。
#なのでCodeIQの問題では(一部例外を除き)正常終了させてはいけないというローカルルールがある。
#print "\n\n\n"