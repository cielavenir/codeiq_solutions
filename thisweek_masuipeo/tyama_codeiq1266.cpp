#include <map>
#include <unordered_map>
#include <queue>
#include <cstdio>
#include <cstdlib>
using namespace std;
#define X 6
#define Y 4

//dir
typedef struct{
	int x;
	int y;
}dir;
dir D[]={
	{1,0},
	{0,1},
};

//bitDP
typedef unsigned int val_t;
val_t setbit(val_t v,int x,int y,int val){
	int coor=y*X+x;
	val_t z=(val_t)1<<coor;
	if(val==0)return v&~z;
	if(val==1)return v|z;
	abort();
}
int getbit(val_t v,int x,int y){
	int coor=y*X+x;
	return (v>>coor)&1;
}
val_t swapbit(val_t v,int x1,int y1,int x2,int y2){
	int b1=getbit(v,x1,y1);
	int b2=getbit(v,x2,y2);
	v=setbit(v,x1,y1,b2);
	v=setbit(v,x2,y2,b1);
	return v;
}

int main(){
	map<int,int>counter;
	unordered_map<val_t,int>depth;
	queue<val_t>q;
	//initialize
	val_t v=0;
	for(int x=0;x<X/2;x++)for(int y=0;y<Y;y++)v=setbit(v,x,y,1);
	depth[v]=0,q.push(v),counter[0]++;
	v=0;
	for(int x=X/2;x<X;x++)for(int y=0;y<Y;y++)v=setbit(v,x,y,1);
	depth[v]=0,q.push(v),counter[0]++;
	v=0;
	for(int x=0;x<X;x++)for(int y=0;y<Y/2;y++)v=setbit(v,x,y,1);
	depth[v]=0,q.push(v),counter[0]++;
	v=0;
	for(int x=0;x<X;x++)for(int y=Y/2;y<Y;y++)v=setbit(v,x,y,1);
	depth[v]=0,q.push(v),counter[0]++;
	for(;!q.empty();){
		val_t cur=q.front();q.pop();
		for(int x=0;x<X;x++)for(int y=0;y<Y;y++)for(auto &d:D){
			if(x+d.x<X&&y+d.y<Y){
				val_t nxt=swapbit(cur,x,y,x+d.x,y+d.y);
				if(cur!=nxt&&depth.find(nxt)==depth.end()){
					depth[nxt]=depth[cur]+1;
					q.push(nxt);
					counter[depth[nxt]]++;
				}
			}
		}
	}
	auto it=counter.rbegin();
	printf("%d回 %d個\n",it->first,it->second);
	return 0;
}