#!/usr/bin/node
var reverse=function(a,start,size){
	var end=start+size-1;
	for(;start<end;start++){
		var z=a[start];a[start]=a[end];a[end]=z;
		end--;
	}
}
var next_permutation=function(a,_n){
	var n=_n || a.length;
	if(n<0||a.length<n)return false;
	var i;
	reverse(a,n,a.length-n);
	for(i=a.length-2;i>=0;i--)if(a[i]<a[i+1])break;
	if(i<0){
		reverse(a,0,a.length);
		return false;
	}
	var k=i;
	for(i=a.length-1;i>=k+1;i--)if(a[k]<a[i])break;
	var l=i;
	var z=a[k];a[k]=a[l];a[l]=z;
	reverse(a,k+1,a.length-(k+1));
	return true;
}

var N=6;
var e0=[],f0=[],i,r=0;
for(i=0;i<N;i++){
	e0[i]=f0[i]=0;
	e0[N+i]=f0[N+i]=1;
}
do{
	do{
		var flg=0;
		var zero1=0;
		var zero2=N;
		var one1=0;
		var one2=N;
		for(i=0;i<N*2;i++){
			if(e0[i]==0)zero1++;
			if(e0[i]==1)one1++;
			if(f0[N*2-1-i]==0)zero2--;
			if(f0[N*2-1-i]==1)one2--;
			if(zero1==zero2)flg++;
			if(one1==one2)flg++;
		}
		if(flg>=2)r++;
	}while(next_permutation(f0));
}while(next_permutation(e0));
console.log(r);