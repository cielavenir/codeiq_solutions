#!/usr/bin/vala
static void main(){
	for(;;){
		int64 n;
		if(stdin.scanf("%"+int64.FORMAT_MODIFIER+"d",out n)<0)break;
		if(n==0)break;
		int64 r=0;
		int i=2;
		for(;;i++){
			int64 x=n-(int64)i*(i-1)/2;
			if(x<i)break;
			if(x%i==0){
				r+=x/i;
			}
		}
		stdout.printf("%"+int64.FORMAT_MODIFIER+"d\n",r);
	}
}