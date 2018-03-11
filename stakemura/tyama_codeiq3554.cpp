#include <iostream>
#include <string>
#include <vector>
using namespace std;

#define M 999
int _lcs[M][M];
void backtrack(int i,int j,string &s,const string &a,const string &b){
	if(i==0||j==0);
	else if(a[i]==b[j])backtrack(i-1,j-1,s,a,b),s+=a[i];
	else if(_lcs[i][j-1]>_lcs[i-1][j])backtrack(i,j-1,s,a,b);
	else backtrack(i-1,j,s,a,b);
}
string lcs(const string &a,const string &b){
	int _a=a.size()-1,_b=b.size()-1;
	for(int i=1;i<=_a;i++)
		for(int j=1;j<=_b;j++)
			_lcs[i][j]=max(max(_lcs[i-1][j],_lcs[i][j-1]),_lcs[i-1][j-1]+(a[i]==b[j]));
	string r;
	backtrack(_a,_b,r,a,b);
	return r;
}
int main(){
	vector<string>v;
	string s,t;
	cin>>s;v.push_back(s);
	for(;cin>>t;){
		v.push_back(t);
		s=lcs(string(1,'*')+s,string(1,'*')+t);
	}
	//now s is lcs
	for(auto &e:v){
		int i=0,j=0;
		for(;i<e.size();i++){
			if(s[j]=='*')j++;
			if(s[j]==e[i]){
				j++;
			}else{
				e[i]='*';
			}
		}
		string t;
		for(auto &c:e){
			if(t.empty()||c!='*'||t[t.size()-1]!=c)t+=c;
		}
		//merge
		string u;
		for(i=0,j=0;i<t.size()||j<s.size();){
			if((t[i]=='*')+(s[j]=='*')!=1){
				u+=t[i];
				i++,j++;
			}else if(t[i]=='*'){
				u+='*';
				i++;
			}else if(s[j]=='*'){
				u+='*';
				j++;
			}
		}
		s=u;
	}
	cout<<s<<endl;
}
