//右下が黒マスになることにより盤面が分断される可能性を考慮していませんでした。。

#include <queue>
#include <map>
#include <cstdio>
#include <cassert>
using namespace std;
typedef pair<int,int> pii;

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

#define W 6
#define H 5
#define WHITE 0
#define BLACK 1
int M[H][W];
int check(int x,int y){
	map<pii,int>depth;
	queue<pii>q;
	depth[make_pair(x,y)]=0;
	q.push(make_pair(x,y));
	for(;!q.empty();){
		pii cur=q.front();q.pop();
		for(auto d:D){
			int x=cur.first+d.x;
			int y=cur.second+d.y;
			if(0<=x&&x<W && 0<=y&&y<H && M[y][x]==WHITE){
				pii nxt=make_pair(x,y);
				if(depth.find(nxt)==depth.end()){
					depth[nxt]=depth[cur]+1;
					q.push(nxt);
				}
			}
		}
	}
	return depth.size();
}

int dfs(int x,int y,int BLACKS){
	if(x==W)return dfs(0,y+1,BLACKS);
	if(y==H){
		for(y=0;y<H;y++){
			for(x=0;x<W;x++){
				if(M[y][x]==WHITE){
					return check(x,y)==W*H-BLACKS;
				}
			}
		}
		assert(false);
	}
	int r=0;
	for(int i=0;i<2;i++){
		if(i==BLACK){
			if((0<y&&M[y-1][x]==BLACK) || (0<x&&M[y][x-1]==BLACK))continue;
		}
		if(i==WHITE){
			if(check(x,y)<W*H-BLACKS)continue;
		}
		M[y][x]=i;
		r+=dfs(x+1,y,BLACKS+i);
		M[y][x]=WHITE;
	}
	return r;
}

int main(){
	printf("%d\n",dfs(0,0,0)); //149283
}