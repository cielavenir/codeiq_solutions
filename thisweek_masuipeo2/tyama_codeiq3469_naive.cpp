#pragma GCC optimize("O3")
#include <vector>
#include <cstdio>
#include <future>
using namespace std;

int calc(vector<vector<int>> &a,const int X,const int Y){
	int ret=-1;
	a[0][0]=1;
	int y=0,x;
	for(;y<Y;y++)for(x=0;x<X;x++){
		if(a[y][x]==-2)goto cleanup;
		if(a[y][x]<1)continue;
		if(y<Y-1){
			if(a[y+1][x]<0)a[y+1][x]=-1;
			else a[y+1][x]+=a[y][x];
		}
		if(x<X-1){
			if(a[y][x+1]<0)a[y][x+1]=-1;
			else a[y][x+1]+=a[y][x];
		}
	}
	ret=a[Y-1][X-1];
cleanup:
	if(x)y+=1;if(y>=Y)y=Y-1;
	for(;y>=0;y--)for(x=0;x<X;x++){
		a[y][x]=a[y][x]>=0 ? 0 : -2;
	}
	return ret;
}

int main(){
	int x,y,n;
	scanf("%d%d%d",&x,&y,&n);
	const int num_threads=thread::hardware_concurrency();
	const auto f=[&](int start)->int{
		int r=0;
		vector<vector<int>>a(y);
		for(int i=0;i<y;i++)a[i].resize(x);
		const int J=(x-1)*(y-1)-1;
		for(int i=start;i<1<<J;i+=num_threads){
			for(int j=0;j<J;j++){
				//if(j%(x-1)==0)a[j/(x-1)+1].resize(x);
				a[j/(x-1)+1][j%(x-1)+1]=((i>>j)&1)?-2:0;
			}
			//左一列と上一行に存在する工事現場はそれぞれたかだか１個
			for(int k=0;k<y;k++){
				if(k>0)a[k][0]=-2;
				int z=calc(a,x,y);
				if(z==n)r++;
				if(z>=n){
					//j>=1のとき、calc()<=zなので、z<nなら無効
					for(int j=1;j<x;j++){
						a[0][j]=-2;
						if(calc(a,x,y)==n)r++;
						a[0][j]=0;
					}
				}
				a[k][0]=0;
			}
		}
		return r;
	};
	vector<future<int>>task;
	for(int i=1;i<num_threads;i++)task.push_back(async(launch::async,f,i));
	int r=f(0);
	for(auto &t:task)r+=t.get();
	printf("%d\n",r);
}
