#include <queue>
#include <map>
#include <cstdio>
using namespace std;

int main(){
	const int N=8;
	vector<int>v,goal1,goal2;
	int i,j;
	for(i=0;i<N;i++)v.push_back(0);
	for(i=0;i<N;i++)v.push_back(1);
	for(i=0;i<N;i++)goal1.push_back(0),goal1.push_back(1);
	for(i=0;i<N;i++)goal2.push_back(1),goal2.push_back(0);

	queue<vector<int> >q;
	map<vector<int>,int>depth;
	q.push(v);
	depth[v]=0;
	for(;!q.empty();){
		vector<int> cur=q.front();q.pop();
		vector<int> nxt=cur;
		for(i=0;i<2*N;i++){
			for(j=0;j<3;j++)nxt[(i+2)%(2*N)]^=1;
			if(nxt==goal1||nxt==goal2){
				printf("%d\n",depth[cur]+1); //8
				return 0;
			}
			if(depth.find(nxt)==depth.end()){
				q.push(nxt);
				depth[nxt]=depth[cur]+1;
			}
			for(j=0;j<3;j++)nxt[(i+2)%(2*N)]^=1;
		}
	}
}