#include <vector>
#include <unordered_set>
#include <algorithm>
#include <cstdio>
using namespace std;
unordered_set<int> squares;
bool dfs(vector<int>&v,int prev,vector<int>result){
	if(v.empty()){
		if(squares.find(prev+1)!=squares.end()){
			//1 8 28 21 4 32 17 19 30 6 3 13 12 24 25 11 5 31 18 7 29 20 16 9 27 22 14 2 23 26 10 15
			//for(int i=0;i<result.size();i++)printf(i<result.size()-1?"%d ":"%d\n",result[i]);
			return true;
		}
	}else{
		int l=v.size();
		for(int i=0;i<l;i++){
			if(squares.find(prev+v[i])!=squares.end()){
				int next=v[i];
				v.erase(v.begin()+i);
				result.push_back(next);
				bool r=dfs(v,next,result);
				v.insert(v.begin()+i,next);
				result.pop_back();
				if(r)return true;
			}
		}
	}
	return false;
}
int main(){
	for(int i=1;i<9999;i++)squares.insert(i*i);
	int n=0;
	vector<int>v,result;
	result.push_back(1);
	for(int i=2;;i++){
		v.push_back(i);
		if(dfs(v,1,result)){
			printf("%d\n",i); //32
			return 0;
		}
	}
}