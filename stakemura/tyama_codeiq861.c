// CodeIQ 'fast exp' test code
#include <stdio.h>
#include <assert.h>
double fast_exp(double x){
	//taylor
	double r=1,t=1;
	long long d=1;
	for(int i=1;i<21;i++){
		t*=x;
		d*=i;
		r+=t/d;
	}
	return r;
}
//include math.h here
#include <math.h>
int main(){
	printf("%15s %15s %15s %15s\n", "x", "exp", "fast_exp", "rel.error");
	double t = -2;
	while(t <= 5){
		double x = (double) t;
		double ev = exp(x);
		double approx = fast_exp(x);
		double abserr = fabs(approx - ev);
		double relerr = fabs(approx - ev) / ev;
		printf("%15.6f %15.6f %15.6f %15.6f\n", x, ev, approx, relerr);
		//assert(relerr < 0.1);
		t += 1;
	}
	return 0;
}

/*
C
テイラー展開を21項目まで行うことで、-2<=t<=15の範囲でrel.errorが0.1未満にできました。
しかも計算量はO(項数)です。

              x             exp        fast_exp       rel.error
      -2.000000        0.135335        0.135335        0.000000
      -1.000000        0.367879        0.367879        0.000000
       0.000000        1.000000        1.000000        0.000000
       1.000000        2.718282        2.718282        0.000000
       2.000000        7.389056        7.389056        0.000000
       3.000000       20.085537       20.085537        0.000000
       4.000000       54.598150       54.598150        0.000000
       5.000000      148.413159      148.413147        0.000000
*/