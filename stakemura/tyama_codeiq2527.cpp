#include <vector>
#include <tuple>
#include <algorithm>
#include <cstdio>
#include <cmath>
using namespace std;
typedef tuple<double,double,double> tddd;

int main(){
	int n=0;
	double a,b,c;
	vector<tddd>v;
	for(;~scanf("%lf,%lf,%lf",&a,&b,&c);)v.emplace_back(a,b,c);
	printf("%d\n",max_element(v.begin(),v.end(),[&](tddd &x,tddd &y)->bool{
		double xa=get<0>(x),xb=get<1>(x),xc=get<2>(x);
		double ya=get<0>(y),yb=get<1>(y),yc=get<2>(y);
		// 指数変換 n=z**Math.log(n,z)
		// xb**xc * Math.log(xa) <=> yb**yc * Math.log(ya)
		// xb**xc * Math.log(xa) <=> (xb**Math.log(yb,xb))**yc * Math.log(ya)
		// xb**(xc - Math.log(yb,xb)*yc) <=> Math.log(ya)/Math.log(xa)
		return pow(xb,xc - log(yb)/log(xb)*yc) < log(ya)/log(xa);
	})-v.begin());
}