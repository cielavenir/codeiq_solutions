#!/usr/bin/ruby
#coding:utf-8

=begin
N=2 => 1
N=3 => 11
N=4 => 19
N=5 => 29
N=6 => 37
=end

N=6
#left,center,right
#nil(空)がidx番目にある時、DEST.eachとidx番目を交換可能
DEST=[[N,N+1]]+ #[[nil,N,N+1]]+
	1.step(N-2).map{|i|[N+i-1,N+i,N+i+1]}+
	[[N-1+N-1,N-1+N]]+ #[[N-1+N-1,N-1+N,nil]]+
	[[0,1]]+ #[[nil,0,1]]+
	(N+1).step(N-2+N).map{|i|[i-1-N,i-N,i+1-N]}+
	[[N-2,N-1]] #[[N-2,N-1,nil]]

START=[*0..N-2+N]+[nil]
GOAL=[nil]+[*1..N-2+N]+[0]

def backtrack(a)
	n=1
	n+=backtrack($back[0][a]) if a!=START
	#p a[0,N]
	#p a[N,N]
	n
end
def forwardtrack(a)
	n=1
	#p a[0,N]
	#p a[N,N]
	n+=forwardtrack($back[1][a]) if a!=GOAL
	n
end

queue=[[START,0],[GOAL,1]]
$back=[
	{START=>START},
	{GOAL=>GOAL},
]
while !queue.empty?
	cur,dir=queue.shift
	nxt=cur.dup
	idx=cur.index(nil)
	DEST[idx].each{|e|
		#next if !e
		nxt[e],nxt[idx]=nxt[idx],nxt[e]
		if !$back[dir][nxt]
			$back[dir][nxt.dup]=cur
			queue<<[nxt.dup,dir]
			if $back[dir^1][nxt]
				side_start=dir==0?cur:nxt
				side_end=dir==1?cur:nxt
				#(side_startとside_endをつなぐ分) - (始点+終点)
				p backtrack(side_start)+forwardtrack(side_end)+1-2
				exit
			end
		end
		nxt[e],nxt[idx]=nxt[idx],nxt[e]
	}
end