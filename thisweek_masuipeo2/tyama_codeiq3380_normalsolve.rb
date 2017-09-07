#!/usr/bin/ruby
def copy(a)
	a.map(&:dup)
end
def solve(a)
	q=[a]
	depth={a=>0}
	while !q.empty?
		c=q.shift
		n=depth[c]
		[[0,1],[0,2],[1,0],[1,2],[2,0],[2,1]].each{|from,to|
			if !c[from].empty?
				c[to].unshift c[from].shift
				if (c[to].size==1||c[to][0]<c[to][1]) && !depth.has_key?(c)
					nxt=copy(c)
					q<<nxt
					depth[nxt]=n+1
					if nxt.count(&:empty?)==2
						p depth
						return n+1
					end
				end
				c[from].unshift c[to].shift
			end
		}
	end
end
__END__
普通に説いて云々より、完成形からもとに戻すべきということに気づいた。
このファイルは方針としては間違い。
