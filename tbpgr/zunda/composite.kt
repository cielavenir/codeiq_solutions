fun isqrt(n:Int):Int{
	if(n<=0)return 0
	if(n<4)return 1
	var x=0
	var y=n
	while(x!=y&&x+1!=y){x=y;y=(n/y+y)/2}
	return x
}

fun isPrime(i:Int):Boolean{
	if(i<2){
		return false
	}
	for(j in 2..isqrt(i)){
		if(i%j<1){
			return false
		}
	}
	return true
}

fun main(args: Array<String>){
	val n=readLine()!!.toInt()
	var i=2
	var cnt=0
	var s=0
	while(cnt<n){
		if(!isPrime(i)){
			s+=i
			cnt+=1
		}
		i+=1
	}
	println(s)
}
