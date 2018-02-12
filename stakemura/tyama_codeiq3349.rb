#!/usr/bin/ruby
require 'set'
Dependency=Hash.new{|h,k|h[k]=Set.new()}
$<.each{|e|
	s,*depends=e.tr(':','').split
	Dependency[s]
	depends.each{|e|
		Dependency[e]
		Dependency[s].add(e)
	}
}
while !Dependency.empty?
	keys=[]
	Dependency.each{|k,v|keys<<k if v.empty?}
	puts keys.sort*' '
	keys.each{|e|Dependency.delete(e)}
	Dependency.each{|k,v|
		keys.each{|e|v.delete(e)}
	}
end
# 普通のトポロジカルソートが使えないので。O(n^2)ですが。n<=1000だからまあいいか…
