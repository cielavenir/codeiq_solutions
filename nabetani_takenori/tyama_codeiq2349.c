unsigned int popcnt32(unsigned int n){
	const unsigned int m1=0x55555555;
	const unsigned int m2=0x33333333;
	const unsigned int m4=0x0f0f0f0f;
	const unsigned int m8=0x00ff00ff;
	const unsigned int m16=0x0000ffff;
	n=((n>>1)&m1)+(n&m1);
	n=((n>>2)&m2)+(n&m2);
	n=((n>>4)&m4)+(n&m4);
	n=((n>>8)&m8)+(n&m8);
	n=((n>>16)&m16)+(n&m16);
	return n;
}
unsigned int clz32(unsigned int n){
	n|=n>>1;
	n|=n>>2;
	n|=n>>4;
	n|=n>>8;
	n|=n>>16;
	return 32-popcnt32(n);
}

#include <stdio.h>
#if defined(__GNUC__) || defined(__clang__)
	#define popcnt __builtin_popcount
	#define clz __builtin_clz
#else
	#define popcnt popcnt32
	#define clz clz32
#endif

int main(){
	int N;
	scanf("%d",&N);
	printf("%d\n",31-clz(N) + popcnt(N) - 1);
	return 0;
}

// N;main(){scanf("%d",&N);N=!printf("%d\n",30-__builtin_clz(N)+__builtin_popcount(N));}