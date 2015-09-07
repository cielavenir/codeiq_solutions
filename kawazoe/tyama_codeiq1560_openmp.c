#include <stdio.h>

#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_max_threads() 1
#define omp_get_thread_num() 0
#endif

int N=10,F[]={3,5,7,11,13,17,19,23,29,31};
long long solve(long long ma){
	long long r=0;
	long long i;
#pragma omp parallel for reduction(+:r)
	for(i=0;i<ma;i++){
		int j=0;
		for(;j<N;j++)if(i%F[j]==0)break;
		if(j<N)r+=i;
	}
	return r;
}
int main(){
	printf("%lld\n",solve(100000));
	printf("%lld\n",solve(1000000000));
}