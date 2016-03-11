#include <vector>
#include <algorithm>
#include <numeric>
#include <cstdio>
using namespace std;

int main(){
	int N,r=0;
	scanf("%d",&N);
	vector<int>v(N);
	iota(v.begin(),v.end(),1);
	do{
		int n=N;
		for(int i=N-1;i>=0;i--){
			if(v[i]==n)n--;
		}
		r+=n;
	}while(next_permutation(v.begin(),v.end()));
	printf("%d\n",r);
}