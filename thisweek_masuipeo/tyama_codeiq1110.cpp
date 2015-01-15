#include <vector>
#include <numeric>
#include <algorithm>
#include <cstdio>
using namespace std;

int main(){
	const int N=8;
	const int LIM=10000;
	vector<int>orig(N);
	iota(orig.begin(),orig.end(),1);
	int l=orig.size(),ret=0;
	do{
		vector<int>v=orig;
		int cur=0,cnt=0,f;
		for(;cnt<LIM;cnt++){
			f=0;
			for(int i=0;i<l;i++)if(v[i]){
				v[i]--;
				f+=v[i]==0;
			}
			if(f==v.size())break;
			for(int i=0;i<orig[cur];i++)v[(cur+i)%l]=orig[(cur+i)%l]-v[(cur+i)%l];
			cur=(cur+1)%l;
		}
		if(cnt<LIM)ret++;
	}while(next_permutation(orig.begin(),orig.end()));
	printf("%d\n",ret); // 6055
}