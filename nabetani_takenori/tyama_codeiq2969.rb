#!/usr/bin/ruby
def configure(a,x1,y1,x2,y2,dist,dsum)
	if a[x1][y1]<a[x2][y2]
		dist[dsum[x1]+y1][dsum[x2]+y2]=-1
	elsif a[x1][y1]>a[x2][y2]
		dist[dsum[x2]+y2][dsum[x1]+y1]=-1
	end
end
def solve(a)
	d=[0]+a.map(&:size)
	dsum=d.dup
	1.upto(d.size-1){|i|dsum[i]+=dsum[i-1]}
	n=d.reduce(:+)
	dist=n.times.map{|i|[Float::INFINITY]*i+[0]+[Float::INFINITY]*(n-i-1)}
	(0..6).each{|i|
		0.upto(a[i].size-2){|j|
			configure(a,i,j,i,j+1,dist,dsum)
		}
	}
	(0..2).each{|i|
		0.upto(a[i].size-1){|j|
			configure(a,i,j,i+1,j,dist,dsum)
			configure(a,i,j,i+1,j+1,dist,dsum)
		}
	}
	(4..6).each{|i|
		0.upto(a[i].size-1){|j|
			configure(a,i,j,i-1,j,dist,dsum)
			configure(a,i,j,i-1,j+1,dist,dsum)
		}
	}
	#Warshall-Floyd
	n.times{|k|n.times{|i|n.times{|j|
		dist[i][j]=[dist[i][j],dist[i][k]+dist[k][j]].min
	}}}
	1-dist.map(&:min).min
end

$<.each{|e|
	p solve(e.chomp.split('/').map{|e|e.bytes})
	STDOUT.flush
}