#include <stdio.h>
int N=10,F[]={3,5,7,11,13,17,19,23,29,31};
long long solve(long long ma){
	int i=1,j,n;
	long long r=0;
	for(;i<1<<N;i++){
		int n=0;
		long long divisor=1;
		for(n=j=0;j<N;j++)if(i&(1<<j))n++,divisor*=F[j];
		long long items=ma/divisor;
		r+=(n%2*2-1)*items*(items+1)*divisor/2;
	}
	return r;
}
int main(){
	printf("%lld\n",solve(100000));
	printf("%lld\n",solve(1000000000));
}