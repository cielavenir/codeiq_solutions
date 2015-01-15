#include <vector>
#include <map>
#include <cstdio>
using namespace std;

int main(){
	map<int,int>m;
	vector<int>v={1,14,14,4,11,7,6,9,8,10,10,5,13,2,3,15};
	for(int i=0;i<1<<16;i++){
		int s=0;
		for(int j=0;j<16;j++)if(i&(1<<j))s+=v[j];
		m[s]++;
	}
	int result_val=0,result=0;
	for(auto &e:m){
		if(e.second>result_val){
			result_val=e.second;
			result=e.first;
		}
	}
	printf("%d (%d)\n",result,result_val); //66 (1364)
}