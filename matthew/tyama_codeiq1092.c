#include <stdio.h>
#define M 500
int t[M+1];
int main(){
	int i,j,f=0;
	t[0]=t[1]=1;
	for(i=2;i<=M;i++)if(!t[i])for(j=i*2;j<=M;j+=i)t[j]=1;
	for(i=2;i<=M-6;i++)if(!t[i]&&!t[i+6]){
		if(f)printf(", ");
		f=1;
		printf("(%d,%d)",i,i+6);
	}
	puts("");
}