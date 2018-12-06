#!/usr/bin/rdmd
import std.stdio;
int main(){
	long starting=5;
	int bse=10;
	long n;
	for(;stdin.readf(" %d",&n);){
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
		stdout.writefln("%d",num%bse);
	}
	return 0;
}
