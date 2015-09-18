#!/usr/bin/awk -f
{
	n=$1
	if(n>0){
		r=0
		for(i=2;;i++){
			x=n-i*(i-1)/2
			if(x<i)break
			if(x%i==0){
				r+=x/i
			}
		}
		print r
	}
}