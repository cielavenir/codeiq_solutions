#!/usr/bin/ruby
s=0;1.upto(n=gets.to_i){|b|[2,5].map{|e|b/=e until b%e>0};s+=n/b};p s
__END__
各bを2と5で割れるだけ割ってから、nをその数で割ればaの個数が求まる
計算量はO(nlogn)
なお、整数除算は結合法則が成り立たないため、
計算量をO(n)以下にするのは無理そうである。