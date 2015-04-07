// CodeIQ 'smart median' test code
// Please improve performance or reduce memory usage of this algorithm

// 356400
// メモリ使用量について最適化。約1/40に。
// ただし実行速度は倍になってしまいました…。
#include <iostream>
#include <vector>
#include <map>
#include <algorithm>
int main(int argc, char* argv []){
#if 1
	std::map<int,int> m;
	int size=0,odd;
	for (int n0 = 1; n0 < 32; n0 += 1){
		for (int n1 = 1; n1 < 32; n1 += 1){
			for (int n2 = 1; n2 < 32; n2 += 1){
				for (int n3 = 1; n3 < 32; n3 += 1){
					for (int n4 = 1; n4 < 32; n4 += 1){
						m[n0*n1*n2*n3*n4]+=1;
						size+=1;
					}
				}
			}
		}
	}
	odd=size%2;
	size=(size-1)/2;
	for(std::map<int,int>::iterator it=m.begin();it!=m.end();++it){
		size-=it->second;
		if(size<=0){
			if(odd||size<0)std::cout<<it->first<<std::endl;
			else{
				std::map<int,int>::iterator itt=it;
				++itt;
				std::cout<<(it->first+itt->first)/2<<((it->first+itt->first)%2?".5":"")<<std::endl;
			}
			break;
		}
	}
#else
	std::vector<int> vec;
	for (int n0 = 1; n0 < 32; n0 += 1){
		for (int n1 = 1; n1 < 32; n1 += 1){
			for (int n2 = 1; n2 < 32; n2 += 1){
				for (int n3 = 1; n3 < 32; n3 += 1){
					for (int n4 = 1; n4 < 32; n4 += 1){
						vec.push_back(n0*n1*n2*n3*n4);
					}
				}
			}
		}
	}
	
	std::sort(vec.begin(), vec.end());
	std::cout << vec[(vec.size() + 1) / 2] << std::endl;
#endif
}