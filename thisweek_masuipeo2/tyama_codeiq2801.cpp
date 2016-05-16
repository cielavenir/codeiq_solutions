#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <unordered_set>
#include <cstdio>
using namespace std;

const vector<int>bingo={
	0b1111100000000000000000000,
	0b0000011111000000000000000,
	0b0000000000111110000000000,
	0b0000000000000001111100000,
	0b0000000000000000000011111,
	0b1000010000100001000010000,
	0b0100001000010000100001000,
	0b0010000100001000010000100,
	0b0001000010000100001000010,
	0b0000100001000010000100001,
	0b1000001000001000001000001,
	0b0000100010001000100010000,
};

vector<vector<int>>cards;
int dfs(int d,vector<int> &v){
	if(d==cards.size()){
		unordered_set<int>s;
		for(int i=0;i<cards.size();i++){
			int line=bingo[v[i]];
			for(int x=0;x<25;x++){
				if(line&(1<<x))s.emplace(cards[i][24-x]);
			}
		}
		return s.size();
	}else{
		int r=5*cards.size();
		for(int i=0;i<bingo.size();i++){
			v.push_back(i);
			r=min(r,dfs(d+1,v));
			v.pop_back();
		}
		return r;
	}
}
int main(){
	string line,s;
	for(;getline(cin,line);){
		istringstream ss(line);
		vector<int>card;
		for(int i=0;getline(ss,s,',');i++){
			int x=strtol(s.c_str(),NULL,10);
			card.push_back(x);
		}
		cards.emplace_back(move(card));
	}
	vector<int>v;
	printf("%d\n",dfs(0,v));
}