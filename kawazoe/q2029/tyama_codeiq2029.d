#!/usr/bin/rdmd
import std.c.stdio;
void main(){
	long n;
	for(;~scanf("%lld",&n)&&n;){
		long r=0;
		int i=2;
		for(;;i++){
			long x=n-cast(long)i*(i-1)/2;
			if(x<i)break;
			if(x%i==0)r+=x/i;
		}
		printf("%lld\n",r);
	}
}