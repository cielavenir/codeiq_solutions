#!/usr/bin/ruby
#coding:utf-8
raise 'Ruby 1.9+ required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'

a=(DATA.read+"$").split('。')
a[-1]=a[-1][0..-2]
(0..a.size-2).each{|i|
	if x=['だ','です'].find{|e|a[i].end_with?(e)}
		a[i]=a[i][0...-x.size]+'でちゅ'
	else
		a[i]+='のでちゅ'
	end
}
puts a.join('。')
__END__
酔いは万能だ。秘密を開き、希望を深め、無精者を戦場へ促し、気苦労を取り除き、新しい技術を教える。 ─ホラティウス