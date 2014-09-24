package main
import (
	"fmt"
)

func infinite_product_process(arr [][]int, result []int,cnt int,d int) <-chan []int {
	ch:=make(chan []int)
	go func(){
		if d==len(arr)-1 {
			if 0<=cnt&&cnt<len(arr[d]){
				ch <- append(result,arr[d][cnt])
			}
		} else {
			l:=len(arr[d])
			if l>cnt+1 {l=cnt+1}
			for i:=0;i<l;i++ {
				for e:=range infinite_product_process(arr,append(result,arr[d][i]),cnt-i,d+1) {
					ch <- e
				}
			}
		}
		close(ch)
	}()
	return ch
}

func infinite_product(enums []<-chan int) <-chan []int {
	ch:=make(chan []int)
	go func(){
		flags:=make([]bool,len(enums))
		for i:=0;i<len(enums);i++ {flags[i]=true}
		arr:=make([][]int,len(enums))
		for i:=0;i<len(enums);i++ {arr[i]=make([]int,0)}
		cnt:=0
		iter_end:=false
		for !iter_end {
			iter_end=true
			for i:=0;i<len(enums);i++ {
				v:=0
				if flags[i] {v,flags[i]=<-enums[i]}
				if flags[i] {arr[i]=append(arr[i],v)}
			}
			for e:=range infinite_product_process(arr,make([]int,0),cnt,0) {
				iter_end=false
				ch<-e
			}
			cnt+=1
		}
		close(ch)
	}()
	return ch
}

//test code
func primes() <-chan int {
	ch:=make(chan int)
	go func(){
		for i:=2;;i++ {
			j:=2
			for ;i%j>0;j++ {}
			if j==i {ch<-i}
		}
		//close(ch)
	}()
	return ch
}

func nats() <-chan int {
	ch:=make(chan int)
	go func(){
		for i:=1;;i++ {ch<-i}
		//close(ch)
	}()
	return ch
}

func fib() <-chan int {
	ch:=make(chan int)
	go func(){
		a:=0
		b:=1
		for {
			ch<-b
			c:=a+b
			a=b
			b=c
		}
		//close(ch)
	}()
	return ch
}

func elems(a []int) <-chan int {
	ch:=make(chan int)
	go func(){
		for _,a:=range a {ch<-a}
		close(ch)
	}()
	return ch
}

func compare(a [][]int,b [][]int) bool {
	if len(a)!=len(b) {return false}
	for i:=0;i<len(a);i++ {
		if len(a[i])!=len(b[i]) {return false}
		for j:=0;j<len(a[i]);j++ {
			if a[i][j]!=b[i][j] {return false}
		}
	}
	return true
}

func main(){
	ok:=true
	{
		expected:=[][]int{
			[]int{1},[]int{1},[]int{2},[]int{3},[]int{5},[]int{8},[]int{13},[]int{21},[]int{34},[]int{55},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			fib(),
		}){
			result=append(result,e)
			i+=1
			if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_fib failed")}
	}
	{
		expected:=[][]int{
			[]int{1,1},
			[]int{1,1},[]int{2,1},
			[]int{1,2},[]int{2,1},[]int{3,1},
			[]int{1,3},[]int{2,2},[]int{3,1},[]int{4,1},
			[]int{1,5},[]int{2,3},[]int{3,2},[]int{4,1},[]int{5,1},
			[]int{1,8},[]int{2,5},[]int{3,3},[]int{4,2},[]int{5,1},[]int{6,1},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			nats(),
			fib(),
		}){
			result=append(result,e)
			i+=1
			if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_nats_fib failed")}
	}
	{
		expected:=[][]int{
			[]int{2,1,1},
			[]int{2,1,1},[]int{2,2,1},
			[]int{3,1,1},
			[]int{2,1,2},[]int{2,2,1},[]int{2,3,1},
			[]int{3,1,1},[]int{3,2,1},
			[]int{5,1,1},
			[]int{2,1,3},[]int{2,2,2},[]int{2,3,1},[]int{2,4,1},
			[]int{3,1,2},[]int{3,2,1},[]int{3,3,1},
			[]int{5,1,1},[]int{5,2,1},
			[]int{7,1,1},
			[]int{2,1,5},[]int{2,2,3},[]int{2,3,2},[]int{2,4,1},[]int{2,5,1},
			[]int{3,1,3},[]int{3,2,2},[]int{3,3,1},[]int{3,4,1},
			[]int{5,1,2},[]int{5,2,1},[]int{5,3,1},
			[]int{7,1,1},[]int{7,2,1},
			[]int{11,1,1},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			primes(),
			nats(),
			fib(),
		}){
			result=append(result,e)
			i+=1
			if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_primes_nats_fib failed")}
	}
	{
		expected:=[][]int{
			[]int{1,1},
			[]int{1,2},[]int{2,1},
			[]int{1,3},[]int{2,2},[]int{3,1},
			[]int{2,3},[]int{3,2},[]int{4,1},
			[]int{3,3},[]int{4,2},[]int{5,1},
			[]int{4,3},[]int{5,2},[]int{6,1},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			nats(),
			elems([]int{1,2,3}),
		}){
			result=append(result,e)
			i+=1
			if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_nats_1_3 failed")}
	}
	{
		expected:=[][]int{
			[]int{1,1},
			[]int{1,2},[]int{2,1},
			[]int{1,3},[]int{2,2},[]int{3,1},
			[]int{1,4},[]int{2,3},[]int{3,2},
			[]int{1,5},[]int{2,4},[]int{3,3},
			[]int{1,6},[]int{2,5},[]int{3,4},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			elems([]int{1,2,3}),
			nats(),
		}){
			result=append(result,e)
			i+=1
			if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_1_3_nats failed")}
	}
	{
		expected:=[][]int{
			[]int{1,1,1},
			[]int{1,1,2},[]int{1,2,1},[]int{2,1,1},
			[]int{1,2,2},[]int{2,1,2},[]int{2,2,1},
			[]int{2,2,2},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			elems([]int{1,2}),
			elems([]int{1,2}),
			elems([]int{1,2}),
		}){
			result=append(result,e)
			i+=1
			//if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_1_2_x3 failed")}
	}
	{
		expected:=[][]int{
			[]int{1,1,1,1},
			[]int{1,1,1,2},[]int{1,1,2,1},[]int{1,2,1,1},[]int{2,1,1,1},
			[]int{1,1,2,2},[]int{1,2,1,2},[]int{1,2,2,1},[]int{2,1,1,2},[]int{2,1,2,1},[]int{2,2,1,1},
			[]int{1,2,2,2},[]int{2,1,2,2},[]int{2,2,1,2},[]int{2,2,2,1},
			[]int{2,2,2,2},
		}
		result:=make([][]int,0,len(expected))
		i:=0
		for e:=range infinite_product([]<-chan int{
			elems([]int{1,2}),
			elems([]int{1,2}),
			elems([]int{1,2}),
			elems([]int{1,2}),
		}){
			result=append(result,e)
			i+=1
			//if i==len(expected) {break}
		}
		if !compare(expected,result) {ok=false;fmt.Println("test_product_1_2_x4 failed")}
	}
	if ok {fmt.Println("all tests done")}
}