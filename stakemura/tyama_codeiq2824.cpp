#include <vector>
#include <cstdio>
#include <algorithm>
using namespace std;

int main(){
	int M,C,i,j;
	scanf("%d%d",&M,&C);
	vector<pair<int,int>>v;
	for(;~scanf("%d%d",&i,&j);){
		v.emplace_back(i,j);
	}
	vector<vector<int>>bag(M+1);
	for(i=0;i<=M;i++)bag[i].resize(C+1);
	bag[0][0]=1;
	//O(NCM) (<=500000)
	for(auto &e:v)for(j=C;j>=e.first;j--)for(i=1;i<=M;i++){
		if(bag[i-1][j-e.first]&&bag[i-1][j-e.first]+e.second>bag[i][j]){
			bag[i][j]=bag[i-1][j-e.first]+e.second;
		}
	}
	for(j=i=0;i<=M;i++)j=max(j,*max_element(bag[i].begin(),bag[i].end())-1);
	printf("%d\n",j);
}