#!/usr/bin/env ruby
#http://nabetani.sakura.ne.jp/hena/ordf05rotblo/
#http://qiita.com/Nabetani/items/a6ed674166a151fd0a0a
STDOUT.sync=true
def rotate_point(a,cx,cy)
    # 六角形の座標は、
    # [ [1,0],[0,1],[-1,1],[-1,0],[0,-1],[1,-1] ]
	# のようになる。
    # x成分とy成分に分解し、[-1,1]と[-1,0]に変換・合成すればよいとわかる。
	a.map{|x,y|
		x=x-cx
		y=y-cy
		[-x-y+cx,x+cy]
	}
end
H=5
A=[[2,4],[1,4],[0,4],[0,3],[0,2]]
while gets
	t,a=$_.split
	a=a.split('/')
	b=[]
	H.times{|h|a[h].chars.each_with_index{|e,i|b<<[A[h][0]+i,h] if e=='1'}}
	if t=='a'
		b=rotate_point(b,1,2)
	else
		#点群を回転点bの上のマスからの相対座標とする。
		#上のマスを右下に移動し、移動後の右下のマスを中心にして回転移動する。
		b=rotate_point(b.map{|x,y|[x,y+1]},3,2)
	end
	if b.any?{|x,y|
		y<0||H<=y || !Range.new(*A[y]).include?(x)
	}
		puts :-
	else
		a=H.times.map{|i|['0']*(A[i][1]-A[i][0]+1)}
		b.each{|x,y|a[y][x-A[y][0]]='1'}
		puts a.map(&:join)*'/'
	end
end
