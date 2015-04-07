#include <vector>
#include <cmath>
#include <cstdio>
using namespace std;

#define p2(x) ((x)*(x))
#define mul(rx,ry,x1,y1,x2,y2) ((rx)=(x1)*(x2)-(y1)*(y2),(ry)=(x2)*(y1)+(x1)*(y2))
long double x[2],y[2],R=1;

bool check_placement(vector<pair<long double,long double> >speakers,vector<pair<long double,long double> >residents){
	for(auto &r:residents){
		bool ok=false;
		for(auto &s:speakers)if(hypot(r.first-s.first,r.second-s.second)<=R)ok=true;
		if(!ok)return false;
	}
	return true;
}

int main(){
	//最大被覆を求めるには、2点を通る円を求めれば良い。
	//ただし、少しの誤差が命取りとなるので、演算は全てlong doubleで行う。
	vector<pair<long double,long double> >speakers;
	vector<pair<long double,long double> >P;
	pair<long double,long double> p;
	for(long double a,b;~scanf("%Lf,%Lf",&a,&b);)P.push_back(make_pair(a,b));
	vector<pair<long double,long double> >residents=P;
	int N=P.size();
	for(;;){
		int M=1;
		for(int i=0;i<N;i++)for(int j=i+1;j<N;j++){
			long double hyp=hypotl(P[j].first-P[i].first,P[j].second-P[i].second);
			if(hyp>2*R)continue;
			//t=( p2(R)-p2(R)+p2(hyp) )/( 2*hyp );
			long double t=hyp/2;
			long double pl=sqrtl(p2(R)-p2(t));
			long double dx=(P[j].first-P[i].first)/hyp;
			long double dy=(P[j].second-P[i].second)/hyp;
			mul(x[0],y[0],dx,dy,t,pl);
			mul(x[1],y[1],dx,dy,t,-pl);
			for(int z=0;z<2;z++){
				x[z]+=P[i].first,y[z]+=P[i].second;
				if(x[z]<0||10<x[z] || y[z]<0||10<y[z])continue;
				int m=0;
				for(int k=0;k<N;k++)if(p2(P[k].first-x[z])+p2(P[k].second-y[z])<=p2(R))m++;
				if(M<m)M=m,p=make_pair(x[z],y[z]);
			}
		}
		if(M==1){
			for(int i=0;i<P.size();i++)speakers.push_back(P[i]);
			break;
		}
		//M=最大被覆数、p=その点
		speakers.push_back(p);
		for(int k=N-1;k>=0;k--)if(p2(P[k].first-p.first)+p2(P[k].second-p.second)<=p2(R))P.erase(P.begin()+k);
		N=P.size();
	}
	if(!check_placement(speakers,residents))puts("self test failed");
	for(auto &e:speakers)printf("%.20Lf, %.20Lf\n",e.first,e.second);
	return 0;
}
/*
C++11 0.01s

2.43542071350548048865, 7.98397378459145256550
1.99037304249628133263, 2.13492153598648775692
7.49425972710787431956, 8.66350237434042580800
4.17108873168713327560, 6.25215087808069654033
6.17166157306932488917, 7.08617515978905902242
1.72333334367779593952, 4.13706377173300359406
7.39018217919665015283, 3.50610241124384778796
0.60945977132766537821, 0.77657106368081451389
5.01231184824381314396, 8.18711557119160438650
7.82050004807189441409, 4.53070201189355535772
5.05412373629275709979, 5.19977108097811319999
0.30557745364011712000, 6.38599316801757769992
7.77891848363547569987, 7.45645763191579649979
0.45558184925013523001, 7.02321845923437490002
*/