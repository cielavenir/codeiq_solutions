#include <vector>
#include <cstdio>
using namespace std;
vector<int> m={10,50,100,500};

int rec(int i,int cost,int many){
	if(cost<0||many<0)return 0;
	if(cost==0)return 1;
	int r=0;
	for(;i<m.size();i++){
		r+=rec(i,cost-m[i],many-1);
	}
	return r;
}
int main(){
	printf("%d\n",rec(0,1000,15));
}