#!/usr/bin/ruby
PASS={
	'An'=>910,'Ax'=>510,'Ap'=>0,
	'Cn'=>460,'Cx'=>260,'Cp'=>0,
	'In'=>460,'Ix'=>260,'Ip'=>0,
}
def to_child(n)
	(n/2+9)/10*10
end
def to_special(n)
	(n*56+999)/1000*10
end
while gets
	a,kind=$_.chomp.split(':').zip([
		[:to_i,:to_i],[:to_s,lambda{|e|[e[0],'nxp'.index(e[1,1])]}]
	]).map{|e,(f,g)|
		e.split(',').map(&f).sort_by(&g)
	}
	b=a.map{|e|
		n=0
		kind.map{|k|
			fee=e
			if k.start_with?('I')&&n>0
				n-=1
				0
			else
				fee=e
				if k.start_with?('A')
					n+=2
				else
					fee=to_child(fee)
				end
				if k.end_with?('x')
					fee=to_special(fee)
				elsif k.end_with?('p')
					fee=0
				end
				fee
			end
		}
	}.transpose.map{|e|
		e.reduce(:+)
	}
	p kind.size.times.reduce(0){|s,i|
		s+(kind[i].size>1 ? [b[i],PASS[kind[i]]].min : b[i])
	}
end