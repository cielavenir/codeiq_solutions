#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <cstdio>
using namespace std;

vector<string> split(string &str, const char *delim){
	vector<string> result;
	int cutAt;
	while( (cutAt = str.find_first_of(delim)) != str.npos ){
		if(cutAt > 0){
			result.push_back(str.substr(0, cutAt));
		}
		str = str.substr(cutAt + 1);
	}
	if(str.length() > 0){
		result.push_back(str);
	}
	return result;
}

int main(){
	//input
	string line;
	getline(cin,line);
	map<char,int>mapping;
	map<int,char>reverse_mapping;
	map<int,pair<vector<int>,int>>m;
	for(auto &c:line){
		if('A'<=c&&c<='Z'&&mapping.find(c)==mapping.end()){
			int id=mapping.size();
			mapping[c]=id;
			reverse_mapping[id]=c;
		}
	}
	vector<string> a=split(line,",");
	for(auto &e:a){
		int key=mapping[e[0]];
		int num=0;
		vector<int>person;
		for(auto &c:e.substr(2)){
			if('A'<=c&&c<='Z')person.emplace_back(mapping[c]);
			else num=num*10+c-'0';
		}
		m[key]={person,num};
	}

	//brute-force
	int x=-1;
	for(int i=0;i<1<<mapping.size();i++){
		if([&]{
			for(auto &e:m){
				int n=0;
				for(auto &f:e.second.first){
					if((i>>f)&1)n++;
				}
				if(
					((i>>e.first)&1) != (n==e.second.second)
				)return false;
			}
			return true;
		}()){
			if(x>=0){
				cout<<"many"<<endl;return 0;
			}else{
				x=i;
			}
		}
	}

	//output
	if(x<0)cout<<"none"<<endl;
	else if(x==0)cout<<"-"<<endl;
	else{
		string r;
		for(auto &e:reverse_mapping)if(x&(1<<e.first))r+=e.second;
		sort(r.begin(),r.end());
		cout<<r<<endl;
	}
}