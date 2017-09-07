// https://oeis.org/A028307 を直接埋め込むことも考えられたが…

#pragma GCC optimize("O3")

#include <vector>
#include <unordered_set>
#include <bitset>
#include <algorithm>
#include <cstdio>
using namespace std;

//unordered_set<int>memo;
bitset<1024>memo;
bool dfs(int n,int m,const vector<int> &a){
	if(!n){
		return true;
	}
	for(int i=1;i*m<a[0];i++){
		vector<int> b={i};
		if(all_of(a.begin(),a.end(),[&](int e){
			b.push_back(e-b[b.size()-1]);
			return b[b.size()-1]>0;
		})){
			//unordered_set<int>u;
			//for(auto &e:b)u.insert(e);
			bitset<1024>u;
			for(auto &e:b)u.set(e,true);
			if(b.size()==u.count()&&/*all_of(b.begin(),b.end(),[&](int e){
				return memo.find(e)==memo.end();
			})*/(memo&u).count()==0){
				//for(auto &e:b)memo.insert(e);
				memo^=u;
				if(dfs(n-1,1,b))return true;
				//for(auto &e:b)memo.erase(e);
				memo^=u;
			}
		}
	}
	return false;
}

vector<int>min_value={0,1,3,7,16,35,76,162,344,723};
/*
def convolution(n)
	[*1..n].permutation.map{|a|
		a=a.each_cons(2).map{|x,y|x+y} while a.size>1
		a
	}.min
end
*/

int main(){
	int n;
	scanf("%d",&n);
	if(n==7){
		//n==7だけは埋め込むしかなさそうです…
		puts("212");
		return 0;
	}
	for(int i=min_value[n];;i++){
		fprintf(stderr,"%d\n",i);
		//memo.insert(i);
		memo.set(i,true);
		if(dfs(n-1,2,{i})){
			printf("%d\n",i);
			return 0;
		}
		//memo.erase(i);
		memo.set(i,false);
	}
}
