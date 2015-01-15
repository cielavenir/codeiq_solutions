#include <set>
#include <map>
#include <cstdio>
#define N 6
using namespace std;
map<set<int>,long long>memo;
long long dfs(set<int>&se){
	if(se.size()==2*N)return 1;
	if(memo.find(se)!=memo.end())return memo[se];
	long long r=0;
	for(int i=0;i<2*N;i++){
		if(se.find(i)==se.end() && (i%N==0||se.find(i-1)==se.end()) && (i%N==N-1||se.find(i+1)==se.end())){
			se.insert(i);
			r+=dfs(se);
			se.erase(i);
		}
	}
	if(r)return r;
	for(int i=0;i<2*N;i++){
		if(se.find(i)==se.end()){
			se.insert(i);
			r+=dfs(se);
			se.erase(i);
		}
	}
	return memo[se]=r;
}
int main(int argc,char **argv){
	set<int>se;
	printf("%lld\n",dfs(se)); // 14100480
}