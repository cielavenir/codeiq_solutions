#include <stdio.h>
int M=128,Z=8,ptr[99],c,d,e,s,i,j;
int main(){
#if 1
	for(i=0;i*Z<M;i++)ptr[i]=i*Z;
	for(i=0;i<Z;i++)putchar('+');
	putchar('[');
	for(i=0;i*Z<M;i++)for(putchar('>'),j=0;j<i;j++)putchar('+');
	for(i=0;i*Z<M;i++)putchar('<');
	putchar('-'),putchar(']');
	for(e=-1;~(c=getchar());putchar('.')){
		if(s='>',d=c/Z-e,d<0)d=-d,s='<';
		for(i=0;i<d;i++)putchar(s);
		e=c/Z;
		if(s='+',d=c-ptr[c/Z],d<0)d=-d,s='-';
		for(i=0;i<d;i++)putchar(s);
		ptr[c/Z]=c;
	}
#else
	putchar('>');
	for(e=0;~(c=getchar());putchar('.')){
		if(s='+',d=c-e,d<0)d=-d,s='-';
		if(d/Z){
			putchar('<');
			for(i=0;i<d/Z;i++)putchar('+');
			putchar('['),putchar('>');
			for(i=0;i<Z;i++)putchar(s);
			putchar('<'),putchar('-'),putchar(']'),putchar('>');
		}
		for(i=0;i<d%Z;i++)putchar(s);
		e=c;
	}
#endif
	return 0;
}