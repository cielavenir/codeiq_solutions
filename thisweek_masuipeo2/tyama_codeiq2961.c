#include <stdio.h>
#include <stdlib.h>

int a[]={2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59};
int main(){
	int r=0,m,n,i=0,j=0,k=1,i0,j0;
	scanf("%d%d",&m,&n);
	for(;a[j]<=m;j++);
	for(;i<j;i++)k*=3;
	for(i=0;i<k;i++){
		int x=0,y=0;
		for(i0=i,j0=0;j0<j;j0++){
			if(i0%3==0)x+=a[j0];
			if(i0%3==1)y+=a[j0];
			i0/=3;
		}
		if(abs(x-y)==n)r++;
	}
	printf("%d\n",r/2);
}