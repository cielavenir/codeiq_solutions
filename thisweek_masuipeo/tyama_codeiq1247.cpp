#include <vector>
#include <cstdio>
#include <tuple>
#include <map>
using namespace std;
typedef pair<int,int> pii;
#define MX 16
#define MY 12

map<tuple<int,int,int,int,int>,int>memo;
int dfs(int X,int Y,vector<int>&s,int turn){
	if(X==1&&Y==1){
		int retval=-1;
		s[turn]+=1;
		if(s[0]==s[1])retval=0;
		s[turn]-=1;
		return retval;
	}
	if(s[0]>MX*MY/2||s[1]>MX*MY/2)return -1;
	tuple<int,int,int,int,int> t=make_tuple(X,Y,s[0],s[1],turn);
	if(memo.find(t)!=memo.end())return memo[t];
	int r=-1;
	if(X>1){
		for(int x=1;x<=X/2;x++){
			s[turn]+=x*Y;
			int n=dfs(X-x,Y,s,turn^1);
			if(n>=0 && (r<0||n+Y<r))r=n+Y;
			s[turn]-=x*Y;
		}
	}
	if(Y>1){
		for(int y=1;y<=Y/2;y++){
			s[turn]+=X*y;
			int n=dfs(X,Y-y,s,turn^1);
			if(n>=0 && (r<0||n+X<r))r=n+X;
			s[turn]-=X*y;
		}
	}
	return memo[t]=r;
}
int main(){
	vector<int>s(2);
	printf("%d\n",dfs(MX,MY,s,0));
}

/*
//メモ化前のバージョン(5分かかる)
int R=9999999;
int dfs(int X,int Y,int l,vector<int>&s,int turn){
	if(X==1&&Y==1){
		int retval=-1;
		s[turn]+=1;
		if(s[0]==s[1]){
			if(R>l){
				printf("found %d\n",l);
				R=l;
			}
			retval=l;
		}
		s[turn]-=1;
		return retval;
	}
	if(s[0]>MX*MY/2||s[1]>MX*MY/2)return -1;
	if(X>1){
		for(int x=1;x<=X/2;x++){
			s[turn]+=x*Y;
			dfs(X-x,Y,l+Y,s,turn^1);
			s[turn]-=x*Y;
		}
	}
	if(Y>1){
		for(int y=1;y<=Y/2;y++){
			s[turn]+=X*y;
			dfs(X,Y-y,l+X,s,turn^1);
			s[turn]-=X*y;
		}
	}
	return -1;
}
int main(){
	vector<int>s(2);
	dfs(MX,MY,0,s,0);
}
*/