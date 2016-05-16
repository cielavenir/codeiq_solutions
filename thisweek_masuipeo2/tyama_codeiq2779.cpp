#include <vector>
#include <algorithm>
#include <numeric>
#include <cstdio>
using namespace std;

int solve(vector<vector<int>> &a){
	int n=0;
	for(int i=0;i<a.size();i++){
		for(int j=0;j<a[i].size()-2;j++){
			for(int k=j+2;k<a[i].size();k++){
				int c=a[i][j],d=a[i][j+1],e=a[i][k],f=a[i][(k+1)%a[i].size()];
				if(c==f)continue;
				bool e_inside=(c<e&&e<d) ^ (d<e&&e<c);
				bool f_inside=(c<f&&f<d) ^ (d<f&&f<c);
				if(e_inside^f_inside)n+=1;
			}
		}
	}
	return n;
}

int main(){
	int N,r=0;
	scanf("%d",&N);
	vector<int>a(N);
	iota(a.begin(),a.end(),0);
	do{
		vector<bool>f(N);
		vector<vector<int>>b;
		for(int i=0;i<N;i++){
			if(f[i])continue;
			int cur=i;
			vector<int>c;
			do{
				c.push_back(cur);
				f[cur]=true;
				cur=a[cur];
			}while(cur!=i);
			b.emplace_back(move(c));
		}
		if(
			any_of(b.begin(),b.end(),[](const vector<int>&e){return e.size()<3;}) ||
			b.size()>1
		)continue;
		r+=solve(b);
	}while(next_permutation(a.begin(),a.end()));
	printf("%d\n",r);
}