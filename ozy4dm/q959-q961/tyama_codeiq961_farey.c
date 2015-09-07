#include <stdio.h>
#define N 7777777
int T[N];long long p[N];
int main(){
	int i,j;
	for(i=0;i<N;i++)p[i]=i;
	for(i=2;i<N;i++)if(!T[i])for(j=i;j<N;j+=i)T[j]=1,p[j]-=p[j]/i;
	for(i=1;i<N;i++)p[i]+=p[i-1];
	printf("%lld\n",p[N-1]*2+1); //36775823261333
	return 0;
}
//直線y=xより下にいる各牛はファレイ数列(0を含んで1を含まない)の各項に対応する。よってファレイ数列の項数を2倍して(x,y)=(1,1)の分を足せば良い。