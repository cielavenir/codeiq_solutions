#!/usr/bin/env ruby
n=gets.to_i
p [*0...n].permutation.count{|_|
	a=_.dup
	n.times{|i|
		a[a[i]],a[i]=a[i],a[a[i]]
	}
	f=(n-1).times.any?{|i|
		a[i]>a[i+1]
	}
	#p _ if f
	f
}
__END__
ナイーブじゃない解法、どうやるんだろう…
