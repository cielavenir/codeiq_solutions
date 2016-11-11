#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;
const int INF=1<<29;

typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,-1},{0,1},{-1,0},{1,0}
};

const int H=5,W=6;
vector<pair<int,int>>points;
string line;

int dfs(int x,int y,int depth,int cur){
	if(cur==points.size())return depth;
	int r=INF;
	for(auto d:D){
		if(0<=x+d.x&&x+d.x<W && 0<=y+d.y&&y+d.y<H && line[(y+d.y)*(W+1)+(x+d.x)]!='X'){
			int idx=distance(points.begin(),find(points.begin(),points.end(),make_pair(x+d.x,y+d.y)));
			if(idx==points.size()||idx==cur){
				line[(y+d.y)*(W+1)+(x+d.x)]='X';
				r=min(r,dfs(x+d.x,y+d.y,depth+1,cur+(idx==cur)));
				line[(y+d.y)*(W+1)+(x+d.x)]='.';
			}
		}
	}
	return r;
}
int main(){
	getline(cin,line);
	int ma=0;
	for(auto &e:line){
		if('1'<=e&&e<='9')ma=max(ma,e-'0');
	}
	points.resize(ma+2);
	for(int i=0;i<line.size();i++){
		if('1'<=line[i]&&line[i]<='9')points[line[i]-'0']={i%(W+1),i/(W+1)};
		if(line[i]=='s')points[0]={i%(W+1),i/(W+1)};
		if(line[i]=='g')points[ma+1]={i%(W+1),i/(W+1)};
	}
	line[points[0].second*(W+1)+points[0].first]='X';
	int r=dfs(points[0].first,points[0].second,0,1);
	if(r==INF)cout<<'-'<<endl;
	else cout<<r<<endl;
}