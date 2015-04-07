#include <vector>
#include <cstdio>
using namespace std;

int main(){
	const int M=103;
	const int N=8;
	vector<vector<long long> > bag(N+1);
	for(int i=0;i<=N;i++)bag[i].resize(M*N+1);
	bag[0][0]=1;
	for(int i=1;i<=M;i++){
		for(int j=M*N;j>=i;j--){
			for(int k=1;k<=N;k++)bag[k][j]+=bag[k-1][j-i];
		}
	}
	long long r=0;
	for(int i=0;i<=M*N;i+=M)r+=bag[N][i];
	printf("%lld\n",r);
}
/*
【解答】：
2308369140
【方針】：
ナップザック問題のような動的計画法を用いた。
【コード】：
*/