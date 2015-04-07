// CodeIQ 'prevent overflow' test code
#include <stdio.h>
#include <math.h>
double calc_normally(double x, double y)
{
	return log(exp(x) + exp(y));
}
// Please rewrite log(exp(x) + exp(y)) to be able to prevent underflow
double calc_precisely(double x, double y)
{
	//x>=yとする。
	if(x<y){double t=x;x=y;y=t;}
	//exp(y)をexp(x)*( exp(y)/exp(x) )に変換する。後者をtをする。tの範囲はかならず(0,1]となる。
	double t=exp(y-x);
	//log(exp(x)*(1+t))を変形するとx+log(1+t)となる。
	return x+log(1+t);
}
int main(int argc, char* argv[])
{
	double x, y;
	x = 9.0; y = 11.0;
	printf("%15.6f %15.6f\n", calc_normally(x, y), calc_precisely(x, y));
	x = 99.1; y = 100.9;
	printf("%15.6f %15.6f\n", calc_normally(x, y), calc_precisely(x, y));
	x = 999.2; y = 1000.8;
	printf("%15.6f %15.6f\n", calc_normally(x, y), calc_precisely(x, y));
	x = 9999.3; y = 10000.7;
	printf("%15.6f %15.6f\n", calc_normally(x, y), calc_precisely(x, y));
	x = 99999.4; y = 100000.6;
	printf("%15.6f %15.6f\n", calc_normally(x, y), calc_precisely(x, y));
	return 0;
}
/*
C
      11.126928       11.126928
     101.052978      101.052978
            inf     1000.983901
            inf    10000.920417
            inf   100000.863282
*/