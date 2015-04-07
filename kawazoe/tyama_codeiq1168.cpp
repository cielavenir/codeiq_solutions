#include <cstdio>
#include <cstdlib>
using namespace std;
int main(int argc,char **argv){
	const int target=strtol(argv[1],NULL,10);
	long long sum=0;
#if 1
	for(long long mul=2;target-mul+1>=1;mul*=2){
		long long stop=target-mul+1;
		long long start=stop%mul;
		sum+=(((stop-start)/mul)+1)*(start+stop)/2;
	}
#else
	long long f=0;
	for(int i=2;i<=target;i+=2){
		int x=i;
		for(f=0;!(x&1);x>>=1)f++;
		sum+=f*(target-i+1);
	}
#endif
	printf("%lld\n",sum);
}
/*
【解答】：499999985653071859
【方針】：
以下、target=1000000000とする。
まず、求めるべきなのは、問題文の定義から、
sum=0
i=2
while i<=target
	sum+=(target-i+1)*(iが2で割り切れる回数)
	i+=2
end
puts sum
である。
ここで、「iが2で割り切れる回数」は1,2,1,3,1,2,1,4,...と規則性があるので、
sumは、和の和に定式化することができる。
sum=0
mul=2
while target-mul+1>=1
	sum+=(target-mul+1).step(1,-mul).reduce(:+)
	mul*=2
end
puts sum
ここで、(target-mul+1).step(1,-mul).reduce(:+)を最適化することを考える。
終点がわからなければ和の公式を適用できないため、まず終点を求める。
ここで、終点が0であっても計算結果に影響はないので、
終点は、(target-mul+1)%mulとして差し支えない。
これで、初項(target-mul+1)%mul、末項target-mul+1、公差mulの公差数列の和と決定できた。
公差数列の項数は((末項-初項)/公差)+1で求められるから、
公差数列の和は、(((末項-初項)/公差)+1)(初項+末項)/2となる。
最終的に求めるものは、
「初項2、末項targetを越えない最大値、公比2の公比数列」の各項をmulとしたときの、「初項(target-mul+1)%mul、末項target-mul+1、公差mulの公差数列の和」の和である。
【コード】：
*/