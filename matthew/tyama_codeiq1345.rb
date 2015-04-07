#!/usr/bin/ruby

#AOJ 0152 and paiza 24(A005).

b=DATA.map{|e|
	e.match(/\((.*)\)/)[1].split(',').map(&:to_i)
}
c=[]
0.step(8){|i|
	if b[i][0]==10
		if b[i+1][0]==10&&i<8 then c[i]=20+b[i+2][0] else c[i]=10+b[i+1][0]+b[i+1][1] end
	else
		c[i]=b[i][0]+b[i][1]
		if c[i]==10 then c[i]+=b[i+1][0] end
	end
}
c[9]=b[9].reduce(:+)
p c.reduce(:+)

__END__
1:(1,2)
2:(4,6)
3:(3,7)
4:(3,4)
5:(5,2)
6:(10,0)
7:(3,6)
8:(9,0)
9:(2,3)
10:(7,3,2)