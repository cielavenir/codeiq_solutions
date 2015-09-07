using System;
class CodeIQ1026{
	static void Main(string[]args){
		decimal a=0,b=1,c;
		int n=int.Parse(Console.ReadLine());
		for(;n>0;n--){
			Console.Write(a);
			if(n>1){
				Console.Write(",");
			}else{
				Console.WriteLine();
			}
			c=a+b;
			a=b;
			b=c;
		}
	}
}