#!/usr/bin/ruby
#coding:utf-8
h=Hash.new(false)
$<.each{|e|
	e.chomp.split(',').map(&:to_i).sort.combination(2){|o|
		h[o]^=true
	}
}
p h.count{|k,v|v} # 104
__END__
Ruby

数値に変換してソート、2つ組を取り、ハッシュオブジェクトの値をxorする。最終的に値がtrueな要素の個数が答え。