#include <vector>
#include <cstdio>
using namespace std;
const int M=10000000;

vector<long long> mult(const vector<long long> &x, const vector<long long> &y, const vector<long long> &T){
	int n=T.size();
	vector<long long> a(n);
	for(int i=0;i<n;i++)for(int j=0;j<n;j++){
		a[i^j]=(a[i^j]+T[i&j]*x[i]%M*y[j])%M;
	}
	return a;
}

int main(){
	//prepare T,e,a
	const vector<int> A={2,3,5};
	const int AN=A.size();
	vector<long long> T(1<<AN),e(1<<AN),a(1<<AN);
	for(int i=0;i<1<<AN;i++)T[i]=1;
	e[0]=a[0]=1;
	for(int i=0;i<AN;i++)a[1<<i]=1;
	for(int i=0;i<1<<AN;i++)for(int j=0;j<AN;j++)if(i&1<<j)T[i]*=A[j];

	//program
	long long n;
	for(scanf("%lld\n",&n);n;n>>=1){
		if(n&1)e=mult(e,a,T);
		a=mult(a,a,T);
	}
	printf("%lld\n",e[0]);
}