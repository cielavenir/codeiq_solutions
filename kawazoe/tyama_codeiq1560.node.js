#!/usr/bin/env node

var N=10;
var F=[3,5,7,11,13,17,19,23,29,31];
var solve=function(ma){
	var i=1,j,n;
	var r=0;
	for(;i<1<<N;i++){
		var n=0;
		var divisor=1;
		for(n=j=0;j<N;j++)if(i&(1<<j))n++,divisor*=F[j];
		var items=ma/divisor^0;
		r+=((n%2*2-1)*(items*(items+1)/2)*divisor);
	}
	return r;
}
console.log(solve(100000));
console.log(solve(1000000000));