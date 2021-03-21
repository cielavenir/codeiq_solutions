//usr/bin/env v run $0 $@;exit

//iter version cannot be implemented as "range ch" is missing.

fn reverse<T>(mut a []T,start_ int,size int){
	mut start:=start_
	for end:=start+size-1;start<end;start++ {
		z:=a[start]
		a[start]=a[end]
		a[end]=z
		end--
	}
}

fn next_permutation<T>(mut a []T, n int) bool{
	if n<0||a.len<n {return false}
	// "int" cannot be "T": https://github.com/vlang/v/issues/6222
	reverse<int>(mut a,n,a.len-n)
	mut i:=0
	for i=a.len-2;i>=0;i-- {if a[i]<a[i+1] {break}}
	if i<0 {
		reverse<T>(mut a,0,a.len)
		return false
	}
	k:=i
	for i=a.len-1;i>=k+1;i-- {if a[k]<a[i] {break}}
	l:=i
	z:=a[k]
	a[k]=a[l]
	a[l]=z
	reverse<T>(mut a,k+1,a.len-(k+1))
	return true
}

fn main(){
	n:=6
	mut e0:=[0].repeat(n*2)
	mut f0:=[0].repeat(n*2)
	mut i:=0
	mut r:=0
	for i=0;i<n;i++ {
		e0[n+i]=1
		f0[n+i]=1
	}
	e0.sort()
	f0.sort()
	mut e:=[0].repeat(n*2+1)
	mut f:=[0].repeat(n*2+1)
	for {
		for i=0;i<n*2;i++ {e[i+1]=e[i]+e0[i]}
		for {
			for i=0;i<n*2;i++ {
				f[i+1]=f[i]+f0[i]
				if e[i]==f[i] && e[i+1]==f[i+1] {break}
			}
			if i==n*2 {r++}
			if !next_permutation<int>(mut f0,f0.len) {break}
		}
		if !next_permutation<int>(mut e0,e0.len) {break}
	}
	println(r)
}
