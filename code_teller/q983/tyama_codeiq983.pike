#!/usr/bin/pike
int main(int argc, array(string) argv){
	int starting=5;
	int bse=10;
	for(;;){
		string s=Stdio.stdin.gets();
		if(!s)break;
		int n;
		sscanf(s,"%d",n);
		n+=starting-2;
		int digits=1;
		int expbase=1;
		int x;
		for(;(x=digits*expbase*(bse-1))<=n;n-=x){
			digits++;
			expbase*=bse;
		}
		int num=expbase+n/digits;
		int d=digits-1-n%digits;
		for(;d--;)num/=bse;
		Stdio.stdout.write("%d\n",num%bse);
	}
}