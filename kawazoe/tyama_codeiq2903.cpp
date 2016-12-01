#include <vector>
#include <cstdio>

const int M=1000003;
//the function prototype is broken due to funny ideone env.
int pow(long long x,long long y,int m){
	long long z=1;
	for(;y;y/=2){
		if(y%2)z=z*x%m;
		x=x*x%m;
	}
	return z;
}

int main(){
	int N;
	scanf("%d",&N);
	long long z=1,s=1;
	std::vector<int>t(N+1);
	for(int n=2;n<=N;n++)if(!t[n]){
		for(int j=n+n;j<=N;j+=n)t[j]=1;
		int i=N;
		long long p=0;
		for(;i;)p+=i/=n;
		p*=N;
		z=z*(n-1)%M;
		s=(s*(pow(n,p+1,M)-1)%M+M)%M;
	}
	printf("%d\n",(int)(s*pow(z,M-2,M)%M));
}
