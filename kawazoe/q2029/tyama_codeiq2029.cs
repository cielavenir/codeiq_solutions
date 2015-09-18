using System;
class StepUpSum{
	static void Main(){
		for(;;){
			string s=Console.ReadLine();
			if(s==null)break;
			long n=long.Parse(s);
			if(n==0)break;
			long r=0;
			int i=2;
			for(;;i++){
				long x=n-(long)i*(i-1)/2;
				if(x<i)break;
				if(x%i==0)r+=x/i;
			}
			Console.WriteLine(r);
		}
	}
}