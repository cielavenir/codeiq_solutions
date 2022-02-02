//usr/bin/env go run $0 $@;exit
package main
import (
	"constraints"
	"fmt"
	"sort"
)

func reverse[T any](a []T,start int,size int){
	for end:=start+size-1;start<end;start++ {
		z:=a[start]
		a[start]=a[end]
		a[end]=z
		end--
	}
}

func next_permutation[T constraints.Ordered](a []T, n int) bool{
	if n<0||len(a)<n {return false}
	reverse(a,n,len(a)-n)
	i:=0
	for i=len(a)-2;i>=0;i-- {if a[i]<a[i+1] {break}}
	if i<0 {
		reverse(a,0,len(a))
		return false
	}
	k:=i
	for i=len(a)-1;i>=k+1;i-- {if a[k]<a[i] {break}}
	l:=i
	z:=a[k]
	a[k]=a[l]
	a[l]=z
	reverse(a,k+1,len(a)-(k+1))
	return true
}

func main(){
	N:=6
	e0:=make([]int,N*2)
	f0:=make([]int,N*2)
	i:=0
	r:=0
	for i=0;i<N;i++ {e0[N+i]=1;f0[N+i]=1}
	sort.Ints(e0)
	sort.Ints(f0)
	e:=make([]int,N*2+1);
	f:=make([]int,N*2+1);
	for {
		for i=0;i<N*2;i++ {e[i+1]=e[i]+e0[i]}
		for {
			for i=0;i<N*2;i++ {
				f[i+1]=f[i]+f0[i]
				if e[i]==f[i]&&e[i+1]==f[i+1] {break}
			}
			if i==N*2 {r++}
			if !next_permutation[int](f0,len(f0)) {break}
		}
		if !next_permutation[int](e0,len(e0)) {break}
	}
	fmt.Println(r)
}
