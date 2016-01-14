#include <stdio.h>
int main(){
	long long n,a,b;
	for(;~scanf("%lld%lld",&a,&b)&&a;){
		n=b*b-a*a;
		long long r=0;
		int i=1;
		for(;;i++){
			long long x=n-(long long)i*(i-1);
			if(x/i/2<=0)break;
			if(x%i==0&&x/i%2==1)r+=x/i/2 + x/i/2+i;
		}
		printf("%lld\n",r);
	}
	return 0;
}