#include <vector>
#include <algorithm>
#include <cstdio>
using namespace std;

int N,B;
vector<pair<pair<int,int>,short> >item;//<value,weight>,i
vector<int>bag;
vector<short>back;
int main(){
	int i,j,r,m;
	scanf("%d%d",&N,&B);
	item.resize(N);
	bag.resize(B+1);
	back.resize(B+1);bag[0]=1;
	for(i=0;i<N;i++)scanf("%d%d",&item[i].first.first,&item[i].first.second),item[i].second=i;
	for(i=0;i<N;i++){
		//if(i%1000==0)fprintf(stderr,"%d\n",i);
		for(j=B;j>=item[i].first.second;j--){
			if(bag[j-item[i].first.second]&&bag[j]<bag[j-item[i].first.second]+item[i].first.first){
				//if(bag[j]<bag[j-item[i].first.second]+item[i].first.first){
					bag[j]=bag[j-item[i].first.second]+item[i].first.first;
					back[j]=i;//.clear();
				//}
				//back[j].push_back(i);
			}
		}
	}
	printf("%d\n",bag[B]-1);
	printf("%d\n",back[B]);
/*
	for(r=i=0;i<=B;i++){
		if(r<bag[i]){
			r=bag[i];
			m=i;
		}
	}
	printf("%d\n",r-1); // 55981684
	//printf("%d\n",m); // 37317001
*/
}