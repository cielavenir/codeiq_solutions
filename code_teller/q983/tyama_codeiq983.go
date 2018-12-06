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
	var starting,bse,n,digits,expbase,x,num int64
	starting=5
	bse=10
	for {
		n=scanint()
		if n==-1 {break}
		n+=starting-2
		digits=1
		expbase=1
		x=bse-1
		for x<=n {
			n-=x
			digits+=1
			expbase*=bse
			x=digits*expbase*(bse-1)
		}
		num=expbase+n/digits
		d:=digits-1-n%digits
		for ;d>0;d-- {
			num/=bse
		}
		fmt.Println(num%bse)
	}
}