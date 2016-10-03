#include <stdio.h>
int main(){
	int N,i=1;
	long long r=1;
	scanf("%d",&N);
	if(N>213)N=(N-213)%955+213;
	for(;i<N;i++)r=(r*r+r)%1000003;
	printf("%lld\n",r);
	return 0;
}