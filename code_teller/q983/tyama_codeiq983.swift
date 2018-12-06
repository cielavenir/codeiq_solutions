//usr/bin/env swift $0 $@;exit
#if _runtime(_ObjC)
import Darwin
#else
import Glibc
#endif

let starting:Int64=5
let bse:Int64=10
var n:Int64=0
while true {
	if (0>withUnsafeMutablePointer(to:&n){withVaList([OpaquePointer(UnsafeMutableRawPointer($0))]){vscanf("%lld",$0)}}) {break}
	n+=starting-2
	var digits:Int64=1
	var expbase:Int64=1
	var x:Int64=bse-1
	while x<=n {
		digits+=1
		expbase*=bse
		n-=x
		x=digits*expbase*(bse-1)
	}
	var num=expbase+n/digits
	var d=digits-1-n%digits
	while d>0 {
		num/=bse
		d-=1
	}
	print(num%bse)
}
