import java.util.*
fun main(args: Array<String>){
	val cin = Scanner(System.`in`)
	val starting;Long=5
	val bse=10
	while(cin.hasNext()){
		var n=cin.nextLong()
		n+=starting-2
		var digits:Long=1
		var expbase:Long=1
		var x:Long=bse-1
		while(x<=n){
			n-=x
			digits+=1
			expbase*=bse
			x=digits*expbase*(bse-1)
		}
		var num=expbase+n/digits
		var d:Long=0
		while(d<digits-1-n%digits)num/=bse
		println(num%bse)
	}
}