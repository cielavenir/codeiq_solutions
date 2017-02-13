using System;
using System.IO;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

class BigInteger : IComparable<BigInteger>{
	private static readonly Type T=GetType();
	private readonly object val;
	private static Type GetType(){
		if(false){
			string path=Path.Combine(Path.GetDirectoryName(typeof(object).Assembly.Location),"Mono.Security.dll");
			return Assembly.LoadFile(path).GetType("Mono.Math.BigInteger");
		}else{
			string path=Path.Combine(Path.GetDirectoryName(typeof(object).Assembly.Location),"System.Numerics.dll");
			return Assembly.LoadFile(path).GetType("System.Numerics.BigInteger");
		}
	}
	private BigInteger(object _val){val=_val;}
	public override string ToString(){return val.ToString();}
	public BigInteger Abs(){
		return new BigInteger(T.GetMethod("Abs",new []{T}).Invoke(null, new []{this.val}));
	}
	public BigInteger Gcd(BigInteger b){
		BigInteger a=this;
		return BigInteger.Compare(b,0)!=0 ? b.Gcd(a%b):a;
	}

	public static BigInteger operator +(BigInteger a,BigInteger b){
		return new BigInteger(T.GetMethod("Add",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger operator -(BigInteger a,BigInteger b){
		return new BigInteger(T.GetMethod("Subtract",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger operator *(BigInteger a, BigInteger b){
		return new BigInteger(T.GetMethod("Multiply",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger operator /(BigInteger a, BigInteger b){
		return new BigInteger(T.GetMethod("Divide",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}
	public static BigInteger operator %(BigInteger a, BigInteger b){
		return new BigInteger(T.GetMethod("Remainder",new []{T,T}).Invoke(null, new []{a.val,b.val}));
	}

	public int CompareTo(BigInteger o){
		return (int)T.GetMethod("CompareTo",new []{T}).Invoke(this.val, new []{o.val});
	}
	public static int Compare(BigInteger a, BigInteger b){
		return (int)T.GetMethod("Compare",new []{T,T}).Invoke(null, new []{a.val,b.val});
	}
	public static BigInteger Parse(string _val){
		return new BigInteger(T.GetMethod("Parse", new []{typeof(string)}).Invoke(null, new []{_val}));
	}
	public static implicit operator BigInteger(int _val){
    	return new BigInteger(T.GetMethod("op_Implicit", new []{typeof(int)}).Invoke(null, new  object[]{_val}));
	}

	public BigInteger pow_binary_mod(BigInteger y, BigInteger m){
		BigInteger x = this;
		BigInteger z = 1;
		while(BigInteger.Compare(y,0)!=0){
			if(BigInteger.Compare(y%2,0)!=0)z=z*x%m;
			x=x*x%m;
			y/=2;
		}
		return z;
	}
	public bool miller_rabin(){
		BigInteger n=this.Abs(); //todo//
		if(BigInteger.Compare(n,2)==0)return true;
		if(BigInteger.Compare(n,1)==0||BigInteger.Compare(n%2,0)==0)return false;
		BigInteger d=n-1;
		int s=0;
		while(BigInteger.Compare(d%2,0)==0){
			d/=2;
			s+=1;
		}
		BigInteger a=1;
		for(int z=0;z<5;z++){ //todo//
			a+=1;
			while(BigInteger.Compare(a.Gcd(n),1)!=0)a+=1; //todo//
			BigInteger r=a.pow_binary_mod(d,n);
			if(BigInteger.Compare(r,1)==0||BigInteger.Compare(r,n-1)==0)continue;
			if(Enumerable.Range(0,s).All(_ => { // None n-1==
					r=r.pow_binary_mod(2,n);
					return BigInteger.Compare(r,n-1)!=0;
			}))return false;
		}
		return true;
	}
	public BigInteger rhonext(BigInteger x,BigInteger n,BigInteger seed){return (x*x+seed)%n;}
	public BigInteger rho3(){
		//get one divisor
		BigInteger n=this;
		Debug.Assert(BigInteger.Compare(n,2)>=0);
		foreach(var seed in new[]{1,3,5}){ //todo//
			BigInteger x,y;
			x=y=1; //todo//
			long q,i;
			q=i=1;
			for(;;){
				if(i==q){
					y=x;
					q*=2;
				}
				x=rhonext(x,n,(BigInteger)seed);
				BigInteger d=(x-y).Abs().Gcd(n);
				if(BigInteger.Compare(d,1)>0){
					if(d==n)break;
					return d;
				}
				i+=1;
			}
		}
		return null;
	}
	public List<BigInteger> rho2(){
		//get all divisors
		BigInteger n=this;
		Debug.Assert(BigInteger.Compare(n,2)>=0);
		List<BigInteger> r=new List<BigInteger>();
		while(BigInteger.Compare(n,1)>0){
			//System.Console.WriteLine(n);
			//System.Console.WriteLine(n.miller_rabin());
			if(n.miller_rabin()){
				r.Add(n);
				return r;
			}else{
				BigInteger x=n.rho3();
				if(x==null){
					//STDERR.puts "suspicious: %d"%n
					r.Add(n);
					return r;
				}
				foreach(var e in x.rho2())r.Add(e);
				n/=x;
			}
		}
		return r;
	}
	public List<BigInteger> rho(){
		BigInteger n=this;
		List<BigInteger> r=new List<BigInteger>();
		if(BigInteger.Compare(n,0)<0){
			r.Add(-1);
			n=n*-1;
		}
		if(BigInteger.Compare(n,2)<0)return r;
		foreach(var e in new[]{2}){ //todo//
			while(BigInteger.Compare(n%e,0)==0){
				n/=e;
				r.Add(e);
			}
		}
		if(BigInteger.Compare(n,1)==0)return r;
		foreach(var e in n.rho2())r.Add(e);
		return r;
	}
}

class CodeIQ197{
	public static BigInteger prod(List<BigInteger> e){
		BigInteger r=1;
		foreach(var f in e)r*=f;
		return r;
	}
	public static long pow3(int n){
		long r=1;
		for(int i=0;i<n;i++)r*=3;
		return r;
	}
	public static void Main(){
		BigInteger N=BigInteger.Parse("280671392065546467397265294532969672241810318954163887187279320454220348884327");
		List<BigInteger> table=N.rho();
		int l=table.Count();
		BigInteger m=N*2+1;
		List<List<BigInteger>>r=new List<List<BigInteger>>();
		for(var i=0;i<pow3(l-2)*2;i++){
			List<List<BigInteger>> table2=Enumerable.Range(0,3).Select(_=>new List<BigInteger>()).ToList();
			for(int j=0;j<table.Count();j++)table2[(int)(i/pow3(j)%3)].Add(table[j]);
			List<BigInteger> edge=table2.Select(e=>prod(e)).ToList();
			BigInteger surface=edge[0]*edge[1]+edge[1]*edge[2]+edge[2]*edge[0];
			if(BigInteger.Compare(surface,m)<0){
				m=surface;
				r=table2;
			}
		}
		Console.WriteLine(string.Join("x",r.Select(e=>prod(e)).OrderBy(e=>e)));
	}
}

//56412637156759097412131861x63634925160141537479761109x78185498323479435878944223
