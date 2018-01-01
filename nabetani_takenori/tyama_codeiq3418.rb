#!/usr/bin/env ruby
def impl( m, b )
  #http://qiita.com/Nabetani/items/ae4231b3ce5ca3c0919c
  #をそのまま使いますねorz
  s=m.to_s(b)
  keta = s.size
  return m if m<=b
  shead=s[0,keta/2]
  head = shead.to_i(b)
  mids = keta.odd? ? [*0..(b-1)].map{|x| x.to_s(b)} : [""]
  # keta-1 桁までの数
  n0 = 1.upto(keta-1).map{ |k|
    (k==1 ? 1 : b**(k/2) - b**(k/2-1)) * ( k.odd? ? b : 1 )
  }.reduce(:+)
  #keta桁の数で、前半が m の前半より小さい
  n1 = (head - b**(keta/2-1)) * mids.count
  #keta桁の数で、前半が m の前半と等しい
  n2 = mids.count{ |mid| (shead+mid+shead.reverse).to_i(b) < m }
  n1+n0+n2
end

def conv(n,b)
	if n<b
		return n
	end
	n-=b
	i=1
	loop{
		z=b**i-b**~-i
		x=(b+1)*z
		if n<x
			if n<z
				return ((b**~-i+n).to_s+(b**~-i+n).to_s.reverse).to_i
			end
			n-=z
			d,r=n.divmod(b)
			return ((b**~-i+d).to_s+[*'0'..(b-1).to_s(b)][r]+(b**~-i+d).to_s.reverse).to_i
		end
		n-=x
		i+=1
	}
end

while gets
	x,y=$_.split(',').map &:to_i
	x=impl(x,10)
	y=impl(y+1,10)
	rsiz=y-x
	if rsiz==0
		puts :-
	elsif rsiz%2>0
		p conv(x+rsiz/2,10)
	else
		puts '%d,%d'%[conv(x+rsiz/2-1,10),conv(x+rsiz/2,10)]
	end
	STDOUT.flush
end
