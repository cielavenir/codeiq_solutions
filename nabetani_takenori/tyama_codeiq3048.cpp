#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <map>
#include <set>
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

const int D[4][2]={{-1,0},{0,-1},{1,0},{0,1}};
char tetromino(const set<pair<int,int> > &island){ //v is sorted by x, then y
	int i,s;
	set<pair<int,int> >::iterator it=island.begin();
	if(
		island.find(make_pair(it->first+1,it->second))!=island.end()&&
		island.find(make_pair(it->first,it->second+1))!=island.end()&&
		island.find(make_pair(it->first+1,it->second+1))!=island.end()
	)return 'O';
	if((
		island.find(make_pair(it->first+1,it->second))!=island.end()&&
		island.find(make_pair(it->first+2,it->second))!=island.end()&&
		island.find(make_pair(it->first+3,it->second))!=island.end()
	)||(
		island.find(make_pair(it->first,it->second+1))!=island.end()&&
		island.find(make_pair(it->first,it->second+2))!=island.end()&&
		island.find(make_pair(it->first,it->second+3))!=island.end()
	))return 'I';
	for(it=island.begin();it!=island.end();it++){
		vector<int>d;
		for(i=0;i<4;i++)if(island.find(make_pair(it->first+D[i][0],it->second+D[i][1]))!=island.end())d.push_back(i);
		if(d.size()==3)return 'T';
		else if(d.size()==2&&(
			island.find(make_pair(it->first+D[ d[0] ][0]*2,it->second+D[ d[0] ][1]*2))!=island.end()||
			island.find(make_pair(it->first+D[ d[1] ][0]*2,it->second+D[ d[1] ][1]*2))!=island.end()
		))return 'L';
	}
	return 'S';
}
int connected(const set<pair<int,int> > &island){
	queue<pair<int,int> > q;
	q.push(*island.begin());
	set<pair<int,int> > se;
	se.insert(*island.begin());
	for(;!q.empty();){
		pair<int,int> cur=q.front();q.pop();
		for(auto &e:D){
			pair<int,int> nxt={cur.first+e[0],cur.second+e[1]};
			if(island.find(nxt)!=island.end() && se.find(nxt)==se.end()){
				se.insert(nxt);
				q.push(nxt);
			}
		}
	}
	return se.size()==island.size();
}
	
int main(){
	vector<string>v0(8);
	for(int i=0;i<8;i++)cin>>v0[i];
	sort(v0.begin(),v0.end());
	vector<pair<int,int> >v(8);
	for(int i=0;i<8;i++)v[i]={v0[i][0]-'0',v0[i][1]-'0'};
	set<string>ret;
	do{
		set<pair<int,int> >se1(v.begin(),v.begin()+4);
		set<pair<int,int> >se2(v.begin()+4,v.end());
		if(connected(se1)&&connected(se2)){
			string r=string(1,tetromino(se1))+tetromino(se2);
			sort(r.begin(),r.end());
			ret.insert(r);
		}
	}while(next_combination(v.begin(),v.begin()+4,v.end()));
	if(ret.empty()){
		cout<<'-'<<endl;
		return 0;
	}
	bool f=true;
	for(auto &e:ret){
		if(!f)cout<<',';
		f=false;
		cout<<e;
	}
	cout<<endl;
}
