#!/usr/bin/ruby
#coding:utf-8
require 'zlib'
require 'stringio'
Encoding.default_external=Encoding::UTF_8

if __FILE__==$0
	f=StringIO.new(Zlib.inflate($<.read.unpack('m')[0]).force_encoding(Encoding.default_external))
	#f=$<
	while line=f.gets
		id,n,data,answer=line.chomp.split
		#exit if !id.start_with?('T')
		n=n.to_i
		answer=answer.to_i
		if data.size==2
			puts id if 2!=answer
		elsif answer>0&&n%answer>0
			warn id+': answer cannot divide n'
			puts id
		else
			data=data.split(',').map{|e|
				#e.chars.map{|f|Rational(360*(f.ord-65),n)}
				e.chars.map{|f|2*(f.ord-65)}
			}
			ans=n.times.count{
				data.map!{|e|
					#e.map{|f|(f+Rational(360,2*n))%360}
					e.map{|f|(f+1)%(2*n)}
				}.all?{|e|
					#rev=e.map{|f|-f%360}
					rev=e.map{|f|-f%(2*n)}
					data.include?(rev) || data.include?(rev.reverse)
				}
			}
			puts id if ans!=answer
		end
	end
end

__END__
【解答】
111,222,321,333,432,444,543,555,654,666,765,777,876,888,987,999
【感想・工夫した点など】
まず、与えられた点を単位円に配置する。
次に、この図形を(0,180]度の範囲で360/2n度ずつ回転する。
x軸に関して線対称にするには「-f%360」を取れば良い。

[追記]
最初に作った答案は円周を360度としているが、これを2n単位とすることで、整数演算が可能となる。
n回回転操作を行えば半周分回転することになるのは変わらない。
【言語と処理系】
Ruby 2.0
【ソースコード】