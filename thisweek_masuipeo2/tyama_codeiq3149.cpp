#pragma GCC optimize("O3")
//↑は必須。ちなみに計算量はO(NT 2^T)です。ループは1億回。よく通った。

#include <vector>
#include <unordered_map>
#include <cstdio>
using namespace std;
int main(){
	vector<int> T={1,5,10,50,100,500,1000,2000,5000,10000};
	int N,z=0;
	scanf("%d",&N);
	if(N>20000)z=(N-20000)/10000,N-=z*10000;
	vector<unordered_map<int,int>>A(N+1);
	A[0]={{0,0}};
	A[1]={{1,1}};
	A[2]={{1,2}};
	A[3]={{1,3}};
	A[4]={{1,4}};
	A[5]={{1,5},{2,1}};
	for(int i=/*1*/6;i<=N;i++){
		for(int j=/*0*/1;j<T.size();j++){
			if(i>=T[j]){
				for(auto &e:A[i-T[j]]){
					int k=e.first,v=e.second;
					if(A[i].find(k|1<<j)==A[i].end())A[i][k|1<<j]=1<<30;
					A[i][k|1<<j]=min(A[i][k|1<<j],v+1);
				}
			}
		}
	}
	int x=0,r;
	for(auto &e:A[N]){
		int p=__builtin_popcount(e.first);
		if(p>x){
			x=p;
			r=e.second;
		}
		if(p==x)r=min(r,e.second);
	}
	printf("%d\n",r+z);
}
