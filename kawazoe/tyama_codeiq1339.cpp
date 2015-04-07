#include <algorithm>
#include <map>
#include <tuple>
#include <cstdio>
using namespace std;
typedef tuple<int,int,int> tiii;

//const int D=6,M=4;
//const int D=12,M=3;
const int D=30,M=5;

map<tiii,long long>memo;

long long dfs(int d,int cur,int m){
	if(d==D){
		return m==M;
	}else if(m>M){
		return 0;
	}else{
		tiii t=make_tuple(d,cur,m);
		if(memo.find(t)!=memo.end())return memo[t];
		long long r=0;
		r+=dfs(d+1,0,m);
		r+=dfs(d+1,cur+1,max(m,cur+1));
		return memo[t]=r;
	}
}

int main(){
	printf("%lld\n",dfs(0,0,0));
}

/*
【解答】：189489255
【方針】：「今見ている石は何番目か、現在連続している石の数、今まで最大連続の石の数」でメモ化
【コード】：
*/