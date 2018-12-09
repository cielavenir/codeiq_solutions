fun main(args: Array<String>){
	var s=readLine()
	while(s!=null){
		val n=s.toLong()
		if(n==0L)break
		var r:Long=0
		var i:Long=2
		while(true){
			val x=n-i*(i-1)/2
			if(x<i)break
			if(x%i==0L)r+=x/i
			i+=1
		}
		println(r)
		s=readLine()
	}
}
