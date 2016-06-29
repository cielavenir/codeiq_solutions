#include <set>
#include <cstdio>
using namespace std;

typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,-1},{-1,0},{0,1},{1,0}
};

const int X=4;
const int Y=3;
int C;
set<set<pair<int,int>>>memo;
int dfs(int c,int d,int x,int y){
	if(x==X&&y==Y)return c==C;
	if(c>C)return 0;
	int r=0;
	for(auto &e:{0,1,3}){
		int d0=(d+e)%4,x0=x+D[d0].x,y0=y+D[d0].y;
		if(0<=x0&&x0<=X && 0<=y0&&y0<=Y){
			set<pair<int,int>> key={{x,y},{x0,y0}};
			if(memo.find(key)==memo.end()){
				memo.insert(key);
				r+=dfs(c+(e==1||e==3),d0,x0,y0);
				memo.erase(key);
			}
		}
	}
	return r;
}
int main(){
	scanf("%d",&C);
	int r=0;
	memo={{{0,0},{0,1}}};
	r+=dfs(0,2,0,1);
	memo={{{0,0},{1,0}}};
	r+=dfs(0,3,1,0);
	printf("%d\n",r);
}