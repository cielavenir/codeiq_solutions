#!/usr/bin/ruby

class CFizzBuzzApplication
	def initialize
		@a_inIFizzBuzzSpecification=[]
	end
	def addSpec(inIFizzBuzzSpecification)
		@a_inIFizzBuzzSpecification<<inIFizzBuzzSpecification
	end
	def run(rRange)
		sResult=''
		rRange.each{|nIdx|
			@a_inIFizzBuzzSpecification.each{|inIFizzBuzzSpecification|
				if inIFizzBuzzSpecification.isSatisfiedBy(nIdx)
					sResult+=inIFizzBuzzSpecification.sMessage+$/
					break
				end
			} and sResult+=nIdx.to_s+$/
		}
		return sResult
	end
end

class IFizzBuzzSpecification
	attr_reader :sMessage
	def initialize(nArg,sMessage)
		@nArg=nArg
		@sMessage=sMessage
	end
	def isSatisfiedBy(nNum=nil)
		false
	end
end

class CFizzBuzzSpecificationDiv < IFizzBuzzSpecification
	def isSatisfiedBy(nNumerator)
		return nNumerator%@nArg==0
	end
end
class CFizzBuzzSpecificationDiv15 < CFizzBuzzSpecificationDiv
	def initialize
		super(15,'FizzBuzz')
	end
end
class CFizzBuzzSpecificationDiv3 < CFizzBuzzSpecificationDiv
	def initialize
		super(3,'Fizz')
	end
end
class CFizzBuzzSpecificationDiv5 < CFizzBuzzSpecificationDiv
	def initialize
		super(5,'Buzz')
	end
end
class CFizzBuzzSpecificationDiv7 < CFizzBuzzSpecificationDiv
	def initialize
		super(7,'CodeIQ')
	end
end

class CFizzBuzzSpecificationContains < IFizzBuzzSpecification
	def isSatisfiedBy(nNum)
		return nNum.to_s.include?(@nArg.to_s)
	end
end

class CFizzBuzzSpecificationContains3 < CFizzBuzzSpecificationContains
	def initialize
		super(3,'Foo')
	end
end

inCFizzBuzzApplication=CFizzBuzzApplication.new
inCFizzBuzzApplication.addSpec(CFizzBuzzSpecificationDiv15.new)
inCFizzBuzzApplication.addSpec(CFizzBuzzSpecificationDiv3.new)
inCFizzBuzzApplication.addSpec(CFizzBuzzSpecificationDiv5.new)
puts inCFizzBuzzApplication.run(1..100)

__END__
https://codeiq.jp/magazine/2013/08/2100/ を劣化移植。
・変数名が全てハンガリアン記法。特に、クラス名をI/Cで始める。
・ガチガチの継承定義でダックタイピングを無視。
・中途半端にattr_readerを採用したためFizzBuzzSpecificationのメソッド名がめちゃくちゃ。
・そもそもメソッド名がsnake_caseでない。
・FizzBuzzApplicationに<<メソッドを追加したほうが読みやすいのにそうしていない。
・改行文字を$/から拾う。
・breakをeachがnilを返すことで検知。
・条件分岐に「and」を使用。
・WIPなコードを残存させる。
・無駄な末端行return。