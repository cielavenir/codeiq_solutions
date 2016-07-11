#include <vector>
#include <map>
#include <set>
#include <cstdio>
using namespace std;

const int D[4][2]={{-1,0},{0,-1},{1,0},{0,1}};
char tetromino(set<pair<int,int> > &island){ //v is sorted by x, then y
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

//O(MD**N) (M=64,D=4,N=4なので許容範囲)
map<unsigned long long,char>memo;
void island(int prevx,int prevy,int x,int y,const vector<int>&area,set<pair<int,int>>&s){
	pair<int,int> coor=make_pair(x,y);
	if(x<0||8<=x || y<0||8<=y || ((area[y]>>x)&1)==1 || s.find(coor)!=s.end())return;
	s.insert(coor);
	if(s.size()==4){
		unsigned long long key=0;
		for(auto &e:s)key|=(1ULL<<(8*e.second))<<e.first;
		if(memo.find(key)==memo.end())memo[key]=tetromino(s);
	}else{
		island(x,y,x-1,y,area,s);
		island(x,y,x+1,y,area,s);
		island(x,y,x,y-1,area,s);
		island(x,y,x,y+1,area,s);
		//バックを許可(場当たり的対応)
		if(x-prevx==1)island(x,y,x-2,y,area,s);
		if(y-prevy==1)island(x,y,x,y-2,area,s);
	}
	s.erase(coor);
}
	
int main(){
	int n;
	for(;~scanf("%x",&n);){
		vector<int>v(8);
		v[0]=n;
		for(int i=1;i<8;i++)scanf("%x",&n),v[i]=n;
		memo.clear();
		set<pair<int,int>>s;
		for(int y=0;y<8;y++)for(int x=0;x<8;x++)island(255,255,x,y,v,s);
		map<char,int>total;
		for(auto &e:memo)total[e.second]++;
		printf("%d,%d,%d,%d,%d\n",total['I'],total['L'],total['O'],total['S'],total['T']);
	}
}