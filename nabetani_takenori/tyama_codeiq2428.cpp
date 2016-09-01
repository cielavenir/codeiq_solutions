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
const int N=6;
int main(){
	string s;
	cin>>s;
	pair<int,int>start,goal;
	for(int i=0;i<s.size();i++){
		if(s[i]=='s')start={i%-~N,i/-~N};
		if(s[i]=='g')goal={i%-~N,i/-~N};
	}
	map<tiii,int>depth;
	depth[make_tuple(start.first,start.second,-1)]=0;
	queue<tiii>q;
	q.push(make_tuple(start.first,start.second,-1));
	for(;!q.empty();){
		tiii cur=q.front();q.pop();
		for(int i=0;i<4;i++){
			if(i==get<2>(cur))continue;
			int x=get<0>(cur)+D[i].x,y=get<1>(cur)+D[i].y;
			if(goal==make_pair(x,y)){
				cout<<depth[cur]+1<<endl;
				return 0;
			}else if(0<=x&&x<N && 0<=y&&y<N && s[y*-~N+x]=='_'){
				tiii nxt=make_tuple(x,y,i);
				if(depth.find(nxt)==depth.end()){
					depth[nxt]=depth[cur]+1;
					q.push(nxt);
				}
			}
		}
	}
	cout<<'X'<<endl;
}