//完全に誤解していました。「お菓子の包み紙は同じ味でもそれぞれ判別できる」ので、next_combination()ではなくnext_partial_permutaion()を使います。
//勿論、値は非常に大きくなるので、メモ化が必要になります。
//実行時間は0.4秒ほどでした。

#define PERM

#include <algorithm>
using namespace std;

#ifdef PERM
template<typename BidirectionalIterator>
bool next_partial_permutation(BidirectionalIterator first,
	BidirectionalIterator middle,
	BidirectionalIterator last)
{
	if(first == middle)return false;
	reverse(middle, last);
	return next_permutation(first, last);
}
#else
// http://photon.poly.edu/~hbr/boost/combinations.html
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
#endif

#include <vector>
#include <map>
#include <cstdio>
#define N 5
#define M 6
map<vector<int>,long long>memo;
//v=お菓子の種類ごとの個数、d=深さ
//深さが1増えることとお菓子の個数がM減ることは同値である
//(深さdは効率を無視すれば毎回(N-お菓子の個数/M)から求められる)から、メモ化はvだけで良い。
long long dfs(vector<int>&v,int d){
	if(d==N)return 1;
	map<vector<int>,long long>::iterator it=memo.find(v);
	if(it!=memo.end())return it->second;
	//cur=vを(d番目のお菓子を除いて)展開したもの
	vector<int>cur;
	for(int i=0;i<v.size();i++)if(i!=d){
		for(int j=0;j<v[i];j++)cur.push_back(i);
	}
	//d番目のお菓子を除いて展開し終わった時点で個数が足りなければ無効
	if(cur.size()<M)return memo[v]=0;
	long long ret=0;
	do{
		for(int i=0;i<M;i++)v[cur[i]]-=1;
		ret+=dfs(v,d+1);
		for(int i=0;i<M;i++)v[cur[i]]+=1;
#ifdef PERM
	}while(next_partial_permutation(cur.begin(),cur.begin()+M,cur.end())); // 1926172117389136
#else
	}while(next_combination(cur.begin(),cur.begin()+M,cur.end())); // 1573374
#endif
	return memo[v]=ret;
}

int main(){
	vector<int>v;
	for(int i=0;i<N;i++)v.push_back(M);
	printf("%lld\n",dfs(v,0));
}