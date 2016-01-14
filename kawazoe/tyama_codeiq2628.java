import java.util.*;
class Main{
	public static void main(String[]args){
		Scanner cin=new Scanner(System.in);
		for(;cin.hasNext();){
			long a=cin.nextLong();
			long b=cin.nextLong();
			if(a==0)break;
			long n=b*b-a*a;
			long r=0;
			int i=1;
			for(;;i++){
				long x=n-(long)i*(i-1);
				if(x/i/2<=0)break;
				if(x%i==0&&x/i%2==1)r+=x/i/2 + x/i/2+i;
			}
			System.out.println(r);
		}
	}
}