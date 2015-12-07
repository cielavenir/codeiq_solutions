#include <queue>
#include <unordered_map>
#include <algorithm>
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

typedef pair<
	vector<int>,
	pair<int,int>
> pvipii;
//first==circle
//second.first==tagger
//second.second==position
#define N 8
pvipii switchstate(pvipii &_state,int n){
	pvipii state=_state;
	int position=state.second.second;
	position=(position+n)%N;
	swap(state.second.first,state.first[position]);
	state.second.second=position;
	return state;
}

int main(){
	int i,j;
	unordered_map<pvipii,int>depth;
	priority_queue<pair<int,pvipii> >q;
	pvipii init;
	for(i=1;i<=N;i++)init.first.push_back(i);
	q.push(make_pair(0,init));

	int R;
	for(;!q.empty();){
		pair<int,pvipii> _state=q.top();
		q.pop();
		pvipii &state=_state.second;
		if(depth.find(state)!=depth.end())continue;
		depth[state]=_state.first;

		for(j=i=0;i<N;i++)if(state.first[i]==N)break;
		if(i<N)for(;j<N;j++)if(state.first[(i+j)%N]!=N-j)break;
		if(j==N){
			R=-_state.first;
			break;
		}

		for(i=0;i<N;i++){
			pvipii newstate=switchstate(state,i);
			if(depth.find(newstate)==depth.end()){
				q.push(make_pair(_state.first-i-N,newstate));
			}
		}
	}
	printf("%d\n",R);
}