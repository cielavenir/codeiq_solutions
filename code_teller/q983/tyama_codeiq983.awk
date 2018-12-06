#!/usr/bin/awk -f
{
	starting=5
	bse=10
	n=$1
	n+=starting-2
	digits=1
	expbase=1
	for(;(x=digits*expbase*(bse-1))<=n;n-=x){
		digits=digits+1
		expbase=expbase*bse
	}
	num=expbase+int(n/digits)
	d=digits-1-n%digits
	for(;d>0;num=int(num/bse))d=d-1
	print num%bse
}
