#!/usr/bin/ruby

D=[[0,1],[-1,0],[0,-1],[1,0]] #SWNE
H=32
W=5

while gets
	x=y=d=0
	$_.chomp.chars{|c|
		if c=='R'
			d=(d+1)%D.size
		elsif c=='L'
			d=(d-1)%D.size
		elsif c=='B'
			y=(y+H)%(2*H)
			x=W-1-x
			d=(d+2)%D.size if d%2>0
		else
			c.to_i.times{
				dx,dy=D[d].map(&:to_i)
				x+=dx
				y=(y+dy)%(2*H)
				if x==5
					x=0
					y=(y+H)%(2*H)
				end
				if x==-1
					x=W-1
					y=(y+H)%(2*H)
				end
			}
		end
	}
	puts '%d%s'%[y%H+1,(97+x-(y>=H ? 32 : 0)).chr]
end
