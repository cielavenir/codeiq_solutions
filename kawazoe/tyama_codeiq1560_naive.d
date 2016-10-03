#!/usr/bin/env rdmd
import core.stdc.stdio,core.atomic;
import std.range,std.parallelism;

int N=10;
int F[]=[3,5,7,11,13,17,19,23,29,31];
long solve(long ma){
	shared auto r=0L;
	foreach(i;parallel(iota(ma))){
		int j=0;
		for(;j<N;j++)if(i%F[j]==0)break;
		if(j<N)r.atomicOp!"+="(i);
	}
	return r;
}
void main(){
	printf("%lld\n",solve(100000));
	printf("%lld\n",solve(1000000000));
}
