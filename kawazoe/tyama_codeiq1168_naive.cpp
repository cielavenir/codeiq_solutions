#include <iostream>
#include <cstdlib>
using namespace std;
int main(int argc,char **argv){
	const int ma=strtol(argv[1],NULL,10);
	long long r=0,cur=0;
	long long nxt=0;
	for(int i=2;i<=ma;i++){
		int x=i;
		for(nxt=0;!(x&1);x>>=1)nxt++;
		cur+=nxt;
		r+=cur;
	}
	cout<<r<<endl;
}