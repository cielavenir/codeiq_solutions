#include <map>
#include <cstdio>
using namespace std;

int N;
map<long long,int>memo;
int dfs(int m,int h,int w){
	if(m==0)return 1;
	if(m<0||h==w)return 0;
	long long p=((long long)m<<20)|(h<<10)|w;
	if(memo.find(p)!=memo.end())return memo[p];
	long long r=0;
	for(int i=h+w,j=1;i<=N;i+=w,j+=1){
		r+=dfs(m-j,w,i);
	}
	return memo[p]=r;
}

int main(){
	int m;
	for(;~scanf("%d,%d",&N,&m);){
		long long r=0;
		for(int i=1;i<=N;i++)r+=dfs(m,0,i);
		printf("%lld\n",r);
	}
}