#!/usr/bin/ruby
if RUBY_VERSION<'2.2'
	class Object
		def itself() self end
	end
end
a=[
	[15,:capitalize],
	[5,:upcase],
	[3,:downcase],
	[1,:itself],
]
s=gets
puts s.send(a.find{|e|s.ord%e[0]==0}[1])