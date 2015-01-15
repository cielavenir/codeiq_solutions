#include <set>
#include <map>
#include <cstdio>
#define N 11
using namespace std;

//写像se->dは全射であるので、seのみメモ化すれば良い
map<set<int>,long long>memo;
long long dfs(int d,set<int> &se){
	if(!d)return 1;
	if(memo.find(se)!=memo.end())return memo[se];
	long long ret=0;
	for(int i=0;i<2*N-d-1;i++){
		if(se.find(i)==se.end() && se.find(i+d+1)==se.end()){
			se.insert(i);
			se.insert(i+d+1);
			ret+=dfs(d-1,se);
			se.erase(i);
			se.erase(i+d+1);
		}
	}
	return memo[se]=ret;
}

int main(){
	set<int> se;
	printf("%lld\n",dfs(N,se)); // 35584
}