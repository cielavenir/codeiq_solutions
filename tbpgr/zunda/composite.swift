//usr/bin/env swift $0 $@;exit
func isqrt(_ n: Int) -> Int {
	if n<=0 {return 0}
	if n<4 {return 1}
	var x=0
	var y=n
	while x != y && x+1 != y {x=y;y=(n/y+y)/2}
	return x
}

func isPrime(_ i: Int) -> Bool {
	if i<2 {
		return false
	}
	for j in 2...isqrt(i) {
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
