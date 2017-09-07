#include <cstdio>
#include <set>
#include <map>
#include <vector>
#include <deque>
#include <algorithm>
#include <numeric>
using namespace std;

template <class BidirectionalIterator>
bool next_combination(BidirectionalIterator first1,
	BidirectionalIterator last1,
	BidirectionalIterator first2,
	BidirectionalIterator last2)
{
	if(( first1 == last1 ) || ( first2 == last2 ))return false;
	BidirectionalIterator m1 = last1;
	BidirectionalIterator m2 = last2; --m2;
	while(--m1 != first1 && !(* m1 < *m2 ));
	bool result = (m1 == first1 ) && !(* first1 < *m2 );
	if(!result){
		while( first2 != m2 && !(* m1 < * first2 ))++first2;
		first1 = m1;
		iter_swap(first1 , first2 );
		++ first1;
		++ first2;
	}
	if(( first1 != last1 ) && ( first2 != last2 )){
		m1 = last1 ; m2 = first2 ;
		while(( m1 != first1 ) && (m2 != last2 )){
			iter_swap (--m1 , m2 );
			++m2;
		}
		reverse(first1 , m1);
		reverse(first1 , last1);
		reverse(m2 , last2);
		reverse(first2 , last2);
	}
	return !result;
}
template <class BidirectionalIterator>
bool next_combination (BidirectionalIterator first,
	BidirectionalIterator middle,
	BidirectionalIterator last)
{return next_combination(first , middle , middle , last);}

typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,-1},{-1,0},{0,1},{1,0}
};

int main(){
	int N,M,r=0;
	scanf("%d%d",&N,&M);
	if(N*M%2){
		puts("0");
		return 0;
	}
	int L=N*M/2-1;
	vector<int>a(L*2);
	iota(a.begin(),a.end(),1);
	do{
		set<int>se;
		if(any_of(a.begin(),a.begin()+L,[&](int e)->bool{
			se.insert(e);
			return se.find(L*2+1-e)!=se.end();
		}))continue;
		vector<vector<int>>m(N);
		for(auto &e:m)e.resize(M);
		m[0][0]=1;
		for_each(a.begin(),a.begin()+L,[&](int e){m[e/M][e%M]=1;});
		deque<pair<int,int>>q={{0,0}};
		map<pair<int,int>,int>d={{{0,0},0}};
		for(;!q.empty();){
			auto c=q[0];
			q.pop_front();
			for(auto &di:D){
				int nx=di.x+c.first;
				int ny=di.y+c.second;
				if(0<=nx&&nx<M && 0<=ny&&ny<N && m[ny][nx] && d.find({nx,ny})==d.end()){
					d[{nx,ny}]=d[c]+1;
					q.push_back({nx,ny});
				}
			}
		}
		if(d.size()==N*M/2)r++;
	}while(next_combination(a.begin(),a.begin()+L,a.end()));
	printf("%d\n",r);
}
