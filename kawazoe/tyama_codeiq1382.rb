#!/usr/bin/ruby
require 'prime'
def solve(h)
	(h.reduce(1){|s,(n,p)|s*(2*p+1)}+1)/2
end
def range_factor(r)
	r.each_with_object(Hash.new(0)){|i,h|i.prime_division.each{|n,p|h[n]+=p}}
end
p solve 24.prime_division
p solve 720.prime_division
p solve range_factor 1..50

# require'prime';p ((1..50).reduce(:*).prime_division.reduce(1){|s,(n,p)|s*(2*p+1)}+1)/2

__END__
【解答】：
5215226132813
【方針】：
まず、50!を素因数分解する(range_factor)。これは1から50までそれぞれ素因数分解して、各素因数ごとに指数を足し合わせることによって行える。
これで、「n = \prod_{k=1}^d{n_k}^{p^k}」と素因数分解できたとすると、n,pの組を指す配列をhとしたとき、
h.reduce(1){|s,(n,p)|s*(2*p+1)}
が(a,b)の組の数である。
(a==bの場合を考え、1を足して)2で割れば、求める数が得られる(solve)。
【コード】：