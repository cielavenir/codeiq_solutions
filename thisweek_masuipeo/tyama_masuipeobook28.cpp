#include <vector>
#include <cstdio>
using namespace std;

vector<pair<int,int>>T={
	{11000,40},
	{8000,30},
	{400,24},
	{800,20},
	{1800,16},
	{1000,15},
	{7000,40},
	{100,10},
	{300,12},
};

int main(){
	int M=150;
	vector<int>bag(M+1);
	bag[0]=1;
	for(auto &e:T){
		for(int i=M;i>=e.second;i--)
			if(bag[i-e.second]&&bag[i]<bag[i-e.second]+e.first)bag[i]=bag[i-e.second]+e.first;
	}
	for(int i=1;i<=M;i++)if(bag[i]<bag[i-1])bag[i]=bag[i-1];
	printf("%d\n",bag[M]-1);
}