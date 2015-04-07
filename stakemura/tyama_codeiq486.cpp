#include <random>
#include <cstdio>
#include <ctime>
#include <unistd.h>
using namespace std;
mt19937_64 engine((unsigned int)time(NULL)^(getpid()<<16));
uniform_real_distribution<double> distribution(0.0, 1.0);
double randtri(double a,double b,double c){
	//According to http://www.ntrand.com/jp/triangular-distribution/
	double U=distribution(engine);
	if(U<(c-a)/(b-a)){
		return sqrt(U*(c-a)*(b-a))+a;
	}else{
		return -sqrt((1-U)*(b-c)*(b-a))+b;
	}
}
int main(){
	int N=10000,i=0,a=0;
	for(;i<N;i++){
		a+=randtri(61,100,85)>randtri(75,97,82);
	}
	printf("%.2f %.2f\n",a*100.0/N,(N-a)*100.0/N);
}
//C++11 40.87 59.13 (※プレイヤーAは約41%、プレイヤーBは約59%の勝率となる)