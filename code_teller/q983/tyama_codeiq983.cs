using System;
class CodeIQ983{
	static void Main(){
		long starting=5;
		int bse=10;
		for(;;){
			string s=Console.ReadLine();
			if(s==null)break;
			long n=long.Parse(s);
			n+=starting-2;
			long digits=1;
			long expbase=1;
			long x;
			for(;(x=digits*expbase*(bse-1))<=n;n-=x){
				digits++;
				expbase*=bse;
			}
			long num=expbase+n/digits;
			long d=digits-1-n%digits;
			for(;d-->0;num/=bse);
			Console.WriteLine(num%bse);
		}
	}
}