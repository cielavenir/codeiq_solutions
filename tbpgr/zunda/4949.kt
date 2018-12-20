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

fun is4949(i:Int):Boolean{
	if(i<=0)return false
	if(i%10==4||i%10==9)return true
	return is4949(i/10)
}

fun main(args: Array<String>){
	val n=readLine()!!.toInt()
	var i=2
	var cnt=0
	while(cnt<n){
		if(is4949(i)&&isPrime(i)){
			print(i)
			if(cnt<n-1){
				print(",")
			}else{
				println()
			}
			cnt+=1
		}
		i+=1
	}
}
