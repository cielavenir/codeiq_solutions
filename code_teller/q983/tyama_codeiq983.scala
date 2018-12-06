//usr/bin/env scala $0 $@;exit
object Main{
	def main(args: Array[String]) = {
		val cin=new java.util.Scanner(System.in)
		val starting:Long=5
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
			for(i<-1 to (digits-1-n%digits).toInt)num/=bse
			println(num%bse)
		}
	}
}