#!/usr/bin/ruby
eval "cmVxdWlyZSdmaWRkbGUnO2NsYXNzIFJ1YnlWTTo6SW5zdHJ1Y3Rpb25TZXF1ZW5jZTtmbj1GaWRkbGU6OkZ1bmN0aW9uLm5ldyhGaWRkbGU6OkhhbmRsZTo6REVGQVVMVFsncmJfaXNlcV9sb2FkJ10sW0ZpZGRsZTo6VFlQRV9WT0lEUF0qMyxGaWRkbGU6OlRZUEVfVk9JRFApO2RlZmluZV9zaW5nbGV0b25fbWV0aG9kKDpsb2FkKXt8KmF8Zm4uKCphLm1hcCgmRmlkZGxlLm1ldGhvZCg6ZGx3cmFwKSkpLnRvX3ZhbHVlfWVuZDtSdWJ5Vk06Okluc3RydWN0aW9uU2VxdWVuY2UubG9hZChNYXJzaGFsLmxvYWQoJwQIWxMiLVlBUlZJbnN0cnVjdGlvblNlcXVlbmNlL1NpbXBsZURhdGFGb3JtYXRpB2kAaQZ7CDoNYXJnX3NpemVpADoPbG9jYWxfc2l6ZWkGOg5zdGFja19tYXhpCCIPPGNvbXBpbGVkPiIPPGNvbXBpbGVkPjBpBjoIdG9wWwBpAFsAWxJpBlsHOgp0cmFjZWkGWwY6DHB1dHNlbGZbBjsKWwc6FG9wdF9zZW5kX3NpbXBsZXsJOghtaWQ6CWdldHM6CWZsYWdpAhgBOg5vcmlnX2FyZ2NpADoNYmxvY2twdHIwWwc7C3sJOww6C3VwY2FzZTsOaQIAATsPaQA7EDBbBzsLewk7DDoMcmV2ZXJzZTsOaQIAATsPaQA7EDBbBzsLewk7DDoOZWFjaF9jaGFyOw5pAgABOw9pADsQMFsHOwt7CTsMOgl0b19hOw5pAgABOw9pADsQMFsHOg5wdXRzdHJpbmdJIgYgBjoGRVRbBzsLewk7DDoJam9pbjsOaQIAATsPaQY7EDBbBzsLewk7DDoJcHV0czsOaQIIATsPaQY7EDBbBjoKbGVhdmUnKSxuaWwsbmlsKS5ldmFs".unpack("m")[0]

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
require 'fiddle'
require 'zlib'
class RubyVM::InstructionSequence
	fn=Fiddle::Function.new(Fiddle::Handle::DEFAULT['rb_iseq_load'],[Fiddle::TYPE_VOIDP]*3,Fiddle::TYPE_VOIDP)
	define_singleton_method(:load){|*a|fn.(*a.map(&Fiddle.method(:dlwrap))).to_value}
end
RubyVM::InstructionSequence.load(Marshal.load(Zlib.inflate('eNp1j01LAzEQhtMi6W4/tqIePErvYs9ZEQQt9GpFkByWMZ1ux2Y3MckWsX/eLEKrorcZnnlnnjlK5Onk8vn24Wle++AaFcjUC3xrsFZ4taDKaryDADPjKgjUI0Z8l4gRuLLw9IHExFgbBfqr4yLzAdSmqOCdksn4WpnKksblzfd6GueSYKxkxCSTJ8RlT/SDAxU3SC6Gtgke9UryvB/JmbGh8Fgv443WZ5eKpKKlSEsMXqQrDSV1zzsiM47KIpqpaDV6iVobG9xU9vLBLs2HYtBYBR7zjLqsk4+J5ccHOHS4RfcfzRDUulBrcH/zNJgCfiGRtW8ER3U5n/ALLvj94yHwaqjeB/iPXW2sRckecdHXCFv8BBugdTI='.unpack('m')[0])),nil,nil).eval
~~~
最終行にある文字列はRuby(YARV)のバイトコードを圧縮してBase64エンコードしたものです。
バイトコードはRubyVM::InstructionSequence.compile()で得ることができます。
librubyにはバイトコードを読み出す機能もあるのですが、SEGVを容易に引き起こしてしまうのでRuby側には公開されていません。そこで、fiddleを用いてこの機能にアクセスします。

バイトコードとプログラム全体で二重の難読化というわけです。

提出プログラムは以下のプログラムで生成しました。
~~~
#!/usr/bin/ruby -rzlib
#code object
stage1=RubyVM::InstructionSequence.compile(DATA.read).to_a
#encode object
stage2=[Zlib.deflate(Marshal.dump(stage1),9)].pack('m0')
#loader
stage3="require'fiddle';require'zlib';class RubyVM::InstructionSequence;fn=Fiddle::Function.new(Fiddle::Handle::DEFAULT['rb_iseq_load'],[Fiddle::TYPE_VOIDP]*3,Fiddle::TYPE_VOIDP);define_singleton_method(:load){|*a|fn.(*a.map(&Fiddle.method(:dlwrap))).to_value}end;RubyVM::InstructionSequence.load(Marshal.load(Zlib.inflate('"+stage2+"'.unpack('m')[0])),nil,nil).eval"
#encode loader
stage4="eval '"+[stage3].pack('m0')+"'.unpack('m')[0]"
puts stage4
__END__
puts gets.upcase.reverse.each_char.to_a.join ' '
~~~
なお、Rubyのバージョンが違うと動作しないので注意が必要です。

◆フリーコメント（任意）
・鍋谷さんの問題でRubyVM::InstructionSequenceを初めて触ってみたのですが( http://qiita.com/cielavenir/items/cadbc5e24525b6a86cf8 )、なかなか面白いですね。
・iseq gemの存在は存じ上げていたのですが、こちらは標準モジュールではありません…。しかしfiddleでもできる方法があるとわかったので今回提出できました。
・ネット上のサンプルと比べるとRubyVM::InstructionSequenceクラス内も字数を削っています。