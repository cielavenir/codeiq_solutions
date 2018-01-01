#!/usr/bin/env ruby
#http://nabetani.sakura.ne.jp/yokohamarb/2014.10.rotcell/
#http://qiita.com/Nabetani/items/d6ac6695787e76758a18
if RUBY_VERSION<'1.9'
	require 'rubygems'
	require 'backports' # (Math.cbrtと異なり)1.8のArray#rotateはbackportsに存在するので、ありがたく使わせて頂きます
end

def Rotate(a,n)
	b=a.select{|e|e!='-'}
	b.rotate!(n)
	a.size.times{|i|
		if a[i]!='-'
			a[i]=b.shift
		end
	}
	a
end

if $0==__FILE__
	STDOUT.sync=true
	while gets
		a,b=$_.split
		str=[]
		area=a.split('/').map{|e|e.chars.to_a}
		grid=[*0...area[0].size].product([*0...area.size])
		b.chomp.each_char{|c|
			#c=_c.downcase
			f=-1
			x,y=grid.find{|x,y|area[y][x]==c}
			minx,maxx=[x-1,x+1]
			miny,maxy=[y-1,y+1]
			x=minx
			y=miny
			rotaters=[]
			rotaters<<[x+=1,y] while x<maxx
			rotaters<<[x,y+=1] while y<maxy
			rotaters<<[x-=1,y] while x>minx
			rotaters<<[x,y-=1] while y>miny
			rotaters=rotaters.select{|x,y|0<=y&&y<area.size && 0<=x&&x<area[y].size}
			str=Rotate(rotaters.map{|x,y|area[y][x]},f)
			rotaters.each_with_index{|(x,y),i|area[y][x]=str[i]}
		}
		puts area.map(&:join)*'/'
	end
end
