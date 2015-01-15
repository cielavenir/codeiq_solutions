#!/usr/bin/ruby
#coding:utf-8

#people
# 0 1 2 3 4 5
# 6 7 8 91011

#start
# 0 1 2 3 4 5
# 6 7 8 910-1
#goal
#-1 1 2 3 4 5
# 6 7 8 910 0

=begin
N=2 => 1
[nil, 1]
[2, 0]
[0, 1]
[2, nil]

N=3 => 3
[nil, 1, 2]
[3, 4, 0]
[3, 0, 2]
[1, 4, nil]
[3, 1, 2]
[0, 4, nil]
[0, 1, 2]
[3, 4, nil]

N=4 => 3
[nil, 1, 2, 3]
[4, 5, 6, 0]
[5, 1, 0, 3]
[4, 2, 6, nil]
[5, 1, 2, 3]
[4, 0, 6, nil]
[0, 1, 2, 3]
[4, 5, 6, nil]

※N=6は時間内に解けなかったのでN=2〜4から予想しました。
N=6 => 5
[nil, 1, 2, 3, 4, 5]
[6, 7, 8, 9, 10, 0]
[7, 1, 9, 3, 0, 5]
[6, 2, 8, 4, 10, 11]
[7, 1, 9, 3, 4, 5]
[6, 2, 8, 0, 10, 11]
[7, 1, 0, 3, 4, 5]
[6, 2, 8, 9, 10, 11]
[7, 1, 2, 3, 4, 5]
[6, 0, 8, 9, 10, 11]
[0, 1, 2, 3, 4, 5]
[6, 7, 8, 9, 10, 11]
=end

N=5
#stay,left,center,right
DEST=[[0,nil,N,N+1]]+
	1.step(N-2).map{|i|[i,N+i-1,N+i,N+i+1]}+
	[[N-1,N-1+N-1,N-1+N,nil]]+
	[[N,nil,0,1]]+
	(N+1).step(N-2+N).map{|i|[i,i-1-N,i-N,i+1-N]}+
	[[N-1+N,N-2,N-1,nil]]
=begin
DEST=[
	[0,nil,6,7],
	[1,6,7,8],
	[2,7,8,9],
	[3,8,9,10],
	[4,9,10,11],
	[5,10,11,nil],
	[6,nil,0,1],
	[7,0,1,2],
	[8,1,2,3],
	[9,2,3,4],
	[10,3,4,5],
	[11,4,5,nil],
]
=end
START=[*0..N-2+N]+[nil]
GOAL=[nil]+[*1..N-2+N]+[0]

def enum_nxt(cur,nxt,d)
	if d==DEST.size
		yield nxt
		return
	end
	if cur[d] #dさんはボールを持っている
		DEST[d].size.times{|i|
			#投げる先が未定義か、相手の受け取り元が確定している
			next if !DEST[d][i] || nxt[DEST[d][i]]
			nxt[DEST[d][i]]=cur[d]
			enum_nxt(cur,nxt,d+1){|e|yield e}
			nxt[DEST[d][i]]=nil
		}
	else
		enum_nxt(cur,nxt,d+1){|e|yield e}
	end
end

queue=[START]
back={START=>START}
depth={START=>0}
while !queue.empty?
	cur=queue.shift
	nxt_t=[nil]*DEST.size
	enum_nxt(cur,nxt_t,0){|nxt|
		if !depth[nxt]||depth[nxt]>depth[cur]+1
			back[nxt.dup]=cur
			depth[nxt.dup]=depth[cur]+1
			queue<<nxt.dup
			p nxt[0,N]
			p nxt[N,N]
		end
	}
end

nxt=GOAL
puts 'done.'
while nxt!=START
	p nxt[0,N]
	p nxt[N,N]
	nxt=back[nxt]
end
p nxt[0,N]
p nxt[N,N]