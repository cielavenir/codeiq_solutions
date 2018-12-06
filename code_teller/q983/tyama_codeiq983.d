#!/usr/bin/rdmd
import std.cstream;
int main(){
	long starting=5;
	int bse=10;
	long n;
	for(;din.readf(&n);){
		if(!n)break; //lol?
		n+=starting-2;
		long digits=1;
		long expbase=1;
		long x;
		for(;(x=digits*expbase*(bse-1))<=n;n-=x){
			digits++;
			expbase*=bse;
		}
		long num=expbase+n/digits;
		long d=digits-1-n%digits;
		for(;d--;)num/=bse;
		dout.writefln("%d",num%bse);
	}
	return 0;
}