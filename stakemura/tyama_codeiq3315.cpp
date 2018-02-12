//cf:
//http://cielavenir.github.io/blog/2016/10/13/grid-and-integers/
//http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=2207

#include <cstdio>
#include <unordered_map>
#include <deque>
#include <algorithm>
using namespace std;
typedef int key;

char F[9];
int main(){
	int s,t;
	unordered_map<key,deque<pair<key,long long>>>m;
	for(;~scanf("%d is %s (%d)",&s,F,&t);){
		m[s].emplace_back(t,*F=='t' ? 1 : -1);
		m[t].emplace_back(s,*F=='t' ? 1 : -1);
	}
	for(;!m.empty();){
		auto s=m.begin()->first;
		deque<pair<key,long long>>st={{s,1}};
		unordered_map<key,long long>memo={{s,1}};
		for(;!st.empty();){
			auto p=*st.rbegin();st.pop_back();
			auto cur=p.first;long long d=p.second;
			for(auto &e:m[cur]){
				if(memo.find(e.first)==memo.end()){
					st.emplace_back(e.first,d*e.second);
					memo[e.first]=d*e.second;
				}else if(memo[e.first]!=d*e.second){
					puts("-1");
					return 0;
				}
			}
		}
		for(auto &e:memo)m.erase(m.find(e.first));
	}
	puts("0");
}
