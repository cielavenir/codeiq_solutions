#include <vector>
#include <cstdio>
using namespace std;

int main(int argc,char **argv){
	long long N=10000000;
	vector<int>digits={1, 2, 4, 5, 7, 8};

	long long cur=digits.size(),cur2=cur;
	vector<long long>power={1};
	for(;cur2<N;){
		power.push_back(cur);
		cur*=digits.size();
		cur2+=cur;
	}
	power.push_back(cur);
	cur2-=cur;
	//printf("%lld\n",cur2); //2015538
	N-=cur2;
	N-=1;
	for(int i=power.size()-1;i>0;i--)printf("%d",digits[N%power[i]/power[i-1]]);
	puts(""); //775178155
}
/*
【解答】：775178155
【方針】：
与えられた数を1〜8、11〜88、111〜888と続く変形6進法に直せば良い。
\sum_{k=1}^{8}6^k=2015538となり、これは10^7を越えない最大である。
よって、10^7からこれを引けば、普通の6進法として処理できる。
なお、この6進法は0-indexedであるため、さらに1を引く必要がある。
一応コード上では6という数値をハードコーディングしないようにしました。

## 最初包除原理かと思って焦りました…。
【コード】：
*/