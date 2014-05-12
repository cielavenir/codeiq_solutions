#include <vector>
#include <set>
#include <algorithm>
#include <cstdio>
using namespace std;
struct sorter{
	bool operator()(const pair<pair<int,int>,int> &l, const pair<pair<int,int>,int> &r) const{
		return l.first.first*1.0/l.first.second > r.first.first*1.0/r.first.second;
	}
};
int N,B,M=0;
set<pair<int,int> >s;
void dfs(vector<int>&trace,vector<pair<pair<int,int>,int> >&item,int i,int v,int w){
	for(;i<N;i++){
		if(w+item[i].first.second<=B){
			trace.push_back(item[i].second);
			if(v+item[i].first.first>M){
				M=v+item[i].first.first;
				if(M>55981000){
					printf("%d\n",M);
					vector<int>result(N);
					for(int j=0;j<trace.size();j++)result[trace[j]]=1;
					for(int j=0;j<N;j++)printf("%d",result[j]);
					puts("");
				}
			}
			dfs(trace,item,i+1,v+item[i].first.first,w+item[i].first.second);
			trace.pop_back();
		}
	}
}
int main(){
	int i;
	scanf("%d%d",&N,&B);
	vector<pair<pair<int,int>,int> >item(N);//<value,weight>,i
	for(i=0;i<N;i++)scanf("%d%d",&item[i].first.first,&item[i].first.second),item[i].second=i;
	sort(item.begin(),item.end(),sorter());
	vector<int> trace;
	dfs(trace,item,0,0,0);
}