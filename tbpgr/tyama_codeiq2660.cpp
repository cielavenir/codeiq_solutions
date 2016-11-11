#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <map>
#include <cstdio>
using namespace std;

template<typename T> class union_find{
	map<T,T> parent;
public:
	T root(const T &a){
		if(parent.find(a)==parent.end())parent[a]=a;
		return parent[a]==a?a:(parent[a]=root(parent[a]));
	}
	int same(const T &a,const T &b){return root(a)==root(b);}
	int unite(const T &a,const T &b){
		T x=root(a),y=root(b);//if(x==y)return 0;
		parent[x]=y;
		return 1;
	}
	int count(const T &a){
		int r=0;
		T x=root(a);
		for(typename map<T,T>::iterator it=parent.begin();it!=parent.end();++it)r+=it->second==x;
		return r;
	}
};

int main(){
	int n=1;
	string line,s,name;
	getline(cin,name);
	union_find<string> uf;
	for(;getline(cin,line);){
		n++;
		istringstream ss(line);
		vector<string> v;
		for(;getline(ss,s,',');)v.push_back(s);
		for(int i=0;i<v.size()-1;i++)for(int j=i+1;j<v.size();j++)uf.unite(v[i],v[j]);
	}
	printf("%d\n",n-uf.count(name));
}