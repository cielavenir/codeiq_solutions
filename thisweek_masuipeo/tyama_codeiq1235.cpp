//提出時間的にどうしようもないので、C++で解答、コメントもそれなりに入れました。

//注：このアルゴリズムは、11以上が含まれる場合繰り上がりの扱いが特殊になるので適用することができない可能性があります。
#include <vector>
#include <algorithm>
#include <numeric>
#include <cstdio>
#include <cstdlib>
using namespace std;

//当該桁でそろばんの上側にある玉の数
pair<int,int> mkdigit(int n){return {n/5,n%5};}
//数xとyにおける、そろばんの上側にある玉の数の差
int diff(int x,int y){
	int r=0;
	for(;x||y;x/=10,y/=10){
		auto a=mkdigit(x%10),b=mkdigit(y%10);
		r+=abs(a.first-b.first)+abs(a.second-b.second);
	}
	return r;
}
//vの和を計算するときに移動させる必要がある玉の数
int seq(const vector<int> &v){
	int r=0,n=0;
	for(auto &e:v){
		int nxt=n+e;
		r+=diff(n,nxt);
		n=nxt;
	}
	return r;
}

int main(){
	int r=99999;
	vector<int>v(10);
	iota(v.begin(),v.end(),1);
	do{
		r=min(r,seq(v));
	}while(next_permutation(v.begin(),v.end()));
	printf("%d\n",r); // 26
}