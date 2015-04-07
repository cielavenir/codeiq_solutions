// http://photon.poly.edu/~hbr/boost/combinations.html
#include <algorithm>
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

#include <vector>
#include <set>
#include <numeric>
#include <cstdio>
int main(){
	int N=20;
	int M=8;
	int K=5;

	vector<int>v1(N);
	vector<int>v2(N);
	iota(v1.begin(),v1.end(),1);
	iota(v2.begin(),v2.end(),1);
	long long num=0,den=0;
	do{
		//do{
			//Lv2:片方は固定して差し支えない
			den++;
			set<int>r;
			set_intersection(v1.begin(),v1.begin()+M,v2.begin(),v2.begin()+M,inserter(r,r.end()));
			num+=r.size()>=K;
		//}while(next_combination(v2.begin(),v2.begin()+M,v2.end()));
	}while(next_combination(v1.begin(),v1.begin()+M,v1.end()));
	printf("%f\n",num*1.0/den);
}
/*
10  4 2 -> 0.547619
20  8 5 -> 0.113241
40 18 8 -> 0.648568
*/