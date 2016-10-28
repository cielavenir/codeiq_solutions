#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cstdio>
using namespace std;

bool is_g(vector<long long>&v){
	long double x=(long double)v[1]/v[0];
	for(int i=1;i<v.size()-1;i++)if((long double)v[i+1]/v[i]!=x)return false;
	return true;
}
bool is_a(vector<long long>&v){
	long long x=v[1]-v[0];
	for(int i=1;i<v.size()-1;i++)if(v[i+1]-v[i]!=x)return false;
	return true;
}
vector<long long>F={1,2};
bool is_f(vector<long long>&v){
	for(int i=0;i<v.size()-2;i++)if(v[i]+v[i+1]!=v[i+2])return false;
	return *lower_bound(F.begin(),F.end(),v[0])==v[0];
}

int main(){
	for(int i=2;i<84;i++)F.push_back(F[i-1]+F[i-2]);
	string line;
	for(;getline(cin,line);){
		istringstream ss(line);
		vector<long long>v;
		long long x;
		for(;ss>>x;)v.push_back(x);
		string r;
		if(is_g(v))r+='G';
		if(is_a(v))r+='A';
		if(is_f(v))r+='F';
		cout<<(r[0]?r:"x")<<endl;
	}
}
