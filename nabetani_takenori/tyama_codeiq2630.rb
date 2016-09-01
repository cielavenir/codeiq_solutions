#!/usr/bin/ruby
r,c=gets.chomp.each_char.zip([97,65]).map{|x,y|x.ord-y}
a=[]
0.upto(r){|i|
	a[i]=[1,i+1]
	2.step(c){|j|a[i][j]=a[i][j-1]+a[i][j-2]+(i==0 ? 0 : a[i-1][j])}
}
p a[r][c]