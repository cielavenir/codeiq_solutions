//usr/bin/env swift $0 $@;exit
func isPrime(_ i: Int) -> Bool {
	for j in 2..<i {
		if i%j<1 {
			return false
		}
	}
	return true
}
func is4949(_ i: Int) -> Bool {
	if i<=0 { return false }
	if i%10==4||i%10==9 { return true }
	return is4949(i/10)
}
var n=Int(readLine()!)!
var i=2
var cnt=0
while cnt<n {
	if is4949(i)&&isPrime(i) {
		print(i,terminator:"")
		if cnt<n-1 {
			print(",",terminator:"")
		} else {
			print("")
		}
		cnt+=1
	}
	i+=1
}
