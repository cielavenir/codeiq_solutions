#include <vector>
#include <functional>
#include <algorithm>
#include <cstdio>
using namespace std;
#define N 6
#define T int
//template<typename T>
void permute(const vector<T> &x,int n,const function<void(vector<T>&)> &fun){
	if(n<0||x.size()<n)return;
	vector<T> a=x;
	sort(a.begin(),a.end());
	for(;;){
		fun(a);
		int i;
		reverse(a.begin()+n,a.begin()+a.size());
		for(i=a.size()-2;i>=0;i--)if(a[i]<a[i+1])break;
		if(i<0){
			reverse(a.begin(),a.begin()+a.size());
			return;
		}
		int k=i;
		for(i=a.size()-1;i>=k+1;i--)if(a[k]<a[i])break;
		int l=i;
		T z=a[k];a[k]=a[l];a[l]=z;
		reverse(a.begin()+k+1,a.begin()+a.size());
	}
}
//template<typename T>
void permute(const vector<T> &x,const function<void(vector<T>&)> &fun){return permute(x,x.size(),fun);}
int main(){
	int r=0,i;
	vector<int>e0(N*2),f0(N*2);
	for(i=0;i<N;i++)e0[N+i]=f0[N+i]=1;
	permute(e0,[&](auto _e){
		permute(f0,[&](auto _f){
			int flg=0;
			int zero1=0;
			int zero2=N;
			int one1=0;
			int one2=N;
			for(i=0;i<N*2;i++){
				if(_e[i]==0)zero1++;
				if(_e[i]==1)one1++;
				if(_f[N*2-1-i]==0)zero2--;
				if(_f[N*2-1-i]==1)one2--;
				if(zero1==zero2)flg++;
				if(one1==one2)flg++;
			}
			if(flg>=2)r++;
		});
	});
	printf("%d\n",r);
}