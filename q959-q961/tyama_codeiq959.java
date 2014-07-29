import java.util.*;
class Main{
	static final int N=7;
	static int gcd(int x,int y){return y>0?gcd(y,x%y):x;}
	public static void main(String[]z){
		Set<Long>dict=new TreeSet<Long>();
		for(int i=1;i<N;i++)for(int j=1;j<N;j++){
			int g=gcd(i,j);
			dict.add(((long)(i/g)<<32)|(j/g));
		}
		System.out.println(dict.size()+2); // 2: x=0 and y=0
	}
}