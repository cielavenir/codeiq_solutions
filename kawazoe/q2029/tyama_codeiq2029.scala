//usr/bin/env scala $0 $@;exit
object Main{
	def calc(r:Long,i:Long,n:Long):Long = {
		val x = n-i*(i-1)/2
		if(x>=i){
			if(x%i==0){
				calc(r+x/i,i+1,n)
			}else{
				calc(r,i+1,n)
			}
		}else{
			r
		}
	}

	def main(args: Array[String]) = {
		val cin=new java.util.Scanner(System.in)
		while(cin.hasNext()){
			var n=cin.nextLong()
			if(n>0)println(calc(0,2,n))
		}
	}
}