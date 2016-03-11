#include <map>
#include <cstdio>
using namespace std;

int A,B;
map<pair<int,int>,int>memo;
int dfs(int a,int n){
	if(a==0||a==A+B)return 1;
	if(n==0)return 0;
	pair<int,int> p=make_pair(a,n);
	if(memo.find(p)!=memo.end())return memo[p];
	return memo[p]=dfs(a+1,n-1)+dfs(a-1,n-1)+dfs(a,n-1);
}

int main(){
	int n;
	for(;~scanf("%d,%d,%d",&A,&B,&n);){
		printf("%d\n",dfs(A,n));
	}
}