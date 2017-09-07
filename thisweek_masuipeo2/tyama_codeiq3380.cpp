#include <vector>
#include <queue>
#include <map>
#include <algorithm>
using namespace std;

typedef struct{
	int from;
	int to;
}MOVE;
MOVE M[]={{0,1},{0,2},{1,0},{1,2},{2,0},{2,1}};

typedef vector<int> state;
int solve(int m,int x){
	state a={0,0,(1<<m)-1};
	queue<state>q;
	q.push(a);
	map<state,int>depth={{a,0}};
	for(;!q.empty();){
		state c=q.front();q.pop();
		int n=depth[c];
		for(auto &m:M){
			int from_least=c[m.from]&-c[m.from];
			int to_least=c[m.to]&-c[m.to];
			if(from_least && (!to_least||from_least<to_least)){
				c[m.to]|=from_least;
				c[m.from]&=~from_least;
				auto nxt=c; //copy
				sort(nxt.begin(),nxt.end());
				if(depth.find(nxt)==depth.end()){
					if(n+1>x)break;
					q.push(nxt);
					depth[nxt]=n+1;
				}
				c[m.from]|=from_least;
				c[m.to]&=~from_least;
			}
		}
	}
	return count_if(depth.begin(),depth.end(),[&](const pair<state,int>&e){return e.second==x;});
}
int main(){
	int m,n;
	scanf("%d%d",&m,&n);
	printf("%d\n",solve(m,n));
}
