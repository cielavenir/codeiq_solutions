#!/usr/bin/env groovy
starting=5
bse=10
Scanner cin=new Scanner(System.in)
//System.in.eachLine(){
//	long n=it.toLong()
while(cin.hasNext()){
	long n=cin.nextLong()
	n+=starting-2
	long digits=1
	long expbase=1
	while((x=digits*expbase*(bse-1))<=n){
		n-=x
		digits+=1
		expbase*=bse
	}
	num=expbase+n.intdiv(digits)
	d=digits-1-n%digits
	d.times{
		num=num.intdiv(bse)
	}
	println num%bse
}