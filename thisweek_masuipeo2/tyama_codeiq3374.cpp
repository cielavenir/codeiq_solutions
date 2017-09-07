#include <unordered_map>
#include <cstdio>
using namespace std;
int N;

//写像se->dは全射であるので、seのみメモ化すれば良い
unordered_map<int,long long>memo;
long long dfs(int d,int se){
	if(!d)return __builtin_ctz(~se);
	if(memo.find(se)!=memo.end())return memo[se];
	long long ret=2*N+1;
	for(int i=0;i<2*N-d/*-1*/;i++){
		if((se&(1<<i))==0 && (se&(1<<i+d+1))==0){
			ret=min(ret,dfs(d-1,se|(1<<i)|(1<<i+d+1)));
		}
	}
	return memo[se]=ret;
}

int main(){
	scanf("%d",&N);
	printf("%lld\n",2*N+1-dfs(N,0));
}