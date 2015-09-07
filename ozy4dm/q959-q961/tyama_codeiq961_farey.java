class Main{
	static final int N=7777777;
	public static void main(String[]z){
		boolean[] T=new boolean[N];
		long[] p=new long[N];
		int i,j;
		for(i=0;i<N;i++)p[i]=i;
		for(i=2;i<N;i++)if(!T[i])for(j=i;j<N;j+=i){T[j]=true;p[j]-=p[j]/i;}
		for(i=1;i<N;i++)p[i]+=p[i-1];
		System.out.println(p[N-1]*2+1);
	}
}