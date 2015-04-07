#include <iostream>
#include <vector>
#include <set>
#include <algorithm>
using namespace std;
struct less_size{
	bool operator()(const string &l, const string &r) const{return l.size()<r.size();}
};
int main(){
	int i,j;
	vector<string> v,ret;
	string s;
	for(;cin>>s;)v.push_back(s);
	for(i=0;i<2;i++)sort(v.begin(),v.end(),less_size());

	set<char>se;
	///
	for(i=0;i<v.size()&&se.size()<26;i++){
		s=v[i];
		for(j=0;j<s.size();j++)if(se.find(s[j])==se.end())break;
		if(j<s.size()){
			ret.push_back(s);
			for(j=0;j<s.size();j++)se.insert(s[j]);
		}
	}

	se.clear();
	v=ret;
	reverse(v.begin(),v.end());
	ret.clear();
	///
	for(i=0;i<v.size()&&se.size()<26;i++){
		s=v[i];
		for(j=0;j<s.size();j++)if(se.find(s[j])==se.end())break;
		if(j<s.size()){
			ret.push_back(s);
			for(j=0;j<s.size();j++)se.insert(s[j]);
		}
	}

	j=0;
	for(i=0;i<ret.size();i++){
		j+=ret[i].size();
		cout<<ret[i]<<(i<ret.size()-1?' ':'\n');
	}
	cout<<j<<endl;
}
/*
言語:C++

JOIN SIZE VIEW CHAR SUM PAD SQL KEY MAX AVG OF AT BY
40 (文字)

real 0m0.007s
user 0m0.002s
sys  0m0.002s

まず、単語リストから、文字数が少ない単語から順番に、全てのアルファベットを網羅するまで拾った。ただしその時点で当該単語に含まれるアルファベットが全て網羅できているときは拾わないようにした。
このとき、clang++では、
OR IS ON OF TO BY GO AT ASC ARE KEY AVG AND SUM MAX ALL SQL PAD VIEW ZONE WHEN JOIN
で、62文字であった。
このリストは重複を多数含むことは明らかなので、文字数が多い単語から順番に、全てのアルファベットを網羅するまで拾った。

なお、文字数が少ない単語から順番に、とあるが、同じ文字数の場合の並び替え結果は不定である。
そのため、OSX Mavericksでは次のような結果が出た。
・clang++ -O2 -W -Wall -Wno-sign-compare
JOIN WHEN ZONE VIEW PAD SQL MAX SUM AVG KEY ARE ASC AT BY OF
46
・llvm-g++-4.2 -O2 -W -Wall -Wno-sign-compare
ROWS SIZE JOIN HOUR AVG PAD SUM SQL MAX DEC KEY AT BY OF
43
・g++-mp-4.8 -O2 -W -Wall -Wno-sign-compare (MacPorts)
JOIN HOUR ROWS ZONE MAX AVG KEY DEC SQL PAD GET OF BY
41
並び替えを2回にしたところ、以下のようになった。
・clang++ -O2 -W -Wall -Wno-sign-compare
JOIN WHEN ZONE VIEW PAD SQL MAX SUM AVG KEY ARE ASC AT BY OF
46
・llvm-g++-4.2 -O2 -W -Wall -Wno-sign-compare
JOIN CHAR ROWS SIZE SUM SQL MAX KEY AVG PAD SET BY OF
41
・g++-mp-4.8 -O2 -W -Wall -Wno-sign-compare (MacPorts)
JOIN SIZE VIEW CHAR SUM PAD SQL KEY MAX AVG OF AT BY
40
文字数が少ないほうが良いので、40文字の結果を提出した。

なお、この性質上、ideone上では上記と同じ出力を得ることができない。
*/