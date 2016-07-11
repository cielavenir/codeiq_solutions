#include <vector>
#include <cstdio>
#include <cstdlib>
using namespace std;

int main(){
	int M,x,mi;
	scanf("%d",&M);
	mi=M;
	vector<int>v;
	for(;~scanf("%d",&x);){
		v.push_back(x);
		mi=min(mi,abs(M-x));
	}
	vector<int>bag(M+mi+1);
	bag[0]=1;
	for(auto &e:v){
		for(int i=M+mi;i>=e;i--)bag[i]+=bag[i-e];
	}
	x=0;
	for(int i=M-mi;i<=M+mi;i++)if(bag[i]&&abs(M-i)<abs(M-x))x=i;
	printf("%d\n",abs(M-x));
}