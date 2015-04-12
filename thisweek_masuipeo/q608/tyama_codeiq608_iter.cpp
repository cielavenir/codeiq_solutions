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
	vector<int>e(N*2+1);
	vector<int>f(N*2+1);
	permute(e0,[&](auto _e){
		for(i=0;i<N*2;i++)e[i+1]=e[i]+_e[i];
		permute(f0,[&](auto _f){
			for(i=0;i<N*2;i++){
				f[i+1]=f[i]+_f[i];
				if(e[i]==f[i]&&e[i+1]==f[i+1])break;
			}
			if(i==N*2)r++;
		});
	});
	printf("%d\n",r);
}