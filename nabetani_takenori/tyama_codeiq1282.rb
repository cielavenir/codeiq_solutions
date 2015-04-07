#!/usr/bin/ruby
#coding:utf-8
#require 'zlib'
#require 'base64'
#require 'stringio'
Encoding.default_external=Encoding::UTF_8

require 'bigdecimal'
PRECISION=100
EPS=BigDecimal("1e-#{PRECISION}")

class OrthodoxSolver
	def range(operation,n,v1,v2)
		case operation
			when '四捨五入' then [v1-BigDecimal("5e#{-n}"),v2+BigDecimal("5e#{-n}")]
			when '切り上げ' then [v1-BigDecimal("10e#{-n}"),v2]
			when '切り捨て' then [v1,v2+BigDecimal("10e#{-n}")]
			else []
		end
	end
	def fmt(v)
		s=v.to_s('f')
		s.end_with?('.0') ? s.to_i.to_s : s
	end
	def solve(n1,p1,m,n2,p2,t)
		format=p1=='切り上げ' ? '%sより大きく%s以下' : '%s以上%s未満'
		#t.split[3]==tの少数点以上の桁数。小数点以下の桁数はt.split[1].size-t.split[3]
		if t.split[1].size-t.split[3]>=n2 #桁数が異常であれば無効
			return 'なし'
		else
			a=range(p2,n2,t,t).map{|e|e.div(m,PRECISION)}
			if p2=='切り上げ'
				a[0]+=EPS
			else
				a[1]-=EPS
			end
			b=range(p1,n1,a[0].ceil(n1-1),a[1].floor(n1-1))
			r=b.map{|e|fmt(e)}
			return 'なし' if r[0]==r[1]
			return format%r
		end
	end
	def correct?(n1,p1,m,n2,p2,t,answer)
		ans=solve(n1,p1,m,n2,p2,t)
		ans==answer
	end
end

class HeterodoxSolver
	def correct?(n1,p1,m,n2,p2,t,answer)
		if answer=='なし'
			OrthodoxSolver.new.correct?(n1,p1,m,n2,p2,t,answer)
		else
			sender={'四捨五入'=>:round,'切り上げ'=>'ceil','切り捨て'=>'floor'}
			format=p1=='切り上げ' ? '%sより大きく%s以下' : '%s以上%s未満'
			match=/^([\d\.]+)[^\d]+([\d\.]+)/.match(answer)
			data=[1,2].map{|i|BigDecimal.new(match[i])}
			if p1=='切り上げ'
				data[0]+=EPS
			else
				data[1]-=EPS
			end
			r=data.map{|e|(e.send(sender[p1],n1-1)*BigDecimal(m)).send(sender[p2],n2-1)}
			r[0]==t && r[1]==t
		end
	end
end

if __FILE__==$0
	#f=StringIO.new(Zlib.inflate(Base64.decode64($<.read)).force_encoding(Encoding.default_external))
	f=$<
	while line=f.gets
		algo=OrthodoxSolver.new
		#algo=HeterodoxSolver.new
		id,n1,p1,m,n2,p2,t,answer=line.chomp.split
		#exit if id[0,1]!='T'
 		n1=n1.to_i
		m=BigDecimal(m)
		n2=n2.to_i
		t=BigDecimal(t)
		puts id if !algo.correct?(n1,p1,m,n2,p2,t,answer)
	end
end

__END__
【解答】
55,111,166,222,277,333,388,444,499,555,610,666,721,777,832,888,943,999
【感想・工夫した点など】
BigDecimalを使いました。しかし、「より大きい」「未満」を表現するのにEPSを使ったのが邪悪なところ。
一応解答が「なし」以外になる行については出力値を使う答案と一致するので大丈夫なのではないかと思いますが…。

・OrthodoxSolver#rangeで余計な*10を消すことができたので、(case...whenを使ったこともありますがそれ以上に)見通しが良くなりました。
・「7 切り捨て 0.9442 7 四捨五入 0.2」について。
(BigDecimal('0.2')-BigDecimal("5e-7"))/BigDecimal('0.9442')
は'0.211819E0'、
(BigDecimal('0.2')-BigDecimal("5e-7")).div(BigDecimal('0.9442'),100)
は'0.2118190002 1181952976 0643931370 4723575513 6623596695 6153357339 5467062063 1222198686 7189154840 0762550307E0'
となりました。ceil(6)すると、'0.211819E0'と'0.21182E0'のように異なった結果になります。今回期待するのは後者なので、(とりあえず)除算の精度を増やすように変更しました。
これにより「0.21182以上0.211821未満」を得ることが出来ました。
BigDecimalの特性について勉強になりました。ありがとうございます。
【言語と処理系】
Ruby 2.0
【ソースコード】