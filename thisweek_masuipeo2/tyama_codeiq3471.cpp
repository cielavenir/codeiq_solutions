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

typedef vector<int> K;
unordered_map<K,int>memo;
int dfs(int h,int w,int n,int m){
	if(!n)return m==0;
	vector<int>key={h,w,n,m};
	auto it=memo.find(key);
	if(it!=memo.end())return it->second;

	int r=0;
	for(int h0=1;h0<h;h0++)for(int w0=1;w0<w;w0++){
		if(h0*w0>m)continue;
		r+=dfs(h0,w0,n-1,m-h0*w0);
	}
	memo.emplace(key,r);
	return r;
}
int main(){
	int n,m;
	scanf("%d%d",&n,&m);
	printf("%d\n",dfs(m,m,n,m));
}
