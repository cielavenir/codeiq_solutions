/*
Code Teller [nthdigit]
input: standard input
output: standard output
*/

#include <stdio.h>
#include <stdlib.h>
//isatty
#if defined(WIN32) || (!defined(__GNUC__) && !defined(__clang__))
	#include <io.h>
#else
	#include <unistd.h>
#endif

int solve(long long n,long long starting,int base){
	n+=starting-2;
	long long digits=1;
	long long expbase=1;
	long long x;
	for(;(x=digits*expbase*(base-1))<=n;n-=x){
		digits++;
		expbase*=base;
	}
	//(digits)桁の数を並べた中のn桁目を求めれば良い
	long long num=expbase+n/digits;
	long long d=digits-1-n%digits;
	for(;d--;num/=base);
	return num%base;
}

int main(int argc,char **argv){
	long long starting=5;
	int base=10;
	if(isatty(fileno(stdin))){
		fprintf(stderr,"nthdigit [starting=%lld] [base=%d] [<nthdigit.txt]\n",starting,base);
	}

	if(argc>2)base=strtol(argv[2],NULL,10);
	if(argc>1)starting=strtoll(argv[1],NULL,base);

	long long n;
	for(;;){
		if(isatty(fileno(stdin)))printf("input> ");
		if(scanf("%lld",&n)<0)return 0;
		printf("%d\n",solve(n,starting,base));
	}
	return 0;
}

/*
C(C++互換)
gcc 4.2.1 (LLVM)

例えば1から999までは以下の様な区間に分割できる。
1 + 0〜8
10 + 0〜89
100 + 0〜899
各区間に含まれる数字の個数は9、180、2700となる。
これを1*1*9、2*10*9、3*100*9と表現する(digits*expbase*9)。
入力値が入る区間が決まったら、それより下の和を入力値から引き(nとする)、
(digits)桁の数を並べた中のn桁目を求めれば良い。

一応、solve()については10進数以外でも計算できるようにした。
*/
