//usr/bin/env go run $0 $@;exit
package main
import "fmt"

func solve(ma int64) int64{
	N:=10
	F:=[]int{3,5,7,11,13,17,19,23,29,31}
	r:=int64(0)
	for i:=int64(1);i<1<<uint(N);i++ {
		n:=0
		divisor:=int64(1)
		for j:=0;j<N;j++ {
			if (i>>uint(j)&1)==1 {n++;divisor*=int64(F[j])}
		}
		items:=ma/divisor
		r+=int64(n%2*2-1)*items*(items+1)*divisor/2
	}
	return r
}
func main(){
	fmt.Println(solve(100000))
	fmt.Println(solve(1000000000))
}
