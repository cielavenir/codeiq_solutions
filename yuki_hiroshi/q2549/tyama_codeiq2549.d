#!/usr/bin/env rdmd
import std.bigint,std.stdio;

void mul(ref BigInt a1,ref BigInt b1,ref BigInt c1,ref BigInt d1,BigInt a2,BigInt b2,BigInt c2,BigInt d2){
	BigInt a0,b0,c0,d0,t,u;
	t=a1*a2;
	u=b1*c2;
	a0=t+u;
	t=a1*b2;
	u=b1*d2;
	b0=t+u;
	t=c1*a2;
	u=d1*c2;
	c0=t+u;
	t=c1*b2;
	u=d1*d2;
	d0=t+u;

	a1=a0;
	b1=b0;
	c1=c0;
	d1=d0;
}

void main(){
	BigInt a1=1,b1=0,c1=0,d1=1,a2=1,b2=1,c2=1,d2=0;

	int N;
	scanf("%d",&N);
	N=(N+3)/2*2;
	for(;N;N>>=1){
		if(N&1)mul(a1,b1,c1,d1,a2,b2,c2,d2);
		mul(a2,b2,c2,d2,a2,b2,c2,d2);
	}
	writeln(c1-1);
}