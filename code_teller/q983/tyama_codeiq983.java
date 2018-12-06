import java.util.*;
class Main{
	public static void main(String[]args){
		Scanner cin=new Scanner(System.in);
		long starting=5;
		int bse=10;
		for(;cin.hasNext();){
			long n=cin.nextLong();
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
			System.out.println(num%bse);
		}
	}
}