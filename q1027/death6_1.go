package main
import "fmt"
func main(){
j:=2
for i:=2;i<999;i++{for j=2;i%j>0;j++{};if j==i{fmt.Printf(":%d"[i/(i-1)-1:],i)}}
}