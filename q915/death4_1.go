package main
import "fmt"
func main(){
for J:=1;J<9;J++{for I:=36;I<117;I+=J*2{fmt.Print(string(I))}}
}