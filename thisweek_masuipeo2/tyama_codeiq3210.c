#include <stdio.h>
long long dfs(long long f,int c,int d,int t){
	if(c==t-1){
		return __builtin_popcountll(f)==t;
	}
	long long r=0;
	for(int i=1;0<=c+d*i&&c+d*i<t;i++){
		if((f&(1<<(c+d*i)))==0){
			r+=dfs(f|(1<<(c+d*i)),c+d*i,-d,t);
		}
	}
	return r;
}
int main(){
	int N;
	scanf("%d",&N);
	printf("%lld\n",dfs(1,0,1,N));
}
