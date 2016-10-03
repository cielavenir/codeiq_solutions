#!/usr/bin/env rdmd
import core.stdc.stdio,std.range;

int N=10;
int F[]=[3,5,7,11,13,17,19,23,29,31];
long solve(long ma){
	long r=0L;
	foreach(i;iota(1,1<<N)){
		int n=0;
		long divisor=1L;
		for(int j=0;j<N;j++)if(i&(1<<j)){n++;divisor*=F[j];}
		long items=ma/divisor;
		r+=(n%2*2-1)*items*(items+1)*divisor/2;
	}
	return r;
}
void main(){
	printf("%lld\n",solve(100000));
	printf("%lld\n",solve(1000000000));
}
