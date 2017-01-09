#!/usr/bin/env ruby
class Array
	def flip1
		a=self.dup
		a[1],a[2]=a[2],a[1]
		a=a.transpose
		a[1],a[2]=a[2],a[1]
		a.transpose
	end
	def flip2
		a=self.dup
		a[0],a[1]=a[1],a[0]
		a[2],a[3]=a[3],a[2]
		a=a.transpose
		a[0],a[1]=a[1],a[0]
		a[2],a[3]=a[3],a[2]
		a.transpose
	end
	def rotate180
		self.reverse.map(&:reverse)
	end
	def rotate90
		self.reverse.transpose
	end
	def rotate270
		self.transpose.reverse
	end
	def max_path
		h=self.size
		w=self[0].size
		a=h.times.map{[0]*w}
		a[0][0]=self[0][0]
		(h-1).times{|i|a[i+1][0]=a[i][0]+self[i+1][0]}
		(w-1).times{|j|a[0][j+1]=a[0][j]+self[0][j+1]}
		(h-1).times{|i|(w-1).times{|j|
			a[i+1][j+1]=[a[i+1][j],a[i][j+1]].max+self[i+1][j+1]
		}}
		a[h-1][w-1]
	end
end

A=[
	[ # http://www.daido-it.ac.jp/~oishi/TH5/ms4/ms4a.html
		lambda{|a|a},
		lambda{|a|a.flip1},
		lambda{|a|a.flip2},
		lambda{|a|a.flip1.flip2},
	],[ # 反転
		lambda{|a|a},
		lambda{|a|a.map(&:reverse)},
	],[ # 回転
		lambda{|a|a},
		lambda{|a|a.rotate90},
		lambda{|a|a.rotate180},
		lambda{|a|a.rotate270},
	]
] # 220個の魔方陣から、この3つの直積で残りを生成できる

begin
	require 'json'
	reader=JSON.method(:parse)
rescue LoadError
	### this is unsafe ###
	reader=Kernel.method(:eval)
end
require 'zlib'
h=Hash.new(0)
reader.call(Zlib::Inflate.inflate(DATA.read.unpack('m')[0])).each{|a|
	A[0].product(*A[1..-1]).each{|e|
		x=e.reduce(a){|s,f|f.call(s)}
		h[x.max_path]+=1
	}
}
p h[gets.to_i]

### Embed https://web.archive.org/web/20010606023705/http://www.pse.che.tohoku.ac.jp/~msuzuki/magic44.html as json.zlib.b64 ###
__END__
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
