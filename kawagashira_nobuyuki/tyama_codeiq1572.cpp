#include <random>
#include <cstdio>
#include <ctime>
#include <cmath>
#include <unistd.h>
using namespace std;
int main(){
	double pi=acos(-1);
	mt19937_64 engine((unsigned int)time(NULL)^(getpid()<<16));
	uniform_real_distribution<double> distribution(0.0, 1.0);
	for(int n=10;n<=1000000;n*=10){
		int r=0;
		for(int i=0;i<n;i++){
			double x=distribution(engine),y=distribution(engine);
			if(hypot(x,y)<=1)r++;
		}
		printf("n = %7d pi = %f error = %f\n",n,r*4.0/n,fabs(pi-r*4.0/n));
	}
}
/*
n =      10 pi = 3.200000 error = 0.058407
n =     100 pi = 3.040000 error = 0.101593
n =    1000 pi = 3.112000 error = 0.029593
n =   10000 pi = 3.130800 error = 0.010793
n =  100000 pi = 3.145640 error = 0.004047
n = 1000000 pi = 3.142384 error = 0.000791
*/