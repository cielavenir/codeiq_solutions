#!/usr/bin/ruby
T={Firefox:'Firedog',Opera:'Kabuki',OPR:'KBK',Chrome:'Monochrome',MSIE:'ASIT',Trident:'Quadent',WebKit:'OrangeKit'}
ANS={Firefox:'MFD',Safari:'VYG',MSIE:'ASIT',Opera:'KBK',Chrome:'GMC'}
#T={Firefox:'Firefox',Opera:'Opera',OPR:'OPR',Chrome:'Chrome',MSIE:'MSIE',Trident:'Trident',WebKit:'AppleWebKit'}
#ANS={Firefox:'MFF',Safari:'SFR',MSIE:'MSIE',Opera:'OPR',Chrome:'GCR'}

def solve(ua)
	if ua.include?(T[:Opera])||ua.include?(T[:OPR])
		ANS[:Opera]
	elsif ua.include?(T[:MSIE])||ua.include?(T[:Trident])
		ANS[:MSIE]
	elsif ua.include?(T[:Firefox])
		ANS[:Firefox]
	elsif ua.include?(T[:Chrome])
		ANS[:Chrome]
	elsif ua.include?(T[:WebKit])
		# WebKitはあまりにシェアを大きくしすぎたため、
		# 大本が一番判定しづらくなってしまったという皮肉
		# TridentもGeckoもPrestoも嫌い、KHTMLこそ至高と粋がっていた(実話)のも昔話…
		ANS[:Safari]
	else
		# メジャーブラウザではない
		# (CodeIQのテストケースではここに落ちることはない)
		nil
	end
end
puts solve(gets.chomp)
