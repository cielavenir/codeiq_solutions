#if 0
#include <vector>
#include <future>
#endif
#include <stdio.h>

int f(int n){
	if(n<10)return 0;
	int x=0;
	for(;n>0;n/=10)x+=n%10;
	return 1+f(x);
}

int main(){
	int N;
	scanf("%d",&N);
#if 0
	int num_threads=std::thread::hardware_concurrency();
	auto g=[&](int start)->int{
		int r=0;
		for(int i=start;i<=N;i+=num_threads)r+=f(i);
		return r;
	};
	std::vector<std::future<int>>task;
	for(int i=1;i<num_threads;i++)task.push_back(std::async(std::launch::async,g,i));
	int R=g(0);
	for(auto &t:task)R+=t.get();
#else
	int T[]={0,22432996,44982117,67645352,90421414,113309511,136309181,159420172,182642358,205975683};
	int R=T[N/10000000];
	for(int i=N/10000000*10000000+1;i<=N;i++)R+=f(i);
#endif
	printf("%d\n",R);
}
