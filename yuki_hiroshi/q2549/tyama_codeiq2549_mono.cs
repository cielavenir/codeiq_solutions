using System;
using System.IO;
using System.Reflection;

class BigInteger{
	private static readonly Type T=GetType();
	private readonly object val;
	private static Type GetType(){
		if(true){
			string path=Path.Combine(Path.GetDirectoryName(typeof(object).Assembly.Location),"Mono.Security.dll");
			return Assembly.LoadFile(path).GetType("Mono.Math.BigInteger");
		}else{
			string path=Path.Combine(Path.GetDirectoryName(typeof(object).Assembly.Location),"System.Numerics.dll");
			return Assembly.LoadFile(path).GetType("System.Numerics.BigInteger");
		}
	}
	private BigInteger(object _val){val=_val;}
	public override string ToString(){return val.ToString();}

	public static BigInteger operator +(BigInteger a,BigInteger b){
		return new BigInteger(T.GetMethod("Add",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger operator -(BigInteger a,BigInteger b){
		return new BigInteger(T.GetMethod("Subtract",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger operator *(BigInteger a, BigInteger b){
		return new BigInteger(T.GetMethod("Multiply",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger Parse(string _val){
		return new BigInteger(T.GetMethod("Parse", new []{typeof(string)}).Invoke(null, new []{_val}));
	}
	public static int Compare(BigInteger a, BigInteger b){
		return (int)T.GetMethod("Compare",new []{T,T}).Invoke(null, new []{a.val,b.val});
	}
}

class CodeIQ2549{
	static void mul(ref BigInteger a1,ref BigInteger b1,ref BigInteger c1,ref BigInteger d1,BigInteger a2,BigInteger b2,BigInteger c2,BigInteger d2){
		BigInteger t=a1*a2;
		BigInteger u=b1*c2;
		BigInteger a0=t+u;
		t=a1*b2;
		u=b1*d2;
		BigInteger b0=t+u;
		t=c1*a2;
		u=d1*c2;
		BigInteger c0=t+u;
		t=c1*b2;
		u=d1*d2;
		BigInteger d0=t+u;

		a1=a0;
		b1=b0;
		c1=c0;
		d1=d0;
	}
	static void Main(){
		BigInteger a1=BigInteger.Parse("1");
		BigInteger b1=BigInteger.Parse("0");
		BigInteger c1=BigInteger.Parse("0");
		BigInteger d1=BigInteger.Parse("1");
		BigInteger a2=BigInteger.Parse("1");
		BigInteger b2=BigInteger.Parse("1");
		BigInteger c2=BigInteger.Parse("1");
		BigInteger d2=BigInteger.Parse("0");

		int N=int.Parse(Console.ReadLine());
		N=(N+3)/2*2;
		for(;N>0;N>>=1){
			if((N&1)>0)mul(ref a1,ref b1,ref c1,ref d1,a2,b2,c2,d2);
			mul(ref a2,ref b2,ref c2,ref d2,a2,b2,c2,d2);
		}
		Console.WriteLine(c1-BigInteger.Parse("1"));
	}
}