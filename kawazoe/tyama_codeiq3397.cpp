#include <stdio.h>
#include <stdlib.h>

//1〜nに含まれるcountの個数を求める
unsigned long long solve(unsigned long long n,int count,int base){
	unsigned long long r=0; //結果
	unsigned long long lower=0; //処理している桁より下の桁の合計
	unsigned long long digits=0,expbase=1;
	for(;n;digits++,expbase*=base,n/=base){
		unsigned long long d=digits*expbase/base; //0,1,20,300,4000,...
		unsigned long long current_digit=n%base;
		r+=current_digit*d;
		if(current_digit==count)r+=lower+1;
		if(current_digit>=count+1)r+=expbase;
		lower+=current_digit*expbase;
		if(count==0)r-=expbase;
	}
	return r;
}

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

int main(int argc,char **argv){
	int count=3;
	int base=10;
	long long x;
	scanf("%lld",&x);

	printf("%lld\n",binarysearch(0LL,1LL<<44,[&](long long n){
		return x<=solve(n,3,10);
	}));
}
