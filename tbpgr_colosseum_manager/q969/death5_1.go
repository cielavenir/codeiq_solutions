package main
import "fmt"
func main(){
for i:=1;i<51;i++ { if i%15>0 { if i%5>0 { if i%3>0 { fmt.Print(i) } else { fmt.Print("fizz") } } else { fmt.Print("buzz") } } else { fmt.Print("FIZZBUZZ") } }
}