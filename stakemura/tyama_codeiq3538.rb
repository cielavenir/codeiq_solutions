#!/usr/bin/ruby

def dcg(a)
	#https://github.com/cielavenir/dataleague/blob/master/2014/baseball_eval.rb
	return 0 if a.empty?
	if true
		a[0]+2.step(a.size).map{|i|a[i-1]/Math.log2(i+1)}.reduce(0,:+)
	else
		1.step(a.size).map{|i|(2**a[i-1]-1)/Math.log2(i+1)}.reduce(0,:+)
	end
end

a=$<.select{|e|!e.chomp.empty?}.map.with_index{|e,i|
	[-dcg(e.split.map(&:to_f)),i]
}.sort
r=[]
r[a[-1][1]]=z=a.size
(a.size-2).downto(0){|i|
	if a[i][0]!=a[i+1][0]
		z=i+1
	end
	r[a[i][1]]=z
}
p *r
