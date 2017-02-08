#include <iostream>
#include <string>
#include <queue>
#include <cstdio>
#define INF 999999999
using namespace std;

typedef int Weight;
struct Edge {
  int src, dst;
  Weight weight;
  Edge(int src, int dst, Weight weight) :
    src(src), dst(dst), weight(weight) { }
};
bool operator < (const Edge &e, const Edge &f) {
  return e.weight != f.weight ? e.weight > f.weight : // !!INVERSE!!
    e.src != f.src ? e.src < f.src : e.dst < f.dst;
}

typedef vector<Edge> Edges;
typedef vector<Edges> Graph;

void shortestPath(const Graph &g, int s,
    vector<Weight> &dist, vector<int> &prev) {
  int n = g.size();
  dist.assign(n, INF); dist[s] = 0;
  prev.assign(n, -1);
  priority_queue<Edge> Q; // "e < f" <=> "e.weight > f.weight"
  for (Q.push(Edge(-2, s, 0)); !Q.empty(); ) {
    Edge e = Q.top(); Q.pop();
    if (prev[e.dst] != -1) continue;
    prev[e.dst] = e.src;
    for(auto &f:g[e.dst]) {
      if (dist[f.dst] > e.weight+f.weight) {
        dist[f.dst] = e.weight+f.weight;
        Q.push(Edge(f.src, f.dst, e.weight+f.weight));
      }
    }
  }
}

#define MA 20
int M[MA][MA];
int best[1<<MA][MA];
int shortestHamiltonCycle(int n) {
	int N = 1 << n;
	int S,i,j;
	for(S=0;S<N;S++)for(i=0;i<n;i++)best[S][i]=INF;
	best[0][0]=0;
	for(S=0;S<N;S++)for(j=0;j<n;j++)if(!(S&(1<<j))){
		for(i=0;i<n;i++)if(best[S|(1<<j)][j] > best[S][i] + M[i][j]){
			best[S|(1<<j)][j] = best[S][i] + M[i][j];
		}
	}
	return best[N-1][0]==INF ? -1 : best[N-1][0];
}

int main(){
	int H,W,maxc=0;
	cin>>H>>W;
	vector<string>v(H);
	for(int i=0;i<H;i++){
		cin>>v[i];
		for(auto &c:v[i])maxc=max(maxc,(int)c);
	}
	vector<int>max_area={0};
	Graph g(H*W);
	for(int i=0;i<H;i++)for(int j=0;j<W;j++){
		int x=i*W+j,y,f;
		if(v[i][j]==maxc)max_area.push_back(x);
		if(i<H-1){
			y=(i+1)*W+j;
			f=v[i][j]-v[i+1][j];
			if(f==-1)g[x].push_back(Edge(x,y,11)),g[y].push_back(Edge(y,x,2));
			if(f==1)g[x].push_back(Edge(x,y,2)),g[y].push_back(Edge(y,x,11));
			if(f==0)g[x].push_back(Edge(x,y,3)),g[y].push_back(Edge(y,x,3));
		}
		if(j<W-1){
			y=i*W+j+1;
			f=v[i][j]-v[i][j+1];
			if(f==-1)g[x].push_back(Edge(x,y,11)),g[y].push_back(Edge(y,x,2));
			if(f==1)g[x].push_back(Edge(x,y,2)),g[y].push_back(Edge(y,x,11));
			if(f==0)g[x].push_back(Edge(x,y,3)),g[y].push_back(Edge(y,x,3));
		}
	}
	int N=max_area.size();
	//printf("%d\n",N);
	for(int i=0;i<N;i++){
		vector<Weight> dist;
		vector<int> prev;
		shortestPath(g,max_area[i],dist,prev);
		for(int j=0;j<N;j++)M[i][j]=dist[max_area[j]];
	}
	printf("%d\n",shortestHamiltonCycle(N));
}
