#include <unordered_set>
#include <cstdio>
const int N=7;
int gcd(int x,int y){return y>0?gcd(y,x%y):x;}
int main(){
	std::unordered_set<long long>dict;
	for(int i=1;i<N;i++)for(int j=1;j<N;j++){
		int g=gcd(i,j);
		dict.insert(((long long)(i/g)<<32)|(j/g));
	}
	printf("%d\n",dict.size()+2); // 2: x=0 and y=0
}