fun isPrime(i:Int):Boolean{
	for(j in 2..i-1){
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
