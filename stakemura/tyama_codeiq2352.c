#include <stdio.h>
void upper(long double N){
	int zi,zx,i;
	long double d=1;
	for(i=1;i<1000000;i++){
		int x=N*i,y=x+1;
		if(x>=1000000)break;
		if(N*i-x < d)d=N*i-x,zi=i,zx=x;
		if(y-N*i < d)d=y-N*i,zi=i,zx=y;
	}
	printf("%d %d\n",zx,zi);
}
void lower(long double N){
	int zi,zx,i;
	long double d=1;
	for(i=1;i<1000000;i++){
		int x=i/N,y=x+1;
		if(x>=1000000)break;
		if(i/N-x < d)d=i/N-x,zi=i,zx=x;
		if(y-i/N < d)d=y-i/N,zi=i,zx=y;
	}
	printf("%d %d\n",zi,zx);
}
int main(){
	long double N;
	scanf("%Lf",&N);
	if(N>=1)upper(N);else lower(N);
	return 0;
}