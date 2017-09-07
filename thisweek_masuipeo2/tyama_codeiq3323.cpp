#include <vector>
#include <algorithm>
#include <numeric>
#include <cstdio>
using namespace std;
typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{-1,-1},{-1,0},{-1,1},{0,1},{1,1},{1,0},{1,-1},{0,-1}
};

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

int main(){
	int H,W,A,R=0;
	scanf("%d%d%d",&H,&W,&A);
	vector<int>v(H*W);
	iota(v.begin(),v.end(),0);
	do{
		//全探索です
		int r=0;
		vector<vector<int>>m(H);
		for(auto &e:m)e.resize(W);
		for(int i=0;i<A;i++)m[v[i]/W][v[i]%W]=-1;
		for(int h=0;h<H;h++)for(int w=0;w<W;w++)if(!m[h][w]){
		for(auto &d:D){
			int nx=w+d.x,ny=h+d.y;
			if(0<=nx&&nx<W && 0<=ny&&ny<H && m[ny][nx])r++;
		}
	}
	R=max(R,r);
	}while(next_combination(v.begin(),v.begin()+A,v.end()));
	printf("%d\n",R);
}
