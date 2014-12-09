#!/usr/bin/ruby
#coding:utf-8

STR=STDIN.tty? ? "CodeIQ ２周年！\n" : STDIN.read
last=0
siz=STR.bytes.to_a.size
please=(siz+3)/4-2
puts "DO ,1 <- ##{siz}"
STR.each_byte.with_index{|e,i|
	c = e
	c = (c & 0x55) << 1 | (c & 0xaa) >> 1
	c = (c & 0x33) << 2 | (c & 0xcc) >> 2
	c = (c & 0x0f) << 4 | (c & 0xf0) >> 4
	last2 = c
	c = (last-c)&0xff
	last = last2
	if c!=0
		print 'PLEASE ' if i<=please
		puts "DO ,1 SUB ##{i+1} <- ##{c&0xff}"
	end
}
puts 'PLEASE READ OUT ,1'
print 'PLEASE GIVE UP'

__END__
[cesspool.c]
unsigned int lastout = 0;
c = lastout - a[i];
lastout = c;
c = (c & 0x0f) << 4 | (c & 0xf0) >> 4;
c = (c & 0x33) << 2 | (c & 0xcc) >> 2;
c = (c & 0x55) << 1 | (c & 0xaa) >> 1;
putchar(c);