#include <stdio.h>
const int N=1000000;
int main(){
	long long a=1,b=3,c;
	int i=2;
	for(;i<=N;i++){
		c=a*b%1000000;
		a=b,b=c;
	}
	printf("%lld\n",b);
	return 0;
}
/*
【解答】：
733307
【方針】：
指数法則よりa**(b+c)==a**b*a**cであるから、
3**F(n)をG(n)と置くと、G(0)=1、G(1)=3、G(n+2)=G(n)*G(n+1)%1000000とできる。
【コード】：
*/