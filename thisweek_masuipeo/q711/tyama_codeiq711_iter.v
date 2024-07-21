//usr/bin/env v run $0 $@;exit

fn reverse<T>(mut a []T,start_ int,size int){
	mut start:=start_
	for end:=start+size-1;start<end;start++ {
		z:=a[start]
		a[start]=a[end]
		a[end]=z
		end--
	}
}
fn permutation_impl<T>(ch chan []T, x []T, n int){
	if 0<=n && n<=x.len {
		mut a:=[]T{len: x.len}
		for i:=0;i<n;i++ {a[i]=x[i]}
		for {
			{
				mut b:=[]T{len: x.len}
				for i:=0;i<n;i++ {b[i]=a[i]}
				ch <- b
			}
			reverse<T>(mut a,n,a.len-n)
			mut i:=0
			for i=a.len-2;i>=0;i-- {if a[i]<a[i+1] {break}}
			if i<0 {
				//reverse<T>(mut a,0,a.len)
				break
			}
			k:=i
			for i=a.len-1;i>=k+1;i-- {if a[k]<a[i] {break}}
			l:=i
			z:=a[k]
			a[k]=a[l]
			a[l]=z
			reverse<T>(mut a,k+1,a.len-(k+1))
		}
	}
	ch.close()
}
fn permutation<T>(x []T, n int) chan []T{
	ch := chan []T{}
	go permutation_impl<T>(ch, x, n)
	return ch
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
	e_c := permutation<int>(e0,e0.len)
	for {
		e_ := <-e_c or {break}
		f_c := permutation<int>(f0,f0.len)
		for {
			f_ := <-f_c or {break}
			mut flg:=0
			mut zero1:=0
			mut zero2:=n
			mut one1:=0
			mut one2:=n
			for i=0;i<n*2;i++ {
				if e_[i]==0 {zero1 ++}
				if e_[i]==1 {one1  ++}
				if f_[i]==0 {zero2 --}
				if f_[i]==1 {one2  --}
				if zero1==zero2 {flg++}
				if one1==one2 {flg++}
			}
			if flg>=2 {r++}
		}
	}
	println(r)
}
