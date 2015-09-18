#!/usr/bin/env groovy
Scanner cin=new Scanner(System.in)
while(cin.hasNext()){
	long n=cin.nextLong()
	if(n==0)break
	long r=0
	long i=2
	for(;;i++){
		long x=n-(i*(i-1)).intdiv(2)
		if(x<i)break
		if(x%i==0)r+=x.intdiv(i)
	}
	println r
}