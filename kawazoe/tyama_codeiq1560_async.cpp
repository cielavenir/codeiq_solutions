#include <vector>
#include <future>
#include <cstdio>

int N=10,F[]={3,5,7,11,13,17,19,23,29,31};
long long solve(long long ma){
	int num_threads=std::thread::hardware_concurrency();
	auto f=[&](long long start)->long long{
		long long r=0;
		for(long long i=start;i<ma;i+=num_threads){
			int j=0;
			for(;j<N;j++)if(i%F[j]==0)break;
			if(j<N)r+=i;
		}
		return r;
	};
	std::vector<std::future<long long>>task;
	for(int i=1;i<num_threads;i++)task.push_back(std::async(std::launch::async,f,i));
	long long r=f(0);
	for(auto &t:task)r+=t.get();
	return r;
}
int main(){
	printf("%lld\n",solve(100000));
	printf("%lld\n",solve(1000000000));
}
