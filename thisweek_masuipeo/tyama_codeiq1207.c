// note:invalid on ideone (incl. codeiq) due to 32bit environment.

#include <stdio.h>
int main(){
	__int128_t a=1,b;
	int i=1,c=0;
	for(;c<2014;i++){
		a^=a<<1;
		for(b=a;b;b>>=1)c+=(b&1)^1;
	}
	printf("%d\n",i);
	return 0;
}