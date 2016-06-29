#include <vector>
#include <map>
#include <set>
#include <cstdio>
#include <cstring>
#include <cstdlib>
using namespace std;
typedef unsigned long long val_t;
//typedef __uint128_t val_t;

int N;
map<int,set<vector<int>>>M;

/// generate N-Queen ///
int D[4][2]={/*{-1,-1},{-1,0},{-1,1},{0,-1},*/{0,1},{1,-1},{1,0},{1,1}};
char m[99][99];
int grid(){
	int i=1,j,k,l;
	for(;i<=N;i++)for(j=1;j<=N;j++)if(m[i][j]=='Q')for(k=0;k<4;k++)for(l=1;m[i+D[k][0]*l][j+D[k][1]*l];l++)if(m[i+D[k][0]*l][j+D[k][1]*l]=='Q')return 0;
	return 1;
}
void dfs(int depth){
	if(!grid())return;
	int i=1,j;
	if(depth==N){
		vector<int> res;
		for(;i<=N;i++)res.push_back(strchr(m[i]+1,'Q')-(m[i]+1));
		M[res[0]].insert(res);
		return;
	}
	/*for(;i<=N;i++)*/for(j=1;j<=N;j++)if(m[depth+1][j]!='Q'){
		m[depth+1][j]='Q';
		dfs(depth+1);
		m[depth+1][j]='.';
	}
}
///

void dfs2(int depth,val_t _n){
	if(depth==N){
		printf("%d\n",N);
		exit(0);
	}
	for(auto &e:M[depth]){
		val_t n=_n;
		int i=0;
		for(;i<N;i++){
			val_t n0=((val_t)1)<<(e[i]+i*N);
			if(n&n0)break;
			n|=n0;
		}
		if(i==N)dfs2(depth+1,n);
	}
}

int main(){
	scanf("%d",&N); // 1,5,7,11で成立(11のテストは-m64必須)
	int i,j;
	for(;i<=N;i++)for(j=1;j<=N;j++)m[i][j]='.';
	dfs(0);

	dfs2(0,0);
	puts("0");
}