#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main(){
	string id,_data;
	int n,answer;
	for(;cin>>id>>n>>_data>>answer;){
		if(_data.size()==2){
			if(2!=answer)cout<<id<<endl;
		}else if(answer&&n%answer){
			cerr<<id<<": answer cannot divide n"<<endl;
			cout<<id<<endl;
		}else{
			vector<pair<int,int>>data;
			for(int i=0;i<_data.size();i+=3){
				//data.push_back({2*(_data[i]-'A'),2*(_data[i+1]-'A')});
				data.emplace_back(2*(_data[i]-'A'),2*(_data[i+1]-'A'));
			}
			int ans=0;
			for(int i=0;i<n;i++){
				for(auto &e:data){
					e.first=(e.first+1)%(2*n);
					e.second=(e.second+1)%(2*n);
				}
				for(auto &e:data){
					pair<int,int> x={(2*n-e.first)%(2*n),(2*n-e.second)%(2*n)};
					if(find(data.begin(),data.end(),x)==data.end()){
						x={x.second,x.first};
						if(find(data.begin(),data.end(),x)==data.end())goto next;
					}
				}
				ans+=1;
				next:;
			}
			if(ans!=answer)cout<<id<<endl;
		}
	}
}