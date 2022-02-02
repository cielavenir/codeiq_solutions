//usr/bin/env go run $0 $@;exit
package main
import (
	"fmt"
	"sort"
)

type ordered interface {
	type int, int8, int16, int32, int64,
		uint, uint8, uint16, uint32, uint64, uintptr,
		float32, float64,
		string
}

func reverse[T any](a []T,start int,size int){
	for end:=start+size-1;start<end;start++ {
		z:=a[start]
		a[start]=a[end]
		a[end]=z
		end--
	}
}

func next_permutation[T ordered](a []T, n int) bool{
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
	for {
		for {
			flg:=0
			zero1:=0
			zero2:=N
			one1:=0
			one2:=N
			for i:=0;i<N*2;i++ {
				if e0[i]==0 {zero1 += 1}
				if e0[i]==1 {one1  += 1}
				if f0[i]==0 {zero2 -= 1}
				if f0[i]==1 {one2  -= 1}
				if zero1==zero2 {flg+=1}
				if one1==one2 {flg+=1}
			}
			if flg>=2 {r+=1}
			if !next_permutation[int](f0,len(f0)) {break}
		}
		if !next_permutation[int](e0,len(e0)) {break}
	}
	fmt.Println(r)
}
