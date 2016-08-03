#include <iostream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <cstdio>
using namespace std;
typedef pair<int,int> coor;
typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,-1},{0,1},{-1,0},{1,0}
};
unordered_map<char,int> T={
	{'U',0},{'D',1},{'L',2},{'R',3}
};

namespace std{
	template<typename T>
	inline void hash_combine(size_t& seed, T const& v){
		seed ^= hash<T>()(v) + 0x9e3779b9 + (seed<<6) + (seed>>2);
	}
	template<typename It>
	inline size_t hash_range(It first, It last){
		size_t seed=0;
		hash_range(seed,first,last);
		return seed;
	}
	template<typename It>
	inline void hash_range(size_t& seed, It first, It last){
		for(;first!=last;++first)hash_combine(seed, *first);
	}
	template<typename A,typename B>
	class hash<pair<A,B>>{
		public:
		size_t operator()(pair<A,B> const &p) const{
			size_t seed=0;
			hash_combine(seed,p.first);
			hash_combine(seed,p.second);
			return seed;
		}
	};
}

int dfs(const unordered_set<coor> &m,unordered_set<coor> &used,coor &st){
	if(m.size()==used.size())return 1;
	int r=0;
	for(auto d:D){
		coor nxt={st.first+d.x,st.second+d.y};
		if(m.find(nxt)!=m.end() && used.find(nxt)==used.end()){
			used.insert(nxt);
			r+=dfs(m,used,nxt);
			used.erase(nxt);
		}
	}
	return r;
}

int main(){
	string line;
	cin>>line;
	coor cur={0,0};
	unordered_set<coor> m={cur};
	for(auto &e:line){
		int k=T[e];
		cur.first+=D[k].x;
		cur.second+=D[k].y;
		m.insert(cur);
	}
	int r=0;
	for(auto st:m){
		unordered_set<coor> used={st};
		r+=dfs(m,used,st);
	}
	printf("%d\n",r);
}

// DDDLLLLUUURRRDDLLUR (19) 0.10s
// RRRRDDDDLLLLUUURRRDDLLUR (24) 1.26s