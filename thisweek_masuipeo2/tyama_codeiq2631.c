#include <stdio.h>

long long memo[20<<20]; //Nmax==19
long long dfs(int lst,int dir,int cur,int goal,int siz){
	if(cur==goal)return 1;
	int key=lst|(dir<<siz)|(cur<<(siz+1));
	if(memo[key])return memo[key];
	long long r=0;
	if(dir!=1){
		for(int i=0;i<cur&&i<=goal;i++)if(lst&(1<<i)){
			lst&=~(1<<i);
			r+=dfs(lst,dir^1,i,goal,siz);
			lst|=1<<i;
		}
	}else{
		for(int i=siz-1;i>cur&&i>=goal;i--)if(lst&(1<<i)){
			lst&=~(1<<i);
			r+=dfs(lst,dir^1,i,goal,siz);
			lst|=1<<i;
		}
	}
	return memo[key]=r;
}
int main(){
	int a,b,c;
	scanf("%d,%d,%d",&a,&b,&c);
	int lst=0;
	for(int i=0;i<a;i++)if(i!=b-1)lst|=1<<i;
	printf("%lld\n",dfs(lst,c-b>0,b-1,c-1,a));
}