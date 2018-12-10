//usr/bin/env swift $0 $@;exit
func isPrime(_ i: Int) -> Bool {
	for j in 2..<i {
		if i%j<1 {
			return false
		}
	}
	return true
}
var n=Int(readLine()!)!
var i=4
var s=0
var cnt=0
while cnt<n {
	if !isPrime(i) {
		s+=i
		cnt+=1
	}
	i+=1
}
print(s)
