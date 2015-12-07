#include <map>
#include <cstdio>
using namespace std;

map<int,int>memo;
int dfs(int n){
	if(n==0)return 1;
	if(memo.find(n)!=memo.end())return memo[n];
	int r=0;
	for(int i=1;i<n;i+=2){
		r+=dfs(i-1)*dfs(n-i-1);
	}
	return memo[n]=r;
}

int main(){
	int N;
	for(;~scanf("%d",&N);)printf("%d\n",dfs(N));
}