#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){
	char buf[99];
	int i=1,f=1;
	for(;i<=1000;i++){
		sprintf(buf,"%d",i*i);
		int idx=strlen(buf)/2;
		int n=strtol(buf+idx,NULL,10);
		buf[idx]=0;
		n+=strtol(buf,NULL,10);
		if(i==n){
			if(!f)putchar(',');
			f=0;
			printf("%d",i);
		}
	}
	puts("");
}