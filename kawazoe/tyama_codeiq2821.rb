#!/usr/bin/ruby
require 'prime'
def f(a,b)
	q=[a]
	depth={a=>0}
	back={a=>a}
	while !q.empty?
		cur=q.shift
		(1..9).each{|i|
			[(i.to_s+cur.to_s).to_i,cur*10+i].each{|nxt|
				if nxt<=b && nxt.prime? && !depth.has_key?(nxt)
					q<<nxt
					depth[nxt]=depth[cur]+1
					back[nxt]=cur
					if nxt==b
						#p nxt
						#while back[cur]!=cur
						#	p cur
						#	cur=back[cur]
						#end
						#p cur
						return depth[nxt]
					end
				end
			}
		}
		z=[cur/10]
		s=cur.to_s[1..-1]
		z<<s.to_i if s!='' && s[0]!='0'
		z.each{|nxt|
			if nxt.prime? && !depth.has_key?(nxt)
				q<<nxt
				depth[nxt]=depth[cur]+1
				back[nxt]=cur
			end
		}
	end
	-1
end

p f(*gets.split.map(&:to_i))