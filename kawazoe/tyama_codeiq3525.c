#include <stdio.h>
int gcd(int x,int y){return y?gcd(y,x%y):x;}
int main(){
	int n,k,l;
	long long r=0;
	scanf("%d%d",&n,&k);l=(n+k-1)/k;
#if 0
	for(int i=1;i<=n;i++)r+=(long long)i/gcd(k,i);
#else
	//memo: (1..k).all?{|i|k.gcd(i)==k.gcd(i+k)}
	//列ごとにまとめて処理が可能
	for(int i=1;i<=k;i++){
		long long q=~-i%k<=~-n%k?l:l-1; //項数
		r+=q*(i*2+(q-1)*k)/2/gcd(k,i);
	}
#endif
	printf("%lld\n",r);
}
