//usr/bin/env scala $0 $@;exit
fun <T>reverse(a: Array<T>,start: Int,size: Int){
	val end=start+size-1
	for(i in 0..size/2-1){
		val z=a[start+i]
		a[start+i]=a[end-i]
		a[end-i]=z
	}
}
fun <T: Comparable<T>>next_permutation(a: Array<T>,n: Int):Boolean{
	if(n<0||a.size<n)return false
	reverse(a,n,a.size-n)
	var k = -1
	for(i in (a.size-2) downTo 0 step 1)if(a[i]<a[i+1]){k=i;break}
	if(k<0){
		reverse(a,0,a.size)
		return false
	}
	var l = -1
	for(i in a.size-1 downTo k+1 step 1)if(a[k]<a[i]){l=i;break}
	val z=a[k];a[k]=a[l];a[l]=z
	reverse(a,k+1,a.size-(k+1))
	return true
}
fun <T: Comparable<T>>next_permutation(a: Array<T>):Boolean{
	return next_permutation(a,a.size)
}
fun main(args: Array<String>){
	val N=6
	var r=0
	val e0=Array<Int>(N*2){0}
	val f0=Array<Int>(N*2){0}
	for(i in 0..N-1){e0[N+i]=1;f0[N+i]=1}
	val e=IntArray(N*2+1)
	val f=IntArray(N*2+1)
	do{
		for(i in 0..N*2-1)e[i+1]=e[i]+e0[i]
		do{
			var flg=0
			var zero1=0
			var zero2=N
			var one1=0
			var one2=N
			for(i in 0..N*2-1){
				if(e0[i]==0)zero1+=1
				if(e0[i]==1)one1+=1
				if(f0[N*2-1-i]==0)zero2-=1
				if(f0[N*2-1-i]==1)one2-=1
				if(zero1==zero2)flg+=1
				if(one1==one2)flg+=1
			}
			if(flg>=2)r+=1
		}while(next_permutation(f0))
	}while(next_permutation(e0))
	println(r);
}
