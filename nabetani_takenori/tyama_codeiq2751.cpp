//http://qiita.com/Nabetani/items/1de39df381dfeee305ab
//http://nabetani.sakura.ne.jp/hena/ord12aloroturtle/
#include <iostream>
#include <string>
#include <vector>
#include <map>
using namespace std;
const int D[4][2]={{1,0},{0,1},{-1,0},{0,-1}}; //RDLU

#define CODEIQ2751

#if defined(HENA12)
const vector<vector<string>>v={
	{"ABCDEFGH","LMNOPQRS","WXYZabcd"},
	{"KVg52zwtqnkh","JUf630xuroli","ITe741yvspmj"},
};
const char start='A',error='?';
#elif defined(CODEIQ2751)
const vector<vector<string>>v={
	{"0369cfi","147adgj","258behk"},
	{"loruxAD","mpsvyBE","nqtwzCF"},
	{"GJMPSVY","HKNQTWZ","ILORUX@"},
};
const char start='0',error='!';
#else
#error define HENA12 or CODEIQ2751.
#endif

int main(){
	int x,y,i,d,n;
	map<char,map<int,pair<char,int> > >m;
	for(auto &v1:v){
		for(y=0;y<v[0].size();y++){
			for(x=0;x<v1[y].size();x++){
				char c=v1[y][x];
				if(x<v1[y].size()-1)m[c][0]=make_pair(v1[y][x+1],0);
				if(y<v[0].size()-1)m[c][1]=make_pair(v1[y+1][x],1);
				if(x>0)m[c][2]=make_pair(v1[y][x-1],2);
				if(y>0)m[c][3]=make_pair(v1[y-1][x],3);
			}
		}
	}
	for(int i=0;i<v.size();i++){
		for(int j=0;j<v[0].size();j++){
			char c=v[i][j][v[i][j].size()-1],d=v[(i+1)%v.size()][v[0].size()-1][j];
			m[c][0]=make_pair(d,3);
			m[d][1]=make_pair(c,2);
		}
	}
	string line;
	for(;getline(cin,line);){
		char cur=start,nxt;
		d=0;
		cout<<cur;
		for(i=0;i<line.size();i++){
			if(line[i]=='L')d=(d+3)%4;
			else if(line[i]=='R')d=(d+1)%4;
			else{
				n=0;
				if('1'<=line[i]&&line[i]<='9')n=line[i]-'0';
				if('a'<=line[i]&&line[i]<='f')n=line[i]-'a'+10;
				if(!n)break;
				for(;n;n--){
					if(m[cur].find(d)==m[cur].end()){cout<<error;break;}
					nxt=m[cur][d].first;
					d=m[cur][d].second;
					cur=nxt;
					cout<<cur;
				}
				if(n)break;
			}
		}
		cout<<endl<<flush;
	}
}