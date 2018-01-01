#include <vector>
#include <unordered_map>
#include <cstdio>
using namespace std;

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
	template<typename T,typename A>
	class hash<vector<T,A>>{
		public:
		size_t operator()(vector<T,A> const &container) const{
			return hash_range(container.begin(),container.end());
		}
	};
}

typedef pair<pair<int,int>,vector<int>> K;
const vector<int>H={0,4,16,48,128,320};
unordered_map<K,int>memo;
int dfs(int n,int d,const vector<int>&q,vector<int>&a){
	if(d==16)return n==0;
	K key={{n,d},q};
	if(a.empty()){
		auto it=memo.find(key);
		if(it!=memo.end())return it->second;
	}
	int r=0,w=a.size();
	for(auto &e:H){
		if(n<e)continue;
		if(w&&a[a.size()-1]==e)continue;
		if(!q.empty()&&q[w]==e)continue;
		a.push_back(e);
		if(a.size()==4){
			vector<int>b;
			r+=dfs(n-e,d+1,a,b);
		}else{
			r+=dfs(n-e,d+1,q,a);
		}
		a.pop_back();
	}
	if(a.empty())memo.emplace(key,r);
	return r;
}
int main(){
	int n;
	scanf("%d",&n);
	vector<int>a,b;
	printf("%d\n",dfs(n,0,a,b));
}
