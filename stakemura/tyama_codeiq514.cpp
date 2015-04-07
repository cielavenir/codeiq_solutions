#include <random>
#include <cstdio>
#include <ctime>
#include <cmath>
#include <unistd.h>
using namespace std;
const double pi=acos(-1);
mt19937_64 engine((unsigned int)time(NULL)^(getpid()<<16));
#if 0
double randnorm(double mean,double sd){
	normal_distribution<double> distribution(mean, sd);
	return distribution(engine);
}
#else
uniform_real_distribution<double> distribution(0.0, 1.0);
double randnorm(double mean,double sd){
	double U=distribution(engine),W=distribution(engine);
	return sqrt(-2*log(U))*cos(2*pi*W)*sd+mean;
}
#endif
int main(){
	int N=100000,i=0,a=0;
	for(;i<N;i++){
		a+=randnorm(82,5)>randnorm(85,6);
	}
	printf("%.2f %.2f\n",a*100.0/N,(N-a)*100.0/N);
}
//C++11 35.15 64.85 (※プレイヤーAは約35%、プレイヤーBは約65%の勝率となる)
//念のためボックス=ミュラー法とnormal_distributionライブラリの両方を試したが誤りは見られなかった。