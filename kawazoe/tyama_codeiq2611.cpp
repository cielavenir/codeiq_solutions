#include <vector>
#include <cstdio>
int main(){
	int N,T;
	for(;~scanf("%d",&N);){
		T=N*(N+1)/2;
		if(T&1){
			puts("0");
		}else{
			T/=2;
			std::vector<long long>bag(T+1);
			bag[0]=1;
			for(int i=1;i<=N;i++)for(int j=T;j>=i;j--)bag[j]+=bag[j-i];
			printf("%lld\n",bag[T]);
		}
	}
}
/*
【コードの説明】
(1..N)の総和はN*(N+1)/2である。
よって、(1..N)の一部を使ってN*(N+1)/4にできる組み合わせの個数を求めれば良い。残りの符号を反転すれば合計が0になるからである。
なお、この「/4」は切り捨てではないので、整数にならなければ答えは0である。プログラミングにあたっては場合わけが必要となる。
【言語】
C++
*/