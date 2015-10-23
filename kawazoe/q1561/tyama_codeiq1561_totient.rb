#!/usr/bin/ruby
require 'prime'
class Integer
	def totient()
		self.prime_division.reduce(1){|s,e|s*(e[0]-1)*e[0]**(e[1]-1)}
	end
	def pow_binary_mod(y,m)
		x = self
		z = 1
		while y!=0
			z=z*x%m if y&1!=0
			x=x*x%m
			y>>=1
		end
		z
	end
end

M=1000000
REV3=3.pow_binary_mod(M.totient-1,M)
STDERR.puts REV3
n=gets.to_i
p (16.pow_binary_mod(n,M)-1)*2*REV3%M

__END__
【方針】
まず、1がn個並んだ数を考える。
これは、16**0+16**1+...+16**(n-1)=(16**n-1)/15である。
よって、F(n)は(16**n-1)/15*10=(16**n-1)*2/3である。
これの下6桁をもとめれば良い。
3は1000000と互いに素であるから逆元を取ることができる。

totient.rb/py: オイラーの定理の式を使う。素因数分解が必要。
openssl.rb:    OpenSSLの関数を用いる。
egcd.rb/py:    拡張ユークリッド互除法を用いる。
【言語】
Ruby/Python
【コード】