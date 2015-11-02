#include <vector>
#include <algorithm>
#include <cstdio>
using namespace std;

int main(){
	vector<double> a(3);
	scanf("%lf,%lf,%lf",&a[0],&a[1],&a[2]);
	int idx=0;
	for(int i=1;i<3;i++)if(a[idx]<a[i])idx=i;
	sort(a.begin(),a.end());
	if(a[0]*a[0]+a[1]*a[1]==a[2]*a[2])
		putchar(65+idx);
	else
		putchar('x');
}