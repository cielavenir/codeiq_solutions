#include <vector>
#include <cstdio>

int main(){
	int N,M=4;
	scanf("%d",&N);
	std::vector<long long>a(M*N+1);
	a[0]=1;
	for(int n=1;n<=N;n++){
		std::vector<long long>b(a);
		for(int m=1;m<=M;m++){
			for(int i=M*n;i>=m;i--)b[i]+=a[i-m];
		}
		for(int i=0;i<=M*n;i++){
			a[i]=b[i]-a[i];
		}
	}
	long long r=0;
	for(int i=9;i<=N*M;i+=9)r+=a[i];
	printf("%lld\n",r);
}