using System;
class SquareQuartet{
	static void Main(){
		for(;;){
			string s=Console.ReadLine();
			if(s==null)break;
			string[] _s=s.Split(' ');
			long a=long.Parse(_s[0]);
			long b=long.Parse(_s[1]);
			if(a==0)break;
			long n=b*b-a*a;
			long r=0;
			int i=1;
			for(;;i++){
				long x=n-(long)i*(i-1);
				if(x/i/2<=0)break;
				if(x%i==0&&x/i%2==1)r+=x/i/2 + x/i/2+i;
			}
			Console.WriteLine(r);
		}
	}
}