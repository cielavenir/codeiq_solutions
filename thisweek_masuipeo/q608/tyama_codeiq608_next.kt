//usr/bin/env kscript $0 $@;exit
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
	val e=Array<Int>(N*2+1){0}
	val f=Array<Int>(N*2+1){0}
	do{
		for(i in 0..N*2-1)e[i+1]=e[i]+e0[i]
		do{
			run outer@{
				for(i in 0..N*2-1){
					f[i+1]=f[i]+f0[i]
					if(e[i]==f[i]&&e[i+1]==f[i+1])return@outer
				}
				r++
			}
		}while(next_permutation(f0))
	}while(next_permutation(e0))
	println(r)
}
