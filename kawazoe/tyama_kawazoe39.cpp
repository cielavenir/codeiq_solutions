#include <vector>
#include <algorithm>
#include <cstdio>
#include <cmath>
using namespace std;

const int INF=1<<29;
int main(){
	vector<int>T(1000000,INF);
    vector<long double>t(1000000);
    for(int i=100000;i<1000001;i++)t[i]=log10l(i);
	double result=0;
	for(int i=2;i<=8;i++)result+=log10l(i);
	for(int i=9;i<=1000000;i++){
		result+=log10l(i);
		long long Z=result;
		result-=Z-5;
		auto it=upper_bound(t.begin(),t.end(),result);--it;
		int X=distance(t.begin(),it);
		T[X]=min(T[X],i);
	}
	int r=INF,x=-1;
	for(int i=111111;i<=999999;i+=111111)if(r>T[i])r=T[i];
	printf("%d\n",r);
}

//22,132,1128,1128,114993,1778531

/*
【コードの説明】
100000〜1000000に対する対数を計算しておく。
階乗の対数を求めて、そこから「対数の整数部分-5」を引くことで、上位6桁の数を十万〜一の位とみなした時の対数を求めることができる。
この対数を先ほどの対数表から二分探索することで、階乗の上位6桁を求めることができる。
あとは、この対応表から、ぞろ目のものを探せば良い。

なお、log(NM)=log(N)+log(M)の公式を使うことで、階乗の計算を回避することができる。
精度を最大限取るため、long doubleを使用した。
【言語】
C++
*/