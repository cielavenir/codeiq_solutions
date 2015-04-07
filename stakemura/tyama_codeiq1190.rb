#!/usr/bin/ruby
#coding:utf-8
require 'bigdecimal'

puts [*1..8].permutation.max_by{|a|
	n0=a[0]/( BigDecimal.new(a[1])**(-1*(a[2]*10+a[3])) )
	n1=(BigDecimal.new(a[4])**(a[5]*10+a[6])+a[7]*0.1)
	x=n0-n1
	if a[0]==1 && x.abs<1
		STDERR.puts a.inspect
		STDERR.puts n0.inspect
		STDERR.puts n1.inspect
		n0
	else
		0
	end
}*' '
__END__
BigDecimal同士の累乗は非常に計算時間がかかるので実行できない。
そこで、まず、ネイピア数の定義から、(A/B**○)と(E**○+0.1*H)が非常に近くなる組み合わせに絞り込んだ(STDERR)。
[141211追記] よく考えると問題文中のAをくくりだすことはできないので、a[0]==1を満たす必要がある。
[1, 2, 7, 6, 4, 3, 8, 5]
#<BigDecimal:7fbd030fba28,'0.7555786372 5914323419 136E23',27(99)>
#<BigDecimal:7fbd030fb6b8,'0.7555786372 5914323419 1365E23',36(72)>
[1, 4, 3, 8, 2, 7, 6, 5]
#<BigDecimal:7fbd0308eec8,'0.7555786372 5914323419 136E23',27(99)>
#<BigDecimal:7fbd0308f788,'0.7555786372 5914323419 1365E23',36(72)>
この「2 7 6」と「4 3 8」は可換であるのでどちらを出力しても良い。
ideoneでは1 2 7 6 4 3 8 5が出力されるようです。

なお、ideoneの実行時間は15秒を選択する必要があります。
http://ideone.com/NeKZ1G
(Ruby 2.0では正常だが)Ruby 1.9だとn1.inspectの表示が不穏になるようです。実行の影響はないようなのでお許しを…。