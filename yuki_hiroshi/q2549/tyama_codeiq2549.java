import java.util.*;
import java.math.*;

class Main{
	static void mul(BigInteger[] x,BigInteger[] y){
		BigInteger[] z=new BigInteger[4];
		BigInteger t,u;

		t=x[0].multiply(y[0]);
		u=x[1].multiply(y[2]);
		z[0]=t.add(u);
		t=x[0].multiply(y[1]);
		u=x[1].multiply(y[3]);
		z[1]=t.add(u);
		t=x[2].multiply(y[0]);
		u=x[3].multiply(y[2]);
		z[2]=t.add(u);
		t=x[2].multiply(y[1]);
		u=x[3].multiply(y[3]);
		z[3]=t.add(u);

		x[0]=z[0];
		x[1]=z[1];
		x[2]=z[2];
		x[3]=z[3];
	}

	public static void main(String[]args){
		Scanner cin=new Scanner(System.in);
		BigInteger[] x=new BigInteger[4];
		BigInteger[] y=new BigInteger[4];

		x[0]=BigInteger.ONE;
		x[1]=BigInteger.ZERO;
		x[2]=BigInteger.ZERO;
		x[3]=BigInteger.ONE;
		y[0]=BigInteger.ONE;
		y[1]=BigInteger.ONE;
		y[2]=BigInteger.ONE;
		y[3]=BigInteger.ZERO;

		int N=cin.nextInt();
		N=(N+3)/2*2;
		for(;N>0;N>>=1){
			if((N&1)>0)mul(x,y);
			mul(y,y);
		}
		x[2]=x[2].subtract(BigInteger.ONE);
		System.out.println(x[2]);
	}
}