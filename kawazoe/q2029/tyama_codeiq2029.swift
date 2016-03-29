//usr/bin/env swift $0 $@;exit
import CoreFoundation

var n:Int64=0
while true {
	if (0>withUnsafeMutablePointer(&n){withVaList([COpaquePointer($0)]){vscanf("%lld",$0)}}) {break}
	if n==0 {break}
	var r:Int64=0
	var i:Int64=2
	while true {
		let x:Int64=n-i*(i-1)/2
		if x<i {break}
		if x%i==0 {r+=x/i}
		i+=1
	}
	print(r)
}