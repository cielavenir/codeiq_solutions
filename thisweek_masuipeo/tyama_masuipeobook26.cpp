#include <vector>
#include <queue>
#include <unordered_map>
#include <cstdio>
#include <cstdlib>
using namespace std;
#define X 10
#define Y 10
#define THRESHOLD 2

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
	template<typename T,size_t N>
	class hash<array<T,N>>{
		public:
		size_t operator()(array<T,N> const &container) const{
			return hash_range(container.begin(),container.end());
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

int manhattan(int x1,int y1,int x2,int y2){
	return abs(x1-x2)+abs(y1-y2);
}
int calc(vector<int>&v){
	int s=0;
	for(int coor=0;coor<X*Y;coor++){
		if(v[coor]!=0){
			s+=manhattan(coor%X,coor/X,(v[coor]-1)%X,(v[coor]-1)/X);
		}else{
			s+=manhattan(coor%X,coor/X,X-1,Y-1);
		}
	}
	return s;
}
int main(){
	int i;
	vector<int>start,goal;
	start.push_back(2);for(i=0;i<X*Y-2;i++)start.push_back(1);start.push_back(0);
	//正方形なので手抜き
	for(i=0;i<X*Y-2;i++)goal.push_back(1);goal.push_back(0);goal.push_back(2);

	unordered_map<vector<int>,pair<int,int> >mstart,mgoal;
	queue<pair<vector<int>,bool> >q;
	mstart[start]=make_pair(X*Y-1,0);
	mgoal[goal]=make_pair(X*Y-2,0);
	q.push(make_pair(start,false));
	q.push(make_pair(goal,true));
	for(;!q.empty();){
		vector<int> v=q.front().first;
		bool f=q.front().second;
		q.pop();
		int val=calc(v);
		unordered_map<vector<int>,pair<int,int> >&m=f?mgoal:mstart;
		unordered_map<vector<int>,pair<int,int> >&m2=f?mstart:mgoal;
		int coor=m[v].first,x=coor%X,y=coor/X;
		int depth=m[v].second;
		if(0<x){
			swap(v[coor],v[coor-1]);
			if(m.find(v)==m.end() && calc(v)<=val+THRESHOLD)m[v]=make_pair(coor-1,depth+1),q.push(make_pair(v,f));
			if(m2.find(v)!=m2.end()){printf("%d\n",m2[v].second+depth+1);return 0;}
			swap(v[coor],v[coor-1]);
		}
		if(x<X-1){
			swap(v[coor],v[coor+1]);
			if(m.find(v)==m.end() && calc(v)<=val+THRESHOLD)m[v]=make_pair(coor+1,depth+1),q.push(make_pair(v,f));
			if(m2.find(v)!=m2.end()){printf("%d\n",m2[v].second+depth+1);return 0;}
			swap(v[coor],v[coor+1]);
		}
		if(0<y){
			swap(v[coor],v[coor-X]);
			if(m.find(v)==m.end() && calc(v)<=val+THRESHOLD)m[v]=make_pair(coor-X,depth+1),q.push(make_pair(v,f));
			if(m2.find(v)!=m2.end()){printf("%d\n",m2[v].second+depth+1);return 0;}
			swap(v[coor],v[coor-X]);
		}
		if(y<Y-1){
			swap(v[coor],v[coor+X]);
			if(m.find(v)==m.end() && calc(v)<=val+THRESHOLD)m[v]=make_pair(coor+X,depth+1),q.push(make_pair(v,f));
			if(m2.find(v)!=m2.end()){printf("%d\n",m2[v].second+depth+1);return 0;}
			swap(v[coor],v[coor+X]);
		}
	}
}