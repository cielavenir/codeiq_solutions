#include <iostream>
#include <string>
#include <vector>
#include <set>
#include <algorithm>
#include <functional>
#include <cstdlib>
#include <climits>
using namespace std;

int m,z;

template<typename BidirectionalIterator>
bool next_partial_permutation(BidirectionalIterator first,
	BidirectionalIterator middle,
	BidirectionalIterator last)
{
	if(first == middle)return false;
	reverse(middle, last);
	return next_permutation(first, last);
}
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
/*
void product(int d,int n,const vector<vector<int>>&a,vector<int>&v,const function<void(const vector<int>&)> f){
	if(d==n){
		f(v);
	}else{
		for(const int &e:a[d]){
			if(d!=0||e!=0){
				v.push_back(e);
				product(d+1,n,a,v,f);
				v.pop_back();
			}
		}
	}
}
*/
int po(int n){
	int r=1;
	for(;n;n--)r*=10;
	return r;
}
void product(int d,int n,const vector<vector<int>>&a,int v,const function<void(const int&)> f){
	if(d==n){
		f(v);
	}else{
		for(const int &e:a[d]){
			if(d!=0||e!=0){
				if((v*10+e)*po(n-(d+1))-m<=z && m-(v*10+e+1)*po(n-(d+1))-m<po(n-d)){
					product(d+1,n,a,v*10+e,f);
				}
			}
		}
	}
}

int array_to_int(const vector<int>&a){
	int r=0;
	for(const int &e:a){r=r*10+e;}
	return r;
}
string solve(int n,int _m,vector<vector<int>>&a){
	sort(a.begin(),a.end());
	if(n>1&&all_of(a.begin(),a.end(),[](const vector<int>&e){
		return all_of(e.begin(),e.end(),[](const int &f){return f==0;});
	})){
		return "-";
	}else{
		set<int>r;
		m=_m; z=INT_MAX; //
		function<void(int)> f=[&](const int &e){
			int x=abs(e-m);
			if(x<z){
				z=x;
				r.clear();
			}
			if(x==z){
				r.insert(e);
			}
		};

		if(n==1){
			for(const vector<int> &_e:a){
				for(const int &e:_e){
					f(e);
				}
			}
		}else{
			if(po(n-1)<m){
				int x=0;
				for(int i=0;i<n;i++){
					x+=po(n-i-1) * *min_element(a[i].begin(),a[i].end(),[&](const int &a,const int &b){
						int x0=x+a*po(n-i-1);
						int x1=x+b*po(n-i-1);
						return abs(x0-m)<abs(x1-m);
					});
					z=abs(x-m);
				}
				r={x};
			}
			
			do{
				/*
				vector<int>v;
				product(0,n,a,v,[&](const vector<int>&_e){
					//if(_e[0]==0)return;
					f(array_to_int(_e));
				});
				*/
				product(0,n,a,0,[&](const int &_e){
					//if(_e[0]==0)return;
					f(_e);
				});
				if(z==0)break;
			}while(next_partial_permutation(a.begin(),a.begin()+n,a.end()));
		}
		string s;
		for(const int &e:r){
			if(!s.empty())s+=",";
			s+=to_string(e);
		}
		return s;
	}
}

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);
	string line;
	for(;getline(cin,line);){
		vector<string>a=split(line,",");
		vector<vector<int>>b;
		if(a[2].find('/')!=string::npos){
			vector<string>c=split(a[2],"/");
			for(const string &e:c){
				vector<int>v;
				for(const char &f:e)v.push_back(f-'0');
				b.push_back(v);
			}
		}else{
			for(const char &e:a[2])b.push_back({e-'0'});
		}
		cout<<solve(strtol(a[0].c_str(),NULL,10),strtol(a[1].c_str(),NULL,10),b)<<endl;
	}
}