#include <vector>
#include <set>
#include <cstdio>
using namespace std;

template<typename T,typename F>
T binarysearch(T lo,T hi,const T eps,const F &predicate){
	T r=hi+eps;
	for(;lo<hi+eps;){
		T mi=eps!=1||(lo<0)==(hi<0) ? lo+(hi-lo)/2 : (lo<-hi) ? -((-lo-hi-1)/2+1) : (lo+hi)/2;
		if(predicate(mi)){
			r=mi;
			hi=mi-eps;
		}else{
			lo=mi+eps;
		}
	}
	return r;
}
template<typename T,typename F>
T binarysearch(T lo,T hi,const F &predicate){return binarysearch(lo,hi,(T)1,predicate);}

set<int>prime={2};
bool chk(int m,int n,int r){
	int s=2+r;
	for(int _=0;_++<n-1;){
		int i=s;
		for(;prime.find(i)==prime.end();i++);
		if(i>m)return false;
		s=i+r;
	}
	return true;
}
int main(){
	int m,n;
	{
		const int M=2000000;
		vector<int>v(M);
		for(m=3;m<M;m+=2)if(!v[m]){
			prime.insert(m);
			for(n=m;n<M;n+=m)v[n]=1;
		}
	}
	scanf("%d%d",&m,&n);
	printf("%d\n",binarysearch(1,2*m/n,[&](int i)->bool{
		return !chk(m,n,i);
	})-1);
}
