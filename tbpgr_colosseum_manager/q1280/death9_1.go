package main
import "fmt"
func main(){
for i:=0;i<208;i++{fmt.Print(string(97+i%26-(8-i%8)/8*32))}
}