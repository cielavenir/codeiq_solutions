package main
import "fmt"
func main(){
fmt.Print(2)
for i:=3;i<999;i++{for j:=2;i%j>0;j++{if j+1==i{fmt.Printf(":%d",i)}}}
}