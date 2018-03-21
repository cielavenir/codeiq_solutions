#include <stdio.h>
#include <math.h>
int main(){
	int N,a,b;
	long long r=0;
	scanf("%d",&N);
	for(int n=1;n<=N;n++){
		//fprintf(stderr,"%d\n",n);
		//初項1 項数a+1/2 公差2
		//(a+1)/2 (2+(a-1))
		//(a+1)**2/4
		//(a+1)**2-(b+1)**2==4*n
		//(a-b)*(a+b+2)==4*n
		int i=2*n;
		long long m=4LL*n*n;
		for(;i>0&&(a=(m/i-2+i)/2)<=N&&(b=a-i)>=-1;i--){
			if(m%i==0 && (m/i-2+i)%2==0){
				//a-b==i, a+b==n/i-2
				//a=(m/i-2+i)/2
				//b=(m/i-2-i)/2
				if(a%2!=0&&b%2!=0)r+=1;
			}
		}
		//fprintf(stderr,"%lld\n",r);
	}
	printf("%lld\n",r);
}
