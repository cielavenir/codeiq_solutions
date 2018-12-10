#!/usr/bin/env crystal
s=""
while !(l=gets).is_a?(Nil)
	s+=l[0]
end
puts s
