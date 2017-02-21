#include <vector>
#include <algorithm>
#include <numeric>
#include <cstdio>
using namespace std;
int chain(vector<int> a){ //a is copied
	int r=0;
	for(;a[0]!=1;r++)reverse(a.begin(),a.begin()+a[0]);
	return r;
}
int main(){
	int m,n,r=0;
	scanf("%d%d",&m,&n);
	vector<int> v(m);
	iota(v.begin(),v.end(),1);
	do{
		int n0=chain(v);
		if(n0==n)r++;
	}while(next_permutation(v.begin(),v.end()));
	printf("%d\n",r);
}
