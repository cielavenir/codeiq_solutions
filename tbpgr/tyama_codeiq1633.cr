#!/usr/bin/env crystal
#if defined?(RUBY_VERSION) #このやりかただと駄目っぽい(undefined constantおよびundefined method 'defined?')
#	class Object
#		def itself() self end
#	end
#end
#てか、コンパイル時フラグが「ifdef」な時点でRubyは死亡.

#[2]は(Object#sendが存在しないことが分かった今や)だみーです.
a=[
	{15,->(s : String){s.capitalize},:capitalize},
	{5,->(s : String){s.upcase},:upcase},
	{3,->(s : String){s.downcase},:downcase},
	{1,->(s : String){s.itself},:itself},
]
s=gets
if s
	puts (a.find{|e|s.char_at(0).ord % e[0] == 0}.not_nil![1]).call(s)
	#puts s.send(a.find{|e|s.char_at(0).ord % e[0] == 0}.not_nil![2]) # Object#sendは存在しないらしい
end