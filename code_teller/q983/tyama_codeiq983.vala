#!/usr/bin/vala
static void main(){
	int64 starting=5;
	int64 bse=10;
	for(;;){
		int64 n;
		int64 digits=1;
		int64 expbase=1;
		int64 x=bse-1;
		if(stdin.scanf("%"+int64.FORMAT_MODIFIER+"d",out n)<0)break;
		n+=starting-2;
		for(;x<=n;){
			digits++;
			expbase*=bse;
			n-=x;
			x=digits*expbase*(bse-1);
		}
		int64 num=expbase+n/digits;
		int64 d=digits-1-n%digits;
		for(;d-->0;)num/=bse;
		stdout.printf("%"+int64.FORMAT_MODIFIER+"d\n",num%bse);
	}
}