#!/usr/bin/ruby
#coding:utf-8
#cf:912 is kana -> roman

raise 'Ruby 1.9+ required' if RUBY_VERSION<'1.9'
Encoding.default_external='UTF-8'

KATAKANA=%w(
	ア イ ウ エ オ
	カ キ ク ケ コ
	サ シ シ ス セ ソ
	タ チ チ ツ ツ テ ト
	ナ ニ ヌ ネ ノ
	ハ ヒ フ フ ヘ ホ
	マ ミ ム メ モ
	ヤ ユ ヨ
	ラ リ ル レ ロ
	ワ ヰ ヱ ヲ ン
	ガ ギ グ ゲ ゴ
	ザ ジ ズ ゼ ゾ
	ダ ヂ ヅ デ ド
	バ ビ ブ ベ ボ
	パ ピ プ ペ ポ
	キャ キィ キュ キェ キョ
	クァ クィ クゥ クェ クォ
	シャ シィ シュ シェ ショ
	チャ チィ チュ チェ チョ
	テャ ティ テュ テェ テョ
	トァ トィ トゥ トェ トォ
	ツァ ツィ ツェ ツォ
	ニャ ニィ ニュ ニェ ニョ
	ヒャ ヒィ ヒュ ヒェ ヒョ
	ミャ ミィ ミュ ミェ ミョ
	リャ リュ リュ リェ リョ
	ギャ ギィ ギュ ギェ ギョ
	グァ グィ グゥ グェ グォ
	ジャ ジィ ジュ ジェ ジョ
	ヂャ ヂィ ヂュ ヂェ ヂョ
	デャ ディ デュ デェ デョ
	ドァ ドィ ドゥ ドェ ドォ
	ビャ ビィ ビュ ピェ ビョ
	ピャ ピィ ピュ ビェ ピョ
	ウァ ウィ ウェ ウォ
	ファ フィ フェ フォ
	フャ フュ フョ
	ヴァ ヴィ ヴ ヴェ ヴォ
	ヴャ ヴュ ヴョ
	ァ ィ ゥ ェ ォ
	ャ ュ ョ ヮ ヵ ヶ ッ
)+['　','ー','＝','、','。','・']
HIRAGANA=KATAKANA.map{|e|e.codepoints.map{|f|(12449<=f&&f<=12538 ? f-96 : f).chr('UTF-8')}.join}
KANA=KATAKANA+HIRAGANA
ROMAN=(%w(
	A I U E O
	KA KI KU KE KO
	SA SHI SI SU SE SO
	TA CHI TI TSU TU TE TO
	NA NI NU NE NO
	HA HI FU HU HE HO
	MA MI MU ME MO
	YA YU YO
	RA RI RU RE RO
	WA WYI WYE WO N
	GA GI GU GE GO
	ZA JI ZU ZE ZO
	DA DI DU DE DO
	BA BI BU BE BO
	PA PI PU PE PO
	KYA KYI KYU KYE KYO
	KWA KWI KWU KWE KWO
	SHA SYI SHU SHE SHO
	CHA CYI CHU CHE CHO
	THA THI THU THE THO
	TWA TWI TWU TWE TWO
	TSA TSI TSE TSO
	NYA NYI NYU NYE NYO
	HYA HYI HYU HYE HYO
	MYA MYI MYU MYE MYO
	RYA RYI RYU RYE RYO
	GYA GYI GYU GYE GYO
	GWA GWI GWU GWE GWO
	JA JYI JU JE JO
	DYA DYI DYU DYE DYO
	DHA DHI DHU DHE DHO
	DWA DWI DWU DWE DWO
	BYA BYU BYU BYE BYO
	PYA PYI PYU PYE PYO
	WHA WHI WHE WHO
	FA FI FE FO
	FYA FYU FYO
	VA VI VU VE VO
	VYA VYU VYO
	XA XI XU XE XO
	XYA XYU XYO XWA XKA XKE XTSU
)+[' ','-','=',',','.','_'])*2

def kana_to_roman(kana)
	small_shift=0
	n_shift=false
	ret=''
	i=0
	while i<kana.size
		str1=kana[i]
		i+=1
		if str1=='ッ'||str1=='っ'
			small_shift+=1
			next
		end
		idx=KANA.index(str1)
		if idx
			if kana[i]&&'ァィゥェォャュョぁぃぅぇぉゃゅょ'.include?(kana[i])
				str1+=kana[i]
				i+=1
				idx_=KANA.index(str1)
				if idx_
					idx=idx_
				else
					str1=str1[0]
					i-=1
				end
			end
		end
		str2=idx ? ROMAN[idx] : str1
		if !idx #end of word
			ret+='X'*small_shift+'TSU' if small_shift>0
			small_shift=0
		end
		if n_shift&&'ナニヌネノなにぬねのンんアイウエオヤユヨあいうえおやゆよ'.include?(str1[0])
			#ret+='-' if !'ンん'.include?(str1)
			ret+='N'
		end
		ret+=str2[0]*small_shift if small_shift>0
		ret+=str2
		small_shift=0
		n_shift=str2=='N'
	end
	ret+='X'*small_shift+'TSU' if small_shift>0
	small_shift=0
	ret
end

def roman_to_kana(roman)
	n_shift=false
	s=''
	i=0
	prev=0
	while i<roman.size
		idx=ROMAN.index(roman[prev..i].upcase)
		if roman[prev..i].upcase=='NN'
			s<<'ン'
			prev=i+1
			n_shift=false
		elsif idx
			if roman[prev..i].upcase=='N'
				n_shift=true
			else
				s<<KATAKANA[idx]
				n_shift=false
				prev=i+1
			end
		elsif prev<i
			if n_shift
				if roman[i]!='Y'
					s<<'ン'
					n_shift=false
					prev+=1
					i-=1
				end
			elsif roman[prev]==roman[prev+1]
				s<<'ッ'
				prev+=1
			end
		end
		i+=1
	end
	if prev<i && roman[prev].upcase=='N'
		s<<'ン'
		prev+=1
	end
	s
end

def kana_swapcase(s)
	t0=["アイウエオヤユヨワカケツあいうえおやゆよわつ","ァィゥェォャュョヮヵヶッぁぃぅぇぉゃゅょゎっ"].map(&:codepoints)
	t=Hash[[t0[0]+t0[1],t0[1]+t0[0]].transpose]
	s.each_codepoint.map{|e|(t[e]||e).chr('UTF-8')}.join
end
def kana_upcase(s)
	t0=["アイウエオヤユヨワカケツあいうえおやゆよわつ","ァィゥェォャュョヮヵヶッぁぃぅぇぉゃゅょゎっ"].map(&:codepoints)
	t=Hash[[t0[0]+t0[1],t0[0]+t0[0]].transpose]
	s.each_codepoint.map{|e|(t[e]||e).chr('UTF-8')}.join
end
	
def key(s)
	without_dakuten=s.encode('UTF-8-MAC').codepoints.reject{|e|e==12441||e==12442}.map{|e|e.chr('UTF-8')}.join
	[kana_upcase(without_dakuten),s]
end

puts $<.sort_by{|e|
	s=roman_to_kana(e.chomp)
	key(s)
}