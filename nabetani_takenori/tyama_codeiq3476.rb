#!/usr/bin/env ruby
#http://nabetani.sakura.ne.jp/hena/ordf07walk/
#https://qiita.com/Nabetani/items/cf93b63acc8a313c88bb
STDOUT.sync=true

while gets
	a=$_.chomp.split('/').map{|e|e.chars.map(&:to_i)}
	q=[[0,2,0]]
	z={q[0]=>0}
	while !q.empty?
		n,cx,cy=q.shift
		[[-1,0],[0,-1],[1,0],[0,1]].each{|dx,dy|
			[0,1].each{|dn|
				nn,nx,ny=n+dn,cx+dx,cy+dy
				next if nn>1
				if 0<=nx&&nx<a[0].size && 0<=ny&&ny<a.size && !z[[nn,nx,ny]] && (
					(dn==1&&(a[cy][cx]-a[ny][nx]).abs<=3) || (a[cy][cx]-a[ny][nx]).abs<=1
				)
					z[[nn,nx,ny]]=z[[n,cx,cy]]+1
					q<<[nn,nx,ny]
				end
			}
		}
		#a[cy][cx]='*'
	end
	z.each_key{|n,x,y|a[y][x]='*'}
	puts a.map(&:join)*'/'
end
