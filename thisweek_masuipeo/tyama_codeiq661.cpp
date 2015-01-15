#include <unordered_map>
#include <cstdio>
#include <cstdlib>
using namespace std;

const int H=5,W=6;
typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{-1,0},
	{1,0},
	{0,-1},
	{0,1},
};

//ret==-1 -> 途中経過は無効
//ret==0  -> その移動で(最後に)ゴールに到着した
//ret>=0  -> 最長経路の長さ
//5x6であれば、メモ化するよりも、unordered_mapを使ったほうが速いようである
int dfs(unordered_map<int,int>&m,int x,int y){
	int ret=-1,cur;
	if(x==W&&y==H)ret=0;
	for(auto &d:D){
		if(0<=x+d.x&&x+d.x<=W && 0<=y+d.y&&y+d.y<=H){
			if(d.y){
				m[x]+=1;
				if(m[x]<3&&(cur=dfs(m,x,y+d.y))>=0&&ret<cur)ret=cur+1;
				m[x]-=1;
			}else{
				m[y+W+1]+=1;
				if(m[y+W+1]<3&&(cur=dfs(m,x+d.x,y))>=0&&ret<cur)ret=cur+1;
				m[y+W+1]-=1;
			}
		}
	}
	return ret;
}

int main(){
	unordered_map<int,int>m;
	printf("%d\n",dfs(m,0,0));
}