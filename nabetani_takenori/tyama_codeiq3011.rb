#!/usr/bin/ruby
#多段階選抜を流用
#ただし素数判定が必要なので他の言語では困難か
require 'prime'
def drop_prev_n(check,n,prev)
	return to_enum(:drop_prev_n,check,n,prev) if !block_given?
	a=n.times.map{prev.next}
	loop{
		nxt=prev.next
		yield a[0] if !check[nxt]
		a.shift
		a<<nxt
	}
end
f=Kernel.method(:drop_prev_n).to_proc.curry[Prime.method(:prime?)]

if $0==__FILE__
	while gets
		puts $_.split.map(&:to_i).reduce(0.upto(1/0.0)){|s,e|f[e][s]}.take(10)*','
	end
end
