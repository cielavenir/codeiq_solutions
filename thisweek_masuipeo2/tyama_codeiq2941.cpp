#include <vector>
#include <set>
#include <cstdio>
using namespace std;
set<int>SQ;

int dfs(int n,vector<int> &a){
	if(n==1){
		int x=0;
		for(int i=0;i<a.size();i++){
			int y=1;
			for(int j=i;j<a.size();j++){
				y*=a[j];
				if(SQ.find(y)!=SQ.end())x++;
			}
		}
		return x==1;
	}
	int r=0;
	for(auto &i:{2,3,5,6,7,8}){
		if(n%i||SQ.find(n/i)!=SQ.end())continue;
		a.push_back(i);
		r+=dfs(n/i,a);
		a.pop_back();
	}
	return r;
}

int main(){
	for(int i=2;i<10000;i++)SQ.insert(i*i);
	int N;
	scanf("%d",&N);
	vector<int>v;
	printf("%d\n",N==0||N==1 ? 1 : N==4||N==9 ? 2 : dfs(N,v));
}