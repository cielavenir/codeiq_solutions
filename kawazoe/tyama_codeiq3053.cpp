//http://sucrose.hatenablog.com/entry/2014/10/10/235805

#include <vector>
#include <cstdio>

//N=6e6まで1秒以内です
int main(){
	long long N,R=0;
	scanf("%lld",&N);
	N++;
	std::vector<long long>v(N+1);
	for(int i=2;i<=N;i++){
		for(int j=i;j<=N;j+=i)v[j]++;
		R+=v[i];
	}
	printf("%lld\n",R+N-2*N+1);
}
