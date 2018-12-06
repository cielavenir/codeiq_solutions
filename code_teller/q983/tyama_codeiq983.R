#!/usr/bin/env Rscript
starting=5
bse=10
z=scan("stdin")
l=length(z)
for(i in 1:l){
	n=z[i]+starting-2
	digits=1
	expbase=1
	x=bse-1
	while(x<=n){
		n=n-x
		digits=digits+1
		expbase=expbase*bse
		x=digits*expbase*(bse-1)
	}
	num=expbase+n%/%digits
	d=digits-1-n%%digits
	while(d>0){
		num=num%/%bse
		d=d-1
	}
	cat(num%%bse)
	cat("\n")
}