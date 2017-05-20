#!/usr/bin/env ruby
#http://qiita.com/Nabetani/items/373105e7fafd12f5e9fd
#http://nabetani.sakura.ne.jp/hena/ord18mafovafo/
#yhpgのコードがあってもきつかった、もしなかったら完全に捨ててたと思います…図形はだめ…

T={'L'=>'RVF','J'=>'FVR'}
def solve(s)
	f=false
	s.chars.reduce('F'){|s,e|
		if e=='T'
			if !f
				f=true
				s=s.tr('FR','RF')
			end
		elsif e=='B'
			if f
				f=false
				s=s.tr('FR','RF')
			end
		else
			if f
				if e=='L'
					e='J'
				elsif e=='J'
					e='L'
				end
			end
			s=s.chars.map{|c|c=='F' ? T[e] : c=='R' ? T[e].tr('FRmV','RFVm').reverse : c}.join
		end
		s
	}.tr('FR','')
end

STDOUT.sync=true
while gets
	s=$_.chomp.tr('LR','LJ')
	puts (solve(s)+solve(s.tr('LTJB','BLTJ'))+solve(s.tr('LTJB','JBLT'))+solve(s.tr('LTJB','TJBL'))).tr('V','v')
end
