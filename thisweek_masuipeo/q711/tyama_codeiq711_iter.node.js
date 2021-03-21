#!/usr/bin/node
var reverse=function(a,start,size){
	var end=start+size-1;
	for(;start<end;start++){
		var z=a[start];a[start]=a[end];a[end]=z;
		end--;
	}
}
var unique_permutation=function*(a0,_n){
	var n=_n || a0.length;
	if(n<0||a0.length<n)return;
	var a=a0.slice(0)
	for(;;){
		yield a.slice(0,n);
		var i;
		reverse(a,n,a.length-n);
		for(i=a.length-2;i>=0;i--)if(a[i]<a[i+1])break;
		if(i<0){
			//reverse(a,0,a.length);
			return;
		}
		var k=i;
		for(i=a.length-1;i>=k+1;i--)if(a[k]<a[i])break;
		var l=i;
		var z=a[k];a[k]=a[l];a[l]=z;
		reverse(a,k+1,a.length-(k+1));
	}
}

var N=6;
var e0=[],f0=[],i,r=0;
for(i=0;i<N;i++){
	e0[i]=f0[i]=0;
	e0[N+i]=f0[N+i]=1;
}
for(var e_ of unique_permutation(e0)){
	for(var f_ of unique_permutation(f0)){
		var flg=0;
		var zero1=0;
		var zero2=N;
		var one1=0;
		var one2=N;
		for(i=0;i<N*2;i++){
			if(e_[i]==0)zero1++;
			if(e_[i]==1)one1++;
			if(f_[N*2-1-i]==0)zero2--;
			if(f_[N*2-1-i]==1)one2--;
			if(zero1==zero2)flg++;
			if(one1==one2)flg++;
		}
		if(flg>=2)r++;
	}
}
console.log(r);
