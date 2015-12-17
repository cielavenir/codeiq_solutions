//usr/bin/env scala $0 $@;exit
import java.math.BigInteger

object Main{
	def mul(x: Array[BigInteger],y: Array[BigInteger]) = {
		val z=new Array[BigInteger](4)
		var t=BigInteger.ZERO
		var u=BigInteger.ZERO

		t=x(0).multiply(y(0))
		u=x(1).multiply(y(2))
		z(0)=t.add(u)
		t=x(0).multiply(y(1))
		u=x(1).multiply(y(3))
		z(1)=t.add(u)
		t=x(2).multiply(y(0))
		u=x(3).multiply(y(2))
		z(2)=t.add(u)
		t=x(2).multiply(y(1))
		u=x(3).multiply(y(3))
		z(3)=t.add(u)

		x(0)=z(0)
		x(1)=z(1)
		x(2)=z(2)
		x(3)=z(3)
	}

	def main(args: Array[String]) = {
		val cin=new java.util.Scanner(System.in)
		val x=new Array[BigInteger](4)
		val y=new Array[BigInteger](4)

		x(0)=BigInteger.ONE
		x(1)=BigInteger.ZERO
		x(2)=BigInteger.ZERO
		x(3)=BigInteger.ONE
		y(0)=BigInteger.ONE
		y(1)=BigInteger.ONE
		y(2)=BigInteger.ONE
		y(3)=BigInteger.ZERO

		var N=cin.nextInt()
		N=(N+3)/2*2
		while(N>0){
			if((N&1)>0)mul(x,y)
			mul(y,y)
			N/=2
		}
		x(2)=x(2).subtract(BigInteger.ONE)
		println(x(2))
	}
}