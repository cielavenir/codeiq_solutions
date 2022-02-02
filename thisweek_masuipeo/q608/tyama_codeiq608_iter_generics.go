//usr/bin/env go run $0 $@;exit
package main
import "constraints"
import "fmt"

func reverse[T any](a []T,start int,size int){
	for end:=start+size-1;start<end;start++ {
		z:=a[start]
		a[start]=a[end]
		a[end]=z
		end--
	}
}
func permutation[T constraints.Ordered](x []T, n int) <- chan []T{
	ch := make(chan []T)
	go func(){
		if 0<=n&&n<=len(x) {
			a:=make([]T,n)
			for i:=0;i<n;i++ {a[i]=x[i]}
			for {
				{
					b:=make([]T,n)
					for i:=0;i<n;i++ {b[i]=a[i]}
					ch <- b
				}
				reverse(a,n,len(a)-n)
				i:=0
				for i=len(a)-2;i>=0;i-- {if a[i]<a[i+1] {break}}
				if i<0 {
					//reverse(a,0,len(a))
					break
				}
				k:=i
				for i=len(a)-1;i>=k+1;i-- {if a[k]<a[i] {break}}
				l:=i
				z:=a[k]
				a[k]=a[l]
				a[l]=z
				reverse(a,k+1,len(a)-(k+1))
			}
		}
		close(ch)
	}()
	return ch
}

func main(){
	N:=6
	e0:=make([]int,N*2)
	f0:=make([]int,N*2)
	i:=0
	r:=0
	for i=0;i<N;i++ {e0[N+i]=1;f0[N+i]=1}
	e:=make([]int,N*2+1);
	f:=make([]int,N*2+1);
	for _e:=range permutation[int](e0,len(e0)) {
		for i=0;i<N*2;i++ {e[i+1]=e[i]+_e[i]}
		for _f:=range permutation[int](f0,len(f0)) {
			for i=0;i<N*2;i++ {
				f[i+1]=f[i]+_f[i]
				if e[i]==f[i]&&e[i+1]==f[i+1] {break}
			}
			if i==N*2 {r++}
		}
	}
	fmt.Println(r)
}
