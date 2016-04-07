#include <vector>
#include <map>
#include <algorithm>
#include <functional>
#include <cstdio>
using namespace std;

void dfs(const vector<int> &lst,int d,int s,const function<void(int)> &f){
	if(d==0){
		f(s);
	}else{
		for(auto &e:lst)dfs(lst,d-1,s+e,f);
	}
}

int main(){
	vector<int>lst={1,2,3,4};
	int N;
	scanf("%d",&N);
	map<int,long long>g,h;
	dfs(lst,N/2,0,[&](int s){g[s%9]++;});
	dfs(lst,N-N/2,0,[&](int s){h[s%9]++;});
	long long r=0;
	for(auto e:g)for(auto f:h){
		if((e.first+f.first)%9==0)r+=e.second*f.second;
	}
	printf("%lld\n",r);
}