#!/usr/bin/env ruby
$memo={}
def chk(a)
	h=Hash.new 0
	(a.size-1).downto(0).all?{|i|
		r=0
		h.each{|k,v|
			r+=v if k>a[i]
		}
		r<=1 and h[a[i]]+=1
	}
end
a=gets.chomp.chars.map(&:to_i).reverse
q=[ [a,[],[]] ]
memo={q[0]=>0}
while !q.empty?
	c=q.shift.map(&:dup)
	k=memo[c]
	[*0..2].permutation{|i,j|
		if !c[i].empty?
			c[j].push c[i].pop
			if !memo[c]&&chk(c[j])
				cnxt=c.map(&:dup)
				memo[cnxt]=k+1
				q<<cnxt
				if cnxt[0].empty?&&cnxt[2].empty?
					p k+1
					exit
				end
			end
			c[i].push c[j].pop
		end
	}
end
raise 'queue exhausted'
