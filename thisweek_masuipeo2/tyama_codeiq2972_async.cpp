// async
// 5 5: 0.08s
// 3 9: 1.47s
// 5 6: 15.53s
// 4 8: 83.18s
// 6 6: 772.15s

#include <vector>
#include <algorithm>
#include <future>
#include <cstdio>
using namespace std;

typedef long long val_t;
#define popcnt __builtin_popcountll
//typedef int val_t;
//#define popcnt __builtin_popcount
//typedef mpz_class val_t;
//int popcnt(const val_t &x){int r=0;val_t z=x;for(;z;z/=2)r+=z%2;return r;}

int lightsout(int x,int y){
	vector<vector<val_t>>a(x*y);
	for(int i=0;i<x*y;i++)a[i].resize(2);

	//create problem
	for(int i=0;i<x;i++){
		for(int j=0;j<y;j++){
			a[i+j*x][0]=(val_t)1<<(i+j*x);
			a[i+j*x][1]= 0 +
				((val_t)1<<(i+j*x)) +
				(i>0   ? (val_t)1<<(i-1+j*x) : 0) +
				(i<x-1 ? (val_t)1<<(i+1+j*x) : 0) +
				(j>0   ? (val_t)1<<(i+(j-1)*x) : 0) +
				(j<y-1 ? (val_t)1<<(i+(j+1)*x) : 0) +
				0;
		}
	}

	//solve
	int i=0;
	for(;i<x*y;i++){
		if((a[i][1]&((val_t)1<<i))==0){
			int j=i+1;
			for(;j<x*y;j++){
				if((a[j][1]&((val_t)1<<i))!=0){
					swap(a[i],a[j]);
					break;
				}
			}
			if(j==x*y)break;
		}

		for(int j=0;j<x*y;j++){
			if(i==j)continue;
			if((a[j][1]&((val_t)1<<i))!=0){
				a[j][0]^=a[i][0];
				a[j][1]^=a[i][1];
			}
		}
	}
	int k=i;
	fprintf(stderr,"quiet pattern=%d\n",x*y-k);

	//0解(quiet pattern)の集合tを用意する
	for(int i=k;i<x*y;i++)a[i][1]=(val_t)1<<i;
	val_t tmsk=((val_t)1<<k)-1;
	vector<val_t>t(x*y-k);
	for(int i=0;i<x*y;i++){
		for(int j=k;j<x*y;j++)t[j-k]|=((a[i][1]>>j)&1)<<i;
		a[i][0]&=tmsk;
	}

	vector<val_t>tlst(1<<(x*y-k)); // このメモリはあまり大きくならないはず
	for(val_t l=0;l<1<<(x*y-k);l++){
		val_t r=0;
		for(int j=0;j<x*y-k;j++)if(l&((val_t)1<<j))r^=t[j];
		tlst[l]=r;
	}

	//全盤面に対し最短手数を計算する
	int num_threads=thread::hardware_concurrency();
	auto f=[&](val_t start)->int{
		int r=0;
		for(val_t i_=start;i_<(val_t)1<<k;i_+=num_threads){
			if(popcnt(i_)*2>k)continue;
			//完全反転についても求め、最小値を取る
			int c=1<<29;
			for(val_t i:{i_,i_^tmsk}){
				val_t r0=0;
				for(int j=0;j<k;j++)if(i&((val_t)1<<j))r0^=a[j][0];
				//0解の重ね合わせをすべて試す
				int c0=1<<29;
				for(val_t l=0;l<(val_t)1<<(x*y-k);l++){
					val_t r1=r0;
					//for(int j=0;j<x*y-k;j++)if(l&((val_t)1<<j))r1^=t[j];
					r1^=tlst[l];
					c0=min(c0,popcnt(r1));
				}
				c=min(c,c0);
			}
			r=max(r,c);
		}
		return r;
	};
	vector<future<int>>task;
	for(int i=1;i<num_threads;i++)task.push_back(async(launch::async,f,i));
	int r=f(0);
	for(auto &t:task)r=max(r,t.get());
	return r;
}

int main(){
	int m,n;
	scanf("%d%d",&m,&n);
	printf("%d\n",lightsout(m,n));
}
