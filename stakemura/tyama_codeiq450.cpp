// pneumonoultramicroscopicsilicovolcanoconiosis
// 深さ優先による全探索。貪欲法が必ずしも最適解を生むとは限らないため。
#include <iostream>
#include <string>
#include <vector>
#include <set>
using namespace std;
string s_min;
vector<string>v;
int m=999;
set<string>se;
void dfs(string &s,int d){
	if(d==v.size()){
		if(s.size()<m){
			m=s.size();
			s_min=s;
		}
	}else{
		string str;
		for(int i=0;i<v.size();i++)if(se.find(v[i])==se.end()){
			for(int j=min(s.size(),v[i].size())-1;j>0;j--){
				if(s.substr(s.size()-j)==v[i].substr(0,j)){
					str=s.substr(0,s.size()-j)+v[i];
					se.insert(v[i]);
					dfs(str,d+1);
					se.erase(v[i]);
				}
			}
		}
	}
}
main(){
	string s;
	for(;cin>>s;)v.push_back(s);
	for(int i=0;i<v.size();i++){
		se.insert(v[i]);
		dfs(v[i],1);
		se.erase(v[i]);
	}
	cout<<s_min<<endl;
}