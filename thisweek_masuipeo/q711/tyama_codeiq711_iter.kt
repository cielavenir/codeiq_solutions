//usr/bin/env kscript $0 $@;exit
fun <T>reverse(a: Array<T>,start: Int,size: Int){
	val end=start+size-1
	for(i in 0..size/2-1){
		val z=a[start+i]
		a[start+i]=a[end-i]
		a[end-i]=z
	}
}
fun <T: Comparable<T>>unique_permutation(a0: Array<T>,n: Int):Sequence<Array<T>>{
	return sequence seq@{
		if(n<0||a0.size<n)return@seq
		var a=a0.copyOf()
		while(true){
			yield(a.sliceArray(0..n-1))
			reverse(a,n,a.size-n)
			var k = -1
			for(i in (a.size-2) downTo 0 step 1)if(a[i]<a[i+1]){k=i;break}
			if(k<0){
				//reverse(a,0,a.size)
				break
			}
			var l = -1
			for(i in a.size-1 downTo k+1 step 1)if(a[k]<a[i]){l=i;break}
			val z=a[k];a[k]=a[l];a[l]=z
			reverse(a,k+1,a.size-(k+1))
		}
	}
}
fun <T: Comparable<T>>unique_permutation(a: Array<T>):Sequence<Array<T>>{
	return unique_permutation(a,a.size)
}
fun main(args: Array<String>){
	val N=6
	var r=0
	val e0=Array<Int>(N*2){0}
	val f0=Array<Int>(N*2){0}
	for(i in 0..N-1){e0[N+i]=1;f0[N+i]=1}
	val e=IntArray(N*2+1)
	val f=IntArray(N*2+1)
	for(e_ in unique_permutation(e0)){
		for(i in 0..N*2-1)e[i+1]=e[i]+e_[i]
		for(f_ in unique_permutation(f0)){
			var flg=0
			var zero1=0
			var zero2=N
			var one1=0
			var one2=N
			for(i in 0..N*2-1){
				if(e_[i]==0)zero1+=1
				if(e_[i]==1)one1+=1
				if(f_[N*2-1-i]==0)zero2-=1
				if(f_[N*2-1-i]==1)one2-=1
				if(zero1==zero2)flg+=1
				if(one1==one2)flg+=1
			}
			if(flg>=2)r+=1
		}
	}
	println(r);
}
