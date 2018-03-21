#include <stdio.h>
long long dec2hex(long long n){
	return n==0 ? 0 : dec2hex(n/10)*16+n%10;
}
int main(){
	long long i=1;
	int c=0;
	for(;c<100;i++){
		if(dec2hex(i)%i==0){
			printf("%lld\n",i);
			c++;
		}
	}
	return 0;
}