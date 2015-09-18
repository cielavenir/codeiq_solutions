#!/usr/bin/pike
int main(int argc, array(string) argv){
	for(;;){
		string s=Stdio.stdin.gets();
		if(!s)break;
		int n;
		sscanf(s,"%d",n);
		if(n==0)break;
		int r=0;
		int i=2;
		for(;;i++){
			int x=n-i*(i-1)/2;
			if(x<i)break;
			if(x%i==0)r+=x/i;
		}
		Stdio.stdout.write("%d\n",r);
	}
}