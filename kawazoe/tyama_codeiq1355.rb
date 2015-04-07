#!/usr/bin/ruby
a=('0'..'9').map{|e|'.'+e*7}
(1..8).each{|e|
	puts 'Checking '+e.to_s+'...'
	p (1..1/0.0).each{|f|
		n=(f+('0'+a[e]).to_f)**2
		next if !(0<n.ceil-n && n.ceil-n<1e-1)
		sq=Math.sqrt(n.ceil)
		break n.ceil if ('%.19f'%sq).include?(a[e])
	}
}
__END__
【解答】：48273160
【方針】：
1から8の場合について(eとおく)、まずf.eeeeee^2をnと置いた時、0<n.ceil-n<0.1となるようなfを探し、さらにsprintf('%.19f',Math.sqrt(n.ceil))に「.eeeeee」が含まれることを確かめた。
なお、Math.sqrt(n.floor)はf.eeeeeeより小さくなるので、n.ceilのみ確かめれば良い。
8の場合の48273160が6947.888888000441となり条件を満たす最小である。
【コード】：