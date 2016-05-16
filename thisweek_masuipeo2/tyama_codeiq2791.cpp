#include <iostream>
#include <string>
#include <queue>
#include <map>
#include <tuple>
using namespace std;
typedef tuple<int,int,int> tiii;

typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,-1},{-1,0},{0,1},{1,0}
};
int main(){
	int N,r=0;
	cin>>N;
	vector<string>s(N);
	for(int i=0;i<N;i++)cin>>s[i];

for(int X=0;X<N;X++)for(int Y=0;Y<N;Y++)if(s[Y][X]=='O'){
	map<pair<int,int>,map<int,int>>depth;
	depth[{X,Y}][-1]=0;
	queue<tiii>q;
	q.push(make_tuple(X,Y,-1));

	auto isok=[&](int x,int y){
		return 0<=x&&x<N && 0<=y&&y<N && s[y][x]=='O';
	};
	auto push=[&](const tiii &cur,int x,int y,int d,int diff){
		tiii nxt=make_tuple(x,y,d);
		if(depth.find({x,y})==depth.end()||depth[{x,y}].find(d)==depth[{x,y}].end()){
			depth[{x,y}][d]=depth[{get<0>(cur),get<1>(cur)}][get<2>(cur)]+diff;
			q.push(nxt);
		}
	};

	for(;!q.empty();){
		tiii cur=q.front();q.pop();
		if(get<2>(cur)==-1){
			for(int i=0;i<4;i++){
				int x=get<0>(cur)+D[i].x,y=get<1>(cur)+D[i].y;
				if(isok(x,y))push(cur,x,y,i,0);
			}
		}else{
			int d=get<2>(cur);
			int x=get<0>(cur)+D[d].x,y=get<1>(cur)+D[d].y;
			if(isok(x,y)){
				push(cur,x,y,d,0);
			}else{
				for(int i=0;i<2;i++){
					int d=(get<2>(cur)+2*i+1)%4;
					int x=get<0>(cur)+D[d].x,y=get<1>(cur)+D[d].y;
					if(isok(x,y))push(cur,x,y,d,1);
				}
			}
		}
	}
	for(auto &e:depth){
		int r0=1<<30;
		for(auto &f:e.second)r0=min(r0,f.second);
		r=max(r0,r);
	}
}
	cout<<r<<endl;
}