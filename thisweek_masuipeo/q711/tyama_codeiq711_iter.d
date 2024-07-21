#!/usr/bin/rdmd
import std.stdio, std.algorithm, std.concurrency;
const int N=6;
void my_reverse(T)(T[] a,int start,int size){
	int end=start+size-1;
	for(;start<end;start++){
		T z=a[start];a[start]=a[end];a[end]=z;
		end--;
	}
}
auto unique_permutation(T)(T[] a0,int n){
	return new Generator!(T[])({
		int siz=cast(int)a0.length;
		if(n<0||siz<n)return;
		T[] a=new T[a0.length];
		a[]=a0[];
		a.sort();
		int i;
		for(;;){
			yield(a[0..n]);
			my_reverse(a,n,siz-n);
			for(i=cast(int)siz-2;i>=0;i--)if(a[i]<a[i+1])break;
			if(i<0){
				//my_reverse(a,0,siz);
				return;
			}
			int k=i;
			for(i=cast(int)siz-1;i>=k+1;i--)if(a[k]<a[i])break;
			int l=i;
			T z=a[k];a[k]=a[l];a[l]=z;
			my_reverse(a,k+1,siz-(k+1));
		}
	});
}
auto unique_permutation(T)(T[] a){
	return unique_permutation(a,cast(int)a.length);
}
int main(){
	int r=0,i;
	int[] e0=new int[N*2],f0=new int[N*2];
	for(i=0;i<N;i++)e0[N+i]=f0[N+i]=1;
	foreach(e_; unique_permutation(e0)){
		foreach(f_; unique_permutation(f0)){
			int flg=0;
			int zero1=0;
			int zero2=N;
			int one1=0;
			int one2=N;
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
	writeln(r);
	return 0;
}
