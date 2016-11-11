#include <stdio.h>
unsigned char popcnt8(unsigned char n){
	const unsigned char m1=0x55;
	const unsigned char m2=0x33;
	const unsigned char m4=0x0f;
	n=((n>>1)&m1)+(n&m1);
	n=((n>>2)&m2)+(n&m2);
	n=((n>>4)&m4)+(n&m4);
	return n;
}
unsigned char clz8(unsigned char n){
	n|=n>>1;
	n|=n>>2;
	n|=n>>4;
	return 8-popcnt8(n);
}
void rec(unsigned char *s,char *t,int tl,int tn){
	//if(!*s)return;
	int n=clz8(~*s);
	if(!n)n=1; // sの1文字目の文字数
	fwrite(s,1,n,stdout);
	if(s[n]){
		int i=0;
		for(;i<tn;i++)fwrite(t,1,tl,stdout);
		rec(s+n,t,tl,tn);
	}
}
int main(){
	char s[768],*t;
	fgets(s,768,stdin);
	int i=0,j=0,n;
	for(;s[i];i++)if(s[i]==',')break;
	s[i]=0;
	for(t=s+i+1;t[j];j++)if(t[j]==',')break;
	t[j]=0;
	sscanf(t+j+1,"%d",&n);
	rec((unsigned char*)s,t,j,n);
	puts("");
	return 0;
}