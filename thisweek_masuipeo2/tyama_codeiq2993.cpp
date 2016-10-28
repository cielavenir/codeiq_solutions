#include <string>
#include <queue>
#include <map>
#include <algorithm>
#include <numeric>
#include <cstdio>
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

const int D[4][2]={ //Right,Up,Left,Down
	{0,1},
	{-1,0},
	{0,-1},
	{1,0},
};

class Maze{
	const vector<string> &v;
	const int gx,gy;
	int x,y,d;
public:
	Maze(int _x,int _y,int _gx,int _gy,int _d,const vector<string>&_v)
		: x(_x),y(_y),gx(_gx),gy(_gy),d(_d),v(_v){}
	bool ok(){return x==gx && y==gy;}
	bool same(Maze& other){return x==other.x && y==other.y;}
	void move(){
		int d_orig=(d+3)%4,i=0;
		for(;i<4;i++){
			d=(d_orig+i)%4;
			if(v[y+D[d][0]][x+D[d][1]]!='#')break;
		}
		y=y+D[d][0];
		x=x+D[d][1];
		//printf("%d %d %d\n",x,y,d);
	}
};

bool solvable(int _x,int _y,int _gx,int _gy,const vector<string>&v){
	if(v[_y][_x]=='#' || v[_gy][_gx]=='#')return false;
	typedef pair<int,int> pii;
	queue<pii>q;
	map<pii,pii>back;
	q.push(make_pair(_x,_y));
	back[make_pair(_x,_y)]=make_pair(_x,_y);
	for(;!q.empty();){
		pii p=q.front();q.pop();
		int x=p.first,y=p.second;
		for(int d=0;d<4;d++){
			if(v[y+D[d][0]][x+D[d][1]]!='#'){
				pii _p=make_pair(x+D[d][1],y+D[d][0]);
				if(_p==make_pair(_gx,_gy))return true;
				if(back.find(_p)==back.end())back[_p]=p,q.push(_p);
			}
		}
	}
	return false;
}

int main(){
	int H,W,N,R=0;
	scanf("%d%d%d",&H,&W,&N);
	vector<int> w(H*W);
	iota(w.begin(),w.end(),0);
	do{
		vector<string>v(H+2);
		v[0]=v[H+1]=string(W+2,'#');
		for(int i=1;i<=H;i++){
			v[i]=string(1,'#')+string(W,' ')+'#';
		}
		for(int i=0;i<N;i++)v[w[i]/W+1][w[i]%W+1]='#';
		if(!solvable(1,1,W,H,v))continue;
		Maze m1(1,1,W,H,3,v);
		int r=1;
		for(;!m1.ok();r++)m1.move();
		R=max(R,r);
	}while(next_combination(w.begin(),w.begin()+N,w.end()));
	printf("%d\n",R);
}
