#include <stdio.h>
#define D 9
void dfs(long long s,long long power10,int d){
	if(d==D){
		printf("%lld\n",s);
		return;
	}
	int i=0;
	if(d==D-1)i=1;
	for(;i<=9;i++){
		long long t=s+power10*i;
		if((__int128_t)t*t%(power10*10)==t)dfs(t,power10*10,d+1);
	}
}
int main(){
	dfs(0,1,0);
	return 0;
}
/*
【解答】
212890625
787109376
【方針】
D>=2として、「D桁の自然数Nを2乗した数の下D桁が同じNになる」ならば、「(D-1)桁の自然数Nを2乗した数の下(D-1)桁が同じNになる」ことが言えるので、下側から桁を決定することができる。計算量はO(logn)となる。
__int128_t導入により18桁まで求めることができ、それでも0.01秒未満であった。
256259918212890625
743740081787109376
【コード】
*/