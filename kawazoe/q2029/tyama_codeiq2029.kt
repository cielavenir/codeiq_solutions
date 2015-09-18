import java.util.*
fun main(args: Array<String>){
	val cin = Scanner(System.`in`)
	while(cin.hasNext()){
		val n=cin.nextLong()
		if(n==0)break
		var r:Long=0
		var i:Long=2
		while(true){
			val x=n-i*(i-1)/2
			if(x<i)break
			if(x%i==0)r+=x/i
		}
		println(r)
	}
}