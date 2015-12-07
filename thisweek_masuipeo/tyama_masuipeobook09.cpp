#include <map>
#include <cstdio>
using namespace std;

int A,B; //A<B
map<pair<int,int>,int>memo;
int dfs(int a,int b){
	if(a==A&&b==B)return 1;
	if(a>A||b>B)return 0;
	int d=b-a;
	if(d==0||d==B-A)return 0;
	pair<int,int> p=make_pair(a,b);
	if(memo.find(p)!=memo.end())return memo[p];
	return memo[p]=dfs(a+1,b)+dfs(a,b+1);
}

int main(){
	for(;~scanf("%d%d",&A,&B);){ //20 10
		if(A>B)A^=B,B^=A,A^=B;
		printf("%d\n",dfs(0,1)<<(A==B));
	}
}