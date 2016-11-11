#!/usr/bin/ruby
require 'json'

def dfs(z,lx,ly,lz,yz,xz,remove_candidate,a)
	return 1 if z==lz-1
	r=0
	(1<<remove_candidate[z].size).times{|i|
		f=true
		remove_candidate[z].size.times{|j|
			next if i[j]==0
			x,y=remove_candidate[z][j]
			a[z][y][x]=false
			f=false if z>0&&a[z-1][y][x]
		}
		if f
			ay=[false]*ly
			ax=[false]*lx
			ly.times{|y|
				lx.times{|x|
					ay[y]||=a[z][y][x]
					ax[x]||=a[z][y][x]
				}
			}
			if ay==xz[z] && ax==yz[z]
				r+=dfs(z+1,lx,ly,lz,yz,xz,remove_candidate,a)
			end
		end
		remove_candidate[z].size.times{|j|
			next if i[j]==0
			x,y=remove_candidate[z][j]
			a[z][y][x]=true
		}
	}
	r
end

xy,yz,xz=3.times.map{JSON.parse(gets.gsub('0','false').gsub('1','true'))}
yz.each(&:reverse!)
lz=xz.size
ly=xy.size
lx=xy[0].size
raise if lz!=yz.size || ly!=yz[0].size || lx!=xz[0].size
a=Array.new(xz.size){Array.new(xy.size){Array.new(xy[0].size,true)}}
xy.each_with_index{|e,y|e.each_with_index{|f,x|
	lz.times{|z|a[z][y][x]=false} if !f
}}
yz.each_with_index{|e,z|e.each_with_index{|f,y|
	lx.times{|x|a[z][y][x]=false} if !f
}}
xz.each_with_index{|e,z|e.each_with_index{|f,x|
	ly.times{|y|a[z][y][x]=false} if !f
}}
#この時点でaの最下段は固定されるため、二段目より上を考慮すれば良い
#yzとxz平面の確認だけで良い
remove_candidate=(lz-1).times.map{|z|
	r=[]
	ly.times{|y|lx.times{|x|
		r<<[x,y] if a[z][y][x]
	}}
	r
}
p dfs(0,lx,ly,lz,yz,xz,remove_candidate,a)

__END__
[[1,1,1],[1,1,1],[1,0,1]]
[[0,0,1],[0,1,1],[1,1,1]]
[[1,0,0],[1,1,0],[1,1,1]]
