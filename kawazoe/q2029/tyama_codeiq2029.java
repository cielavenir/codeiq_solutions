import java.util.*;
class Main{
	public static void main(String[]args){
		Scanner cin=new Scanner(System.in);
		for(;cin.hasNext();){
			long n=cin.nextLong();
			if(n==0)break;
			long r=0;
			int i=2;
			for(;;i++){
				long x=n-(long)i*(i-1)/2;
				if(x<i)break;
				if(x%i==0)r+=x/i;
			}
			System.out.println(r);
		}
	}
}