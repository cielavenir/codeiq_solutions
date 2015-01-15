#include <stdio.h>
#define N 30
//0=female,1=male
int dfs(int d,int prev){
	if(d==N)return 1;
	int i=prev==0,r=0;
	for(;i<2;i++)r+=dfs(d+1,i);
	return r;
}

int main(){
	printf("%d\n",dfs(0,1));
	return 0;
}