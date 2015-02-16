#!/usr/bin/ruby
eval 'JXcoZmlkZGxlIGRsIHpsaWIpLmVhY2h7fGV8cmVxdWlyZSBlfTtjbGFzcyBSdWJ5Vk06Okluc3RydWN0aW9uU2VxdWVuY2U7Zm49RmlkZGxlOjpGdW5jdGlvbi5uZXcoREw6OkhhbmRsZTo6REVGQVVMVFsncmJfaXNlcV9sb2FkJ10sW0ZpZGRsZTo6VFlQRV9WT0lEUF0qMyxGaWRkbGU6OlRZUEVfVk9JRFApO2RlZmluZV9zaW5nbGV0b25fbWV0aG9kKDpsb2FkKXt8KmF8Zm4uKCphLm1hcCgmREwubWV0aG9kKDpkbHdyYXApKSkudG9fdmFsdWV9ZW5kO1J1YnlWTTo6SW5zdHJ1Y3Rpb25TZXF1ZW5jZS5sb2FkKE1hcnNoYWwubG9hZChabGliLmluZmxhdGUoJ2VOcE56azFMQXpFUUJ1QWNKUHZWYmtIUGd1eGQybk1xZ3FDRlhpMFVKSWRsU0tmYjBXeXlKdGtpK3VkTnVnamVaaDdlK2JqSzVVMXovL2IwdXQ4YUg5eW9BbG16dzg4UmpjTGxqdnBCNHpNRTJGalhReUJPR2ZHZlhNekJkYTJuYnlRbUZ0b3EwRlBIUmUwRHFJKzJoeS9LbThXRHN2MUFHZytQLyt0VnpPWEJEcElSazB4ZUU1ZVpLSU1ERlRkSUxtYkRHRHpxbytUclVsYWk4R2dPb3Vnd2VHSXJ1bzFEMWJvUzFUZ284SmlJeGJGRU00ZG5kSCtXWGF4R1VLZFduY0JObWwrMENMYUZDWXA0dkU0WGd5UFRiUnQreHdWLzJVeXhkMHVHZUlxVkU2UmdnamxWOGROU0k1enhGNUQ1WGpjPScudW5wYWNrKCdtJylbMF0pKSxuaWwsbmlsKS5ldmFs'.unpack('m')[0]

__END__
◆タイトル（必須）
二重の難読化
◆使用言語（必須）
Ruby
◆プログラム（必須）
＊
◆ポイント（必須）
・まず、Base64をデコードすると、次のようになります(可読性のため整形しています)。
~~~
%w(fiddle dl zlib).each{|e|require e}
class RubyVM::InstructionSequence
	fn=Fiddle::Function.new(DL::Handle::DEFAULT['rb_iseq_load'],[Fiddle::TYPE_VOIDP]*3,Fiddle::TYPE_VOIDP)
	define_singleton_method(:load){|*a|fn.(*a.map(&DL.method(:dlwrap))).to_value}
end
RubyVM::InstructionSequence.load(Marshal.load(Zlib.inflate('eNpNzk1LAzEQBuAcJPvVbkHPguxd2nMqgqCFXi0UJIdlSKfb0WyyJtki+udNugjeZh7e+bjK5U1z//b0ut8aH9yoAlmzw88RjcLljvpB4zME2FjXQyBOGfGfXMzBda2nbyQmFtoq0FPHRe0DqI+2hy/Km8WDsv1AGg+P/+tVzOXBDpIRk0xeE5eZKIMDFTdILmbDGDzqo+TrUlai8GgOougweGIruo1D1boS1Tgo8JiIxbFEM4dndH+WXaxGUKdWncBNml+0CLaFCYp4vE4XgyPTbRt+xwV/2Uyxd0uGeIqVE6RggjlV8dNSI5zxF5D5Xjc='.unpack('m')[0])),nil,nil).eval
~~~
最終行にある文字列はRuby(YARV)のバイトコードを圧縮してBase64エンコードしたものです。
バイトコードはRubyVM::InstructionSequence.compile()で得ることができます。
librubyにはバイトコードを読み出す機能もあるのですが、SEGVを容易に引き起こしてしまうのでRuby側には公開されていません。そこで、fiddle/dlを用いてこの機能にアクセスします。

バイトコードとプログラム全体で二重の難読化というわけです。

提出プログラムは以下のプログラムで生成しました。
~~~
#!/usr/bin/ruby -rzlib
#code object
stage1=RubyVM::InstructionSequence.compile(DATA.read).to_a
#encode object
stage2=[Zlib.deflate(Marshal.dump(stage1),9)].pack('m0')
#loader
stage3="%w(fiddle dl zlib).each{|e|require e};class RubyVM::InstructionSequence;fn=Fiddle::Function.new(DL::Handle::DEFAULT['rb_iseq_load'],[Fiddle::TYPE_VOIDP]*3,Fiddle::TYPE_VOIDP);define_singleton_method(:load){|*a|fn.(*a.map(&DL.method(:dlwrap))).to_value}end;RubyVM::InstructionSequence.load(Marshal.load(Zlib.inflate('"+stage2+"'.unpack('m')[0])),nil,nil).eval"
#encode loader
stage4="eval '"+[stage3].pack('m0')+"'.unpack('m')[0]"
puts stage4
__END__
puts gets.upcase.reverse.each_char.to_a.join ' '
~~~
なお、Rubyのバージョンが違うと動作しないので注意が必要です(現在のideoneは1.9.3)。

◆フリーコメント（任意）
・鍋谷さんの問題でRubyVM::InstructionSequenceを初めて触ってみたのですが( http://qiita.com/cielavenir/items/cadbc5e24525b6a86cf8 )、なかなか面白いですね。
・iseq gemの存在は存じ上げていたのですが、こちらは標準モジュールではありません…。しかしfiddleでもできる方法があるとわかったので今回提出できました。
・ネット上のサンプルと比べるとRubyVM::InstructionSequenceクラス内も字数を削っています。