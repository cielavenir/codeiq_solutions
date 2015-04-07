#include <stdio.h>
#define SIZ 1000
#define min(a,b) ((a)<(b)?(a):(b))
char A[SIZ][SIZ+1],*T="WN";
int m[SIZ][SIZ];
int main(){
	int i,j,k,x,y,r,M=0,t=0,z;
	for(y=0;~scanf("%s",A[y]);y++);
	x=y;
	for(;t<2;t++){
		for(j=0;j<y;j++)for(r=i=0;i<x;m[j][i]=r,i++)r=A[j][i]==T[t]?r+1:0;
		for(r=i=0;i<x;i++)for(j=0;j<y;j++)for(M=SIZ,k=j;k<y;k++){
			if(M>m[k][i])M=m[k][i];
			int z=k-j+1;
			if(r<min(M,z))r=min(M,z);
		}
		printf("%c: %d\n",T[t],r);
	}
	return 0;
}
//AOJ0116を改造(M*z -> min(M,z))。
//もともと長方形用なのでO(n^3)だが、Cでカリカリにチューニングすれば1000x1000ぐらいはなんとかなる。