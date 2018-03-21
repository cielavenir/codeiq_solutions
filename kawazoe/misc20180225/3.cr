#!/usr/bin/env crystal
def f(k : Int64,n : Int64,mod : Int64)
	raise("k<=0") if k<=0
	return 1_i64 if k==1_i64
if true
	# リングバッファ
	hsize=k+1_i64
	h=[0_i64]*hsize
	h[0]=1_i64
	h[1]=k
	s=k+1_i64
	(2_i64..n).each{|i|
		h[i%hsize]=((k+2)*h[(i-1)%hsize]-s-h[(i-k-1)%hsize])%mod
		s=(h[i%hsize]+s-h[(i-k)%hsize])%mod
		if i%1000000==0
			STDERR.puts i
		end
	}
	h[n%hsize]
else
	h=Hash(Int64,Int64).new 0_i64 # 添字が0より小さくなりうるので連想配列で手抜きをする
	h[0_i64]=1_i64
	h[1_i64]=k
	s=k+1_i64
	(2_i64..n).each{|i|
		h[i]=((k+2)*h[i-1]-s-h[i-k-1])%mod
		s=(h[i]+s-h[i-k])%mod
		h.delete(i-k-1) # メモリが危ないので
		if i%1000000==0
			# 明示的にcollectしないと
			# Too many heap sections: Increase MAXHINCR or MAX_HEAP_SECTS
			# っていうエラーが出るの、結構やばくありません？
			GC.collect 
			STDERR.puts i
		end
	}
	h[n]
end
end
puts f(3_i64,1_i64,100000000_i64)
puts f(3_i64,2_i64,100000000_i64)
puts f(3_i64,3_i64,100000000_i64)
puts f(3_i64,4_i64,100000000_i64)
puts f(5_i64,10_i64,100000000_i64)

puts f(10_i64,10000000000_i64,100000000_i64)
puts f(10000_i64,1000000_i64,100000000_i64)
