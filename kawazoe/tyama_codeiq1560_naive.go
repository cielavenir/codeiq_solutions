//usr/bin/env go run $0 $@;exit
package main
import (
	"fmt"
	"runtime"
)

func solve(ma int64) int64{
	N:=10
	F:=[]int{3,5,7,11,13,17,19,23,29,31}
	ch := make(chan int64)
	threads:=runtime.NumCPU()
	//runtime.GOMAXPROCS(threads)
	f:=func(start int){
		r:=int64(0)
		for i:=int64(start);i<ma;i+=int64(threads) {
			j:=0
			for ;j<N;j++ {if i%int64(F[j])==0 {break}}
			if j<N {r+=i}
		}
		ch <- r
	}

	for start:=0;start<threads;start++ {
		go f(start)
	}
	//f(0) // avoid context switch //!?
	r:=int64(0)
	for start:=0;start<threads;start++ {
		r+=<-ch
	}
	return r
}
func main(){
	fmt.Println(solve(100000))
	fmt.Println(solve(1000000000))
}
