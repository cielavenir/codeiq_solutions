#include <string>
#include <vector>
#include <map>
#include <cstdio>
using namespace std;
typedef struct{
	int x;
	int y;
}dir;
vector<dir>D={
	{-1,-1},{0,-1},{1,-1},
	{-1,0},{1,0},
	{-1,1},{0,1},{1,1},
};

const int H=5,W=5;

int check2(int color,dir&d,int x,int y,const vector<string>&m,int nempty){
	if(x<0||W<=x||y<0||H<=y)return -1;
	if(m[y][x]=='.')return nempty;
	if(m[y][x]==color)return 0;
	int r=check2(color,d,x+d.x,y+d.y,m,nempty);
	if(r<0)return r;
	return r+1;
}
int check1(int color,int x,int y,const vector<string>&m,int nempty){
	int R=-1;
	if(m[y][x]=='.')for(auto &d:D){
		int r=check2(color,d,x+d.x,y+d.y,m,nempty);
		if(r>0){
			if(R<0)R=0;
			R+=r;
		}
	}
	return R;
}
int checkS(int color,int x,int y,const vector<string>&m){
	int R=0;
	if(m[y][x]=='.')for(auto &d:D){
		R += 0<=x+d.x&&x+d.x<W && 0<=y+d.y&&y+d.y<H && m[y+d.y][x+d.x]!='.';
	}
	return R;
}

int main(){
	string s="RBWG";
	map<char,vector<int>>m;
	int c,mode=0,n=0;
	do{
		c=getchar();
		if(c==','||c=='\n'||!~c){
			if(n)m[mode].push_back(n-1),n=0;
			if(c!=',')mode=0;
		}else if(!mode){
			mode=c,m.emplace(mode,vector<int>());
		}else{
			n=n*10+c-'0';
		}
	}while(~c);
	vector<string>v(H,string(W,'.'));
	for(auto &e:m)for(auto &f:e.second)v[f/W][f%W]=e.first;
	for(auto &e:s){
		printf("%c",e);
		vector<int>r;
		for(int i=0;i<H;i++)for(int j=0;j<W;j++){
			if(check1(e,j,i,v,-1)>0)r.push_back(i*W+j);
		}
		if(r.empty()){
			for(int i=0;i<H;i++)for(int j=0;j<W;j++){
				if(check1(e,j,i,v,0)>0)r.push_back(i*W+j);
			}
		}
		if(r.empty()){
			for(int i=0;i<H;i++)for(int j=0;j<W;j++){
				if(checkS(e,j,i,v)>0)r.push_back(i*W+j);
			}
		}
		if(r.empty())r.push_back(12);
		for(auto &f:r)printf(",%d",f+1);
		puts("");
	}
	return 0;
}