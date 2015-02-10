#include <stdio.h>
#include <stdlib.h>
int gcd(int x,int y){return y?gcd(y,x%y):x;}
int main(){
	printf("%d\n",gcd(30,69));
	return 0;
}