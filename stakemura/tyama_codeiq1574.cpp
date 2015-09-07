#include <deque>
#include <vector>
#include <algorithm>
#include <cstdio>
using namespace std;
int main(){
	const int width=64;
	deque<int> data={48, 36, 32, 32, 31, 31, 21, 24, 20, 16, 15, 12, 10, 8, 8, 8, 8, 5, 4, 3, 3, 2, 2, 1, 1, 1, 1, 1};

	//program
	sort(data.begin(),data.end());
	//reverse(data.begin(),data.end());
	for(;!data.empty();){
		int w=width;
		vector<int> v;
		auto it=data.end();
		for(;w;){
			//貪欲
			//ポインタ操作版はideoneだと動かないかもしれません
			//その場合はif 0をif 1に変更して下さい(計算量はわずかに落ちますが)
#if 0
			it=upper_bound(data.begin(),data.end(),w);
			if(it==data.begin())break;
			--it;
#else
			for(;it--!=data.begin()&&w<*it;);
			if(it<data.begin())break;
#endif
			v.push_back(*it);
			w-=*it;
			data.erase(it);
		}
		for(int i=0;i<v.size();i++)printf(i<v.size()-1?"%d,":"%d\n",v[i]);
	}
}

/*
48,16
36,21,5,2
32,32
31,31,2
24,20,15,4,1
12,10,8,8,8,8,3,3,1,1,1,1

C++14

//今回は転記ミスがないことを祈ります--;;;
*/