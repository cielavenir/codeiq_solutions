#include <vector>
#include <unordered_map>
#include <cstdio>
using namespace std;
typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,1},
	{1,0},
	{0,-1},
	{-1,0},
};
#define W 6
#define H 5

vector<vector<int> >v;
bool check(int x,int y){
	unordered_map<int,int>m;
	for(auto &d:D){
		if(0<=x+d.x&&x+d.x<W && 0<=y+d.y&&y+d.y<H)m[ v[y+d.y][x+d.x] ]++;
	}
	if(m.size()>1)return true;
	for(auto &e:m){
		if(e.first!=v[y][x])return true;
	}
	return false;
}
int dfs(int x,int y,vector<int>&z){
	if(x==W)return dfs(0,y+1,z);
	if(y==H){
		for(int i=0;i<W;i++)if(!check(i,y-1))return false; //iはHまでではなくWまででした…あほな…。
		return z[0]==z[1];
	}
	int r=0;
	for(int i=0;i<2;i++){
		v[y][x]=i;
		if(y==0 || check(x,y-1)){
			z[i]++;
			r+=dfs(x+1,y,z);
			z[i]--;
		}
	}
	return r;
}

int main(){
	vector<int> z(2);
	v.resize(H);
	for(int i=0;i<H;i++)v[i].resize(W);
	printf("%d\n",dfs(0,0,z)); //13374192
}