#!/usr/bin/ruby
H=3
W=4
A=[[2]+[3]*(W+1-2)+[2]] + (H-1).times.map{[3]+[4]*(W+1-2)+[3]} + [[2]+[3]*(W+1-2)+[2]]
T=[
	[[0,0],[0,0]],
	[[0,1],[1,0]],
	[[1,0],[0,1]],
	[[1,1],[1,1]],
]
p T.repeated_permutation(H*W).count{|a|
	a.each_with_index{|e,i|
		A[i/W+0][i%W+0]+=e[0][0]
		A[i/W+0][i%W+1]+=e[0][1]
		A[i/W+1][i%W+0]+=e[1][0]
		A[i/W+1][i%W+1]+=e[1][1]
	}
	odd=A.reduce(0){|s,e|s+e.count(&:odd?)}
	a.each_with_index{|e,i|
		A[i/W+0][i%W+0]-=e[0][0]
		A[i/W+0][i%W+1]-=e[0][1]
		A[i/W+1][i%W+0]-=e[1][0]
		A[i/W+1][i%W+1]-=e[1][1]
	}
	odd==0 || odd==2
} # 6400