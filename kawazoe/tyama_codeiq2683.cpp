#include <vector>
#include <algorithm>
#include <cstdio>
#include <cmath>
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

int main(){
	long long N;
	scanf("%lld\n",&N);
	long long n=binarysearch(1LL,N,[&](long long n){
		double d=n*log10(n);
		return (long long)(d+1+1e-9)>=N;
	});
	double d=n*log10(n);
	printf("%lld\n",(long long)(d+1+1e-9)==N ? n : -1);
}

/*
【コードの説明】
F(n)==1+floor(nlogn)である。
G(n)はF(n)を2分探索することにより決定できる。
なお、言語がC++なのは、2分探索ライブラリを作っていたことと、CodeIQのRubyはRange#bsearchが使えないことによる。
【言語】
C++
*/