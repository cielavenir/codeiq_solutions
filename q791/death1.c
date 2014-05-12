//compat with C++
#include <stdio.h>
#include <string.h>
int main(){
	char s[]="lds";
	int i=0;
	for(;i<3;i++)s[i]-=32;
	puts(s);
	return 0;
}