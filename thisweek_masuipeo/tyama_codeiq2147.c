#include <stdio.h>
int main(){
	int N,i,j=0,R=0,r,n;
	scanf("%d",&N);
	for(;j<1<<N;j++){
		n=j;
		r=0;
		for(;n;r++){
			i=N-1;
			for(;i>0;){
				if((n&(1<<i))&&!(n&(1<<(i-1)))){
					n=n&~(1<<i)|(1<<(i-1));
					i--;
				}
				i--;
			}
			if(i==0)n&=~1;
		}
		R+=r;
	}
	printf("%d\n",R);
	return 0;
}