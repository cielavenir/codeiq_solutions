#!/usr/bin/env Rscript
z=scan("stdin")
l=length(z)
for(j in 1:l)if(z[j]>0){
	n=z[j]
	r=0
	i=2
	while(1){
		x=n-(i*(i-1))%/%2
		if(x<i)break
		if(x%%i==0)r=r+x%/%i
		i=i+1
	}
	cat(sprintf("%.0f",r))
	cat("\n")
}