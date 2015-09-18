//usr/bin/env go run $0 $@;exit
package main
import(
	"fmt"
	"os"
	"text/scanner"
	"strconv"
)

var sin scanner.Scanner
func scanint() int64{
	tok:=sin.Scan()
	if tok==scanner.EOF {return -1}
	ret,_ := strconv.ParseInt(sin.TokenText(),10,64)
	return ret
}

func main(){
	sin.Init(os.Stdin)
	var n,r,i,x int64
	for {
		n=scanint()
		if n<=0 {break}
		r=0
		i=2
		for {
			x=n-i*(i-1)/2
			if x<i {break}
			if x%i==0 {r+=x/i}
			i+=1
		}
		fmt.Println(r)
	}
}