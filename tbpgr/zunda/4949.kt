fun isPrime(i:Int):Boolean{
	for(j in 2..i-1){
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
