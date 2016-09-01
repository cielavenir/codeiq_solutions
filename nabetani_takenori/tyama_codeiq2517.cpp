#include <vector>
#include <cstdio>
using namespace std;
#define M 1500000
typedef pair<int,int> pii;
int T[M+1];
pii convert(int n){
	int i=0,k=1,c;
	for(;n>k;i++,k=2*i+1)n-=k;
	c=(k+1)/2;
	if(n<c)return {c,n};
	else return {k-n+1,c};
}
long long dist(int x,int y){
	return (long long)x*x+(long long)y*y;
}
int main(){
	int i=2,j;
	for(T[0]=T[1]=1;i*i<=M;i++)if(!T[i])for(j=i*2;j<=M;j+=i)T[j]=1;
	vector<pair<int,pii> >v;
	for(i=2;i<=M;i++)if(!T[i])v.emplace_back(i,convert(i));
	scanf("%d",&j);
	pii x=convert(j);
	long long D=1LL<<60;
	vector<int>r;
	for(auto &e:v){
		long long d=dist(x.first-e.second.first,x.second-e.second.second);
		if(D>d)D=d,r.clear();
		if(D==d)r.push_back(e.first);
	}
	for(i=0;i<r.size();i++)printf(i<r.size()-1 ? "%d," : "%d\n",r[i]);
}