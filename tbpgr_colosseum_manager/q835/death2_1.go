package main
import "fmt"
func main(){
x:=[]int{97,65,12354,12450,12450,12354,65,97}
z:=make([]rune,1)
for i:=0;i<26;i++{for j:=0;j<8;j++{z[0]=rune(x[j]+i);fmt.Print(string(z))}}
}